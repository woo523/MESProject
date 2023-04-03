package com.itwillbs.material.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.PageDTO;
import com.itwillbs.material.domain.StockDTO;
import com.itwillbs.material.service.MaterialService;
import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.ItemDTO;


@Controller
public class MaterialController {
	
	@Inject
	private MaterialService materialService;
	
	@RequestMapping(value = "/material/inmaterList", method = RequestMethod.GET)
	public String inmeterList(HttpServletRequest request, Model model, PageDTO pageDTO) {
		System.out.println("MaterialController inmaterList()");

		String whouse = request.getParameter("whouse");
		String pcd = request.getParameter("pcd");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String ccd = request.getParameter("ccd");

		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5 ; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);
		
		Map<String, Object> search = new HashMap<>();
		search.put("whouse", whouse);
		search.put("startDate", startDate);
		search.put("endDate", endDate);
		search.put("pcd", pcd);
		search.put("ccd", ccd);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		
		List<Map<String,Object>> inmaterList;
		if(whouse == null && pcd == null && startDate == null && endDate == null && ccd == null){
			
			inmaterList = materialService.getInmaterLiMap(pageDTO);		
		
		}else {
		
			inmaterList = materialService.getInmaterLiMap(search);
			
		}
		//페이징 처리
		int count = materialService.countMtrlLi(search);
		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		System.out.println("endPage :"+pageDTO.getEndPage());
		System.out.println("count :"+pageDTO.getCount());		
		model.addAttribute("inmaterList", inmaterList);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		
		return "material/inmaterList";
	}
		
	@RequestMapping(value = "/material/itemList", method = RequestMethod.GET)
	public String itemList(Model model, HttpServletRequest request, PageDTO pageDTO) {

		String itemNum = request.getParameter("itemNum");
		String itemName = request.getParameter("itemName");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("itemNum", itemNum);
		search.put("itemName", itemName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<ItemDTO> itemList = materialService.getItemlist(search);
			
		//페이징 처리
		int count = materialService.countItemlist(search);

		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		model.addAttribute("itemList", itemList);
		
		return "material/itemList";
	}
	
	@RequestMapping(value = "/material/clientList", method = RequestMethod.GET)
	public String clientList(Model model, HttpServletRequest request, PageDTO pageDTO) {

		String clientCode = request.getParameter("clientCode");
		String clientName = request.getParameter("clientName");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("clientCode", clientCode);
		search.put("clientName", clientName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<ClientDTO> clientList = materialService.getClientlist(search);
			
		//페이징 처리
		int count = materialService.countClientlist(search);

		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		model.addAttribute("clientList", clientList);				

		return "material/clientList";
	}
	
	@RequestMapping(value = "/material/immodi", method = RequestMethod.GET)
	public String immodi(HttpServletRequest request) {
		String inmaterId = request.getParameter("inmaterId");
		
		return "material/inmater";
	}
	
	
	@RequestMapping(value = "/material/outmaterList", method = RequestMethod.GET)
	public String outmeterList(HttpServletRequest request, Model model, PageDTO pageDTO) {
		System.out.println("MaterialController outmaterList()");

		String whouse = request.getParameter("whouse");
		String pcd = request.getParameter("pcd");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String ccd = request.getParameter("ccd");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5 ; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);
		
		Map<String, Object> search = new HashMap<>();
		search.put("whouse", whouse);
		search.put("startDate", startDate);
		search.put("endDate", endDate);
		search.put("pcd", pcd);
		search.put("ccd", ccd);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		
		List<Map<String, Object>> outmaterList;
	if(whouse == null && pcd == null && startDate == null && endDate == null && ccd == null){
			
		outmaterList =  materialService.getOutmaterLiMap(pageDTO);		
	
	}else{
		
		outmaterList = materialService.getOutmaterLiMap(search);			
	}
	
	//페이징 처리
	int count = materialService.countOutLi(search);
	
	int pageBlock = 10;
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;
	int endPage=startPage+pageBlock-1;
	int pageCount=count/pageSize+(count%pageSize==0?0:1);
	if(endPage > pageCount){
	 	endPage = pageCount;
	 }
	
	pageDTO.setCount(count);
	pageDTO.setPageBlock(pageBlock);
	pageDTO.setStartPage(startPage);
	pageDTO.setEndPage(endPage);
	pageDTO.setPageCount(pageCount);

	System.out.println("endPage :"+pageDTO.getEndPage());
	System.out.println("count :"+pageDTO.getCount());
	model.addAttribute("outmaterList", outmaterList);
	model.addAttribute("pageDTO", pageDTO);
	model.addAttribute("search", search);
	
	return "material/outmaterList";
	}
	
	@RequestMapping(value = "/material/materialState", method = RequestMethod.GET)
	public String materialState(HttpServletRequest request, Model model, PageDTO pageDTO) {
		System.out.println("MaterialController materialState()");

		String mtrltype = request.getParameter("mtrltype");
		String pcd = request.getParameter("pcd");
		System.out.println("mtrltype :"+mtrltype);
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10 ; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);		
		
		Map<String, Object> search = new HashMap<>();
		search.put("mtrltype", mtrltype);
		search.put("pcd", pcd);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		
		List<Map<String,Object>> materialState;
		if(mtrltype == null && pcd == null){
			
			materialState = materialService.mtrlStateList(pageDTO);		
		
		}else {
						
			materialState = materialService.mtrlStateList(search);
			
		}
		
		//페이징 처리
		int count = materialService.countStateLi(search);
		
		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		
		System.out.println("endPage :"+pageDTO.getEndPage());
		System.out.println("count :"+pageDTO.getCount());
		model.addAttribute("materialState", materialState );
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		
		return "material/materialState";
	}
	
	// 입고 삭제창
	@RequestMapping(value = "/material/del", method = RequestMethod.GET)
	public String del(HttpServletRequest request, Model model) { 
		int inmtrlNum = Integer.parseInt(request.getParameter("inmtrlNum"));
		
		materialService.delPf(inmtrlNum);
		
		return "redirect:/material/inmaterList";
	}
	
	// 자재입고 등록
	@RequestMapping(value = "/material/inmtrlInsert", method = RequestMethod.GET)
	public String inmtrlInsert() {
		System.out.println("MaterialController inmtrlInsert()");

		return "material/inmtrlInsert";
	}	
	
	// 자재입고 등록
	@RequestMapping(value = "/material/inmtrlInsertPro", method = RequestMethod.POST)
	public String inmtrlInsertPro(HttpServletRequest request) {
		System.out.println("MaterialController inmtrlInsertPro()");
		
		InmaterialDTO inmaterialDTO = new InmaterialDTO();
		
		inmaterialDTO.setInmtrlNum(request.getParameter("inmtrlNum"));
		inmaterialDTO.setInsertId(request.getParameter("insertId"));
		
		String date = request.getParameter("inmtrlDt");
		Date inmtrlDt = Date.valueOf(date);
		inmaterialDTO.setInmtrlDt(inmtrlDt);
		
		inmaterialDTO.setItemId(Integer.parseInt(request.getParameter("pcd")));
		inmaterialDTO.setClntId(Integer.parseInt(request.getParameter("ccd")));
		
		inmaterialDTO.setInmtrlQty(Integer.parseInt(request.getParameter("materialQty")));
		inmaterialDTO.setInmtrlLot(Integer.parseInt(request.getParameter("inmtrlLot")));
		inmaterialDTO.setNote(request.getParameter("note"));
		
		materialService.insertInmtrl(inmaterialDTO);
		System.out.println(inmaterialDTO);
		
		return "redirect:/material/inmtrlInsert";
	}
	
	// 실사량
	@RequestMapping(value = "/material/addList", method = RequestMethod.GET)
	public String addList(HttpServletRequest request, Model model) {
		System.out.println("MaterialController addList()");

		
		return "material/addList";
	}
	
	// 실사량
	@RequestMapping(value = "/material/addListPro", method = RequestMethod.POST)
	public String addListPro() {
		System.out.println("MaterialController addListPro()");
		
		
		return "redirect:/material/addList";
	}
}	
