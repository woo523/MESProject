package com.itwillbs.ship.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.ship.domain.ClntDTO;
import com.itwillbs.ship.domain.MaterialDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.service.ShipService;
import com.itwillbs.work.domain.ItemDTO;

@Controller
public class ShipController {
	
	@Inject
	private ShipService shipService;
	
	
	@RequestMapping(value = "/ship/shipInsert", method = RequestMethod.GET)
	public String shipInsert() {
			return "ship/shipInsert";
	}
	
	@RequestMapping(value = "/ship/shipInsertPro", method = RequestMethod.GET)
	public String shipInsertPro(ShipDTO shipDTO,HttpServletRequest request) {
		System.out.println("ShipController shipInsertPro()");
		
		// 수주번호 규격코드
		String shipDt = request.getParameter("shipDt");
		String date = shipDt.replaceAll("-", "");
		String date1 = date.substring(2);
		int count = shipService.shipSCount() + 1;
		System.out.println("확인 count:"+count);
		String shipNum = String.format("OT%s%05d", date1, count);
		
		shipDTO.setShipNum(shipNum);
		
		shipService.insertShip(shipDTO);
		
		return "redirect:/ship/shipAdmin";
	}
	
	
	// 출하현황
	@RequestMapping(value="/ship/shipList", method = RequestMethod.GET)
	public String shipList(HttpServletRequest request,Model model, PageDTO pageDTO) {
		System.out.println("ShipController shipList()");
		
		// 조회값들
		String shipId = request.getParameter("shipId");
		String shipNum = request.getParameter("shipNum");
		
		String clntId = request.getParameter("clntId");
		String clntCd = request.getParameter("clntCd");
		String clntNm = request.getParameter("clntNm");
		
		String Dlvdate = request.getParameter("Dlvdate");
		String Shdate = request.getParameter("Shdate");
		
		String userNum = request.getParameter("userNum");
		String userNm = request.getParameter("userNm");
		String userId = request.getParameter("userId");
		
		String itemNum = request.getParameter("itemNum");
		String itemNm = request.getParameter("itemNm");
		String invntUnit = request.getParameter("invntUnit");
		String shipQty = request.getParameter("shipQty");
		String shipCond = request.getParameter("shipCond");
		
		// 한 화면에 보여줄 글 개수 설정
			int pageSize=5;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			//pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);
		
		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		
		search.put("shipId", shipId);
		search.put("shipNum", shipNum);
		
		search.put("clntCd", clntCd);
		search.put("clntNm", clntNm);
		search.put("clntId", clntId);
		
		search.put("Dlvdate", Dlvdate);
		search.put("Shdate", Shdate);
		
		search.put("userNum", userNum);
		search.put("userNm", userNm);
		search.put("userId", userId);
		
		search.put("itemNum", itemNum);
		search.put("itemNm", itemNm);
		search.put("invntUnit", invntUnit);
		search.put("shipQty", shipQty);
		search.put("shipCond", shipCond);
		
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		
		List<Map<String,Object>> shipList;
		if(shipId == null && shipNum == null && clntNm == null && Dlvdate == null
				&& userNm == null && itemNum == null && itemNm == null && invntUnit == null
				&& Shdate == null && shipQty == null && shipCond == null)
		{
		// 조회 안한 경우
			shipList = shipService.getListMap(pageDTO); // page만 필요해서
		
		}else { // 조회값 넣은 경우
			shipList = shipService.getListShipMap(search);
			
		}
		
		//페이징 처리
		int count = shipService.countListShip(search);
		
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
		model.addAttribute("shipList", shipList); 
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		
		
		return "ship/shipList";		
	}
	
//	출하관리
	@RequestMapping(value="/ship/shipAdmin", method = RequestMethod.GET)
	public String shipAdmin(Model model, HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("ShipController shipAdmin()");
		
		String insertId = request.getParameter("insertId");
		String insertDt = request.getParameter("insertDt");
		String shipNum = request.getParameter("shipNum");
		String shipDt = request.getParameter("shipDt");
		String itemNum = request.getParameter("itemNum");
		String itemName = request.getParameter("itemName");
		String barcord = request.getParameter("barcord");
		String itemUnit = request.getParameter("itemUnit");
		String amount = request.getParameter("amount");
		String clntId = request.getParameter("clntId");
		
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
		search.put("insertId", insertId);
		search.put("insertDt", insertDt);
		search.put("shipNum", shipNum);
		search.put("shipDt", shipDt);
		search.put("itemNum", itemNum);
		search.put("itemName", itemName);
		search.put("barcord", barcord);
		search.put("itemUnit", itemUnit);
		search.put("amount", amount);
		search.put("clntId", clntId);
		
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		
		
		List<Map<String,Object>> shipAdmin1;
		if(insertId == null && insertDt ==null && shipNum==null && shipDt==null && itemNum==null && itemName==null && barcord==null && itemUnit==null && amount==null && clntId==null) {
			// 조회 안한 경우
			shipAdmin1 = shipService.getShipMap(pageDTO); // page만 필요해서
		
		}else { 
			// 조회값 넣은 경우
			shipAdmin1 = shipService.getShipMap(search);
		}
		
		//페이징 처리
		int count = shipService.countListShip(search);
		
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
		model.addAttribute("shipAdmin1", shipAdmin1); 
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		
		return "ship/shipAdmin";
		
	}
	
	// 제품정보
	@RequestMapping(value = "/ship/itemInfo", method = RequestMethod.GET)
	public String itemInfo(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String itemNum = request.getParameter("itemNum");
		String itemNm = request.getParameter("itemNm");
		String invntUnit = request.getParameter("invntUnit");
		
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
		
		pageDTO.setStartRow(startRow-1); 
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("itemNum", itemNum);
		search.put("itemNm", itemNm);
		search.put("invntUnit", invntUnit);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<ItemDTO> itemInfo = shipService.getItemList(search);
			
		//페이징 처리
		int count = shipService.countItemList(search);

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
		model.addAttribute("itemInfo", itemInfo);
		return "ship/itemInfo";
	}
	
	// 출하정보
	@RequestMapping(value = "/ship/shipInfo", method = RequestMethod.GET)
	public String shipInfo(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String shipNum = request.getParameter("shipNum");
		String shipQty = request.getParameter("shipQty");
		String shipDt = request.getParameter("shipDt");
		
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
		
		pageDTO.setStartRow(startRow-1); 
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("shipNum", shipNum);
		search.put("shipQty", shipQty);
		search.put("shipDt", shipDt);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<ShipDTO> shipInfo = shipService.getInfoList(search);
			
		//페이징 처리
		int count = shipService.countInfoList(search);

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
		model.addAttribute("shipInfo", shipInfo);
		return "ship/shipInfo";
	}
	
	// 재고정보
	@RequestMapping(value = "/ship/mtrInfo", method = RequestMethod.GET)
	public String mtrInfo(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String curStock = request.getParameter("curStock");
		String whouse = request.getParameter("whouse");
		String inmtrlDt = request.getParameter("inmtrlDt");
		String outmtrlDt = request.getParameter("outmtrlDt");
		String shipSch = request.getParameter("shipSch");
		
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
		
		pageDTO.setStartRow(startRow-1); 
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("curStock", curStock);
		search.put("whouse", whouse);
		search.put("inmtrlDt", inmtrlDt);
		search.put("outmtrlDt", outmtrlDt);
		search.put("shipSch", shipSch);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<MaterialDTO> mtrInfo = shipService.getMtrList(search);
			
		//페이징 처리
		int count = shipService.countMtrList(search);

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
		model.addAttribute("mtrInfo", mtrInfo);
		return "ship/mtrInfo";
	}
	
	// 고객정보
	@RequestMapping(value = "/ship/clntInfo", method = RequestMethod.GET)
	public String clntInfo(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String clntCd = request.getParameter("clntCd");
		String clntNm = request.getParameter("clntNm");
		String clntId = request.getParameter("clntId");
		
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
		
		pageDTO.setStartRow(startRow-1); 
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("clntCd", clntCd);
		search.put("clntNm", clntNm);
		search.put("clntId", clntId);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<ClntDTO> clntInfo = shipService.getClntList(search);
			
		//페이징 처리
		int count = shipService.countClntList(search);

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
		model.addAttribute("clntInfo", clntInfo);
		return "ship/clntInfo";
	}
	
	@RequestMapping(value = "/ship/shupdate", method = RequestMethod.GET)
	public String shupdate(HttpServletRequest request, Model model) {
		System.out.println("ShipController shupdate()");
		
		int shipId=Integer.parseInt(request.getParameter("shipId"));
		
		ShipDTO shipDTO=shipService.getShip(shipId);
		
		model.addAttribute("shipDTO", shipDTO);
		
		return "order/shupdate";
	}
	
	@RequestMapping(value = "/ship/shupdatePro", method = RequestMethod.POST)
	public String shupdatePro(ShipDTO shipDTO,HttpServletRequest request) {
		System.out.println("ShipController shupdatePro()");
		
		System.out.println("shipDTO 값" +shipDTO);
		shipService.updateShip(shipDTO);
		int shipId=Integer.parseInt(request.getParameter("shipId"));
		shipDTO=shipService.getShip(shipId);

		return "redirect:/ship/shipAdmin";
	}
	
	@RequestMapping(value = "/ship/shdelete", method = RequestMethod.GET)
	public String shdelete(HttpServletRequest request, Model model) {
		System.out.println("ShipController delete()");
		int shipId=Integer.parseInt(request.getParameter("shipId"));
		shipService.deleteShip(shipId);
		return "redirect:/ship/shipAdmin";
	}
	
	
}