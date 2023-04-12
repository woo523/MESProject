package com.itwillbs.material.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.OutmaterialDTO;
import com.itwillbs.material.domain.PageDTO;
import com.itwillbs.material.domain.StockDTO;
import com.itwillbs.material.service.MaterialService;
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
	
	
	@RequestMapping(value = "/material/outmaterList", method = RequestMethod.GET)
	public String outmeterList(HttpServletRequest request, Model model, PageDTO pageDTO) {
		System.out.println("MaterialController outmaterList()");

		String whouse = request.getParameter("whouse");
		String pcd = request.getParameter("pcd");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String ccd = request.getParameter("ccd");
		
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
	
	// 입고 삭제
	@RequestMapping(value = "/material/del", method = RequestMethod.GET)
	public String del(HttpServletRequest request) { 
		System.out.println("MaterialController del()");
		
		int inmtrlId = Integer.parseInt(request.getParameter("inmtrlId"));		
		materialService.deleteInmtrl(inmtrlId);

		return "redirect:/material/inmaterList";
	}
	
	// 입고 수정
	@RequestMapping(value = "/material/inmtrlModify", method = RequestMethod.GET)
	public String inmtrlModify(HttpServletRequest request, Model model) {
		System.out.println("MaterialController inmtrlModify()");
		
		int inmtrlId = Integer.parseInt(request.getParameter("inmtrlId"));
		
		InmaterialDTO inmaterialDTO = materialService.getInmtrl(inmtrlId);
		
		Map<String, Object> getInmtrl = materialService.getInmtrlMap(inmaterialDTO.getInmtrlId()); // 품명 가져오기 위해
		
		model.addAttribute("inmaterialDTO", inmaterialDTO);
		model.addAttribute("getInmtrl", getInmtrl);
		
		System.out.println("폼 : " + inmtrlId);		
		
		return "material/inmtrlModify";
	}
	
	// 입고 수정
	@RequestMapping(value = "/material/inmtrlModifyPro", method = RequestMethod.POST)
	public String inmtrlModifyPro(InmaterialDTO inmaterialDTO, HttpSession session) {
		System.out.println("MaterialController inmtrlModifyPro()");
		
		String id = (String)session.getAttribute("id");
		inmaterialDTO.setUpdateId(id);
		inmaterialDTO.setUpdateDt(new Timestamp(System.currentTimeMillis()));
		
		materialService.updateInmtrl(inmaterialDTO);
		
		return "redirect:/common/offwindow";
	}
	
	// 자재입고 등록
	@RequestMapping(value = "/material/inmtrlInsert", method = RequestMethod.GET)
	public String inmtrlInsert() {
		System.out.println("MaterialController inmtrlInsert()");

		return "material/inmtrlInsert";
	}	
	
	// 자재입고 등록
	@RequestMapping(value = "/material/inmtrlInsertPro", method = RequestMethod.POST)
	public String inmtrlInsertPro(InmaterialDTO inmaterialDTO, HttpServletRequest request) {
		System.out.println("MaterialController inmtrlInsertPro()");
		String date = inmaterialDTO.getInmtrlDt(); // 등록 날짜
		String date2 = date.replaceAll("-", ""); // "-" 빼기
		String date3 = date2.substring(2);
		int count = materialService.countMtrlLi(null)+1; // 입고 리스트 갯수+1
		String inmtrlNum = String.format("IN%s%05d", date3,count); // 규격코드 만들기
		System.out.println("규격코드:"+inmtrlNum);
		inmaterialDTO.setInmtrlNum(inmtrlNum);
		inmaterialDTO.setInsertDt(new Timestamp(System.currentTimeMillis()));
		inmaterialDTO.setInsertId(request.getParameter("insertId"));
		int curStock = materialService.getinStock(inmaterialDTO.getItemId());
		int incurStock = curStock + inmaterialDTO.getInmtrlQty();
		inmaterialDTO.setIncurStock(incurStock);
		materialService.updateinStock(inmaterialDTO);
		materialService.updateinStorage(inmaterialDTO);
		materialService.insertInmtrl(inmaterialDTO);
		System.out.println(inmaterialDTO);
		
		return "redirect:/common/offwindow";
	}

	
	// 출고 삭제
	@RequestMapping(value = "/material/outDel", method = RequestMethod.GET)
	public String outDel(HttpServletRequest request) { 
		System.out.println("MaterialController outDel()");
		
		int outmtrlId = Integer.parseInt(request.getParameter("outmtrlId"));		
		materialService.deleteOutmtrl(outmtrlId);
		
		return "redirect:/material/outmaterList";
	}
	
	
	// 자재출고 등록
	@RequestMapping(value = "/material/outmtrlInsert", method = RequestMethod.GET)
	public String outmtrlInsert() {
		System.out.println("MaterialController outmtrlInsert()");

		return "material/outmtrlInsert";
	}	
	
	// 자재출고 등록
	@RequestMapping(value = "/material/outmtrlInsertPro", method = RequestMethod.POST)
	public String outmtrlInsertPro(OutmaterialDTO outmaterialDTO, HttpServletRequest request) {
		System.out.println("MaterialController outmtrlInsertPro()");
		String date = outmaterialDTO.getOutmtrlDt(); // 등록 날짜
		String date2 = date.replaceAll("-", ""); // "-" 빼기
		String date3 = date2.substring(2);
		int count = materialService.countOutLi(null)+1; // 입고 리스트 갯수+1
		String outmtrlNum = String.format("IN%s%05d", date3,count); // 규격코드 만들기

		System.out.println("규격코드:"+outmtrlNum);
		outmaterialDTO.setOutmtrlNum(outmtrlNum);
		outmaterialDTO.setInsertDt(new Timestamp(System.currentTimeMillis()));
		outmaterialDTO.setInsertId(request.getParameter("insertId"));

		
		materialService.insertOutmtrl(outmaterialDTO);
		System.out.println(outmaterialDTO);
		
		
		return "redirect:/common/offwindow";
	}
	
	// 출고 수정
	@RequestMapping(value = "/material/outmtrlModify", method = RequestMethod.GET)
	public String outmtrlModify(HttpServletRequest request, Model model) {
		System.out.println("MaterialController outmtrlModify()");
		
		int outmtrlId = Integer.parseInt(request.getParameter("outmtrlId"));
		
		OutmaterialDTO outmaterialDTO = materialService.getOutmtrl(outmtrlId);
		
		Map<String, Object> getOutmtrl = materialService.getOutmtrlMap(outmaterialDTO.getOutmtrlId()); // 품명 가져오기 위해
		
		model.addAttribute("outmaterialDTO", outmaterialDTO);
		model.addAttribute("getOutmtrl", getOutmtrl);
		
		System.out.println("폼 : " + outmtrlId);		
		
		return "material/outmtrlModify";
	}
	
	// 출고 수정
	@RequestMapping(value = "/material/outmtrlModifyPro", method = RequestMethod.POST)
	public String outmtrlModifyPro(OutmaterialDTO outmaterialDTO, HttpSession session) {
		System.out.println("MaterialController outmtrlModifyPro()");
		
		String id = (String)session.getAttribute("id");
		outmaterialDTO.setUpdateId(id);
		outmaterialDTO.setUpdateDt(new Timestamp(System.currentTimeMillis()));
		
		materialService.updateOutmtrl(outmaterialDTO);
		
		return "redirect:/common/offwindow";
	}
	
	// 실사량
	@RequestMapping(value = "/material/quantity", method = RequestMethod.GET)
	public String quantity(HttpServletRequest request, Model model) {
		System.out.println("MaterialController quantity()");
		
		int stockId = Integer.parseInt(request.getParameter("stockId"));
		
		StockDTO stockDTO = materialService.getStock(stockId);
		
		model.addAttribute("stockDTO", stockDTO);
		
		System.out.println("폼 : " + stockId);		
		
		return "material/quantity";
	}
	
	// 실사량
	@RequestMapping(value = "/material/quantityPro", method = RequestMethod.POST)
	public String quantityPro(StockDTO stockDTO, HttpSession session) {
		System.out.println("MaterialController quantityPro()");
		
		String id = (String)session.getAttribute("id");
		stockDTO.setUpdateId(id);
		stockDTO.setUpdateDt(new Timestamp(System.currentTimeMillis()));
		
		materialService.updateStock(stockDTO);
		
		return "redirect:/common/offwindow";
	}
	
}	
