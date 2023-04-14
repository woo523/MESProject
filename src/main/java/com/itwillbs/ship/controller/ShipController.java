package com.itwillbs.ship.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.ship.domain.ClntDTO;
import com.itwillbs.ship.domain.MaterialDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.service.ShipService;
import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.work.domain.PerformDTO;
import com.itwillbs.work.service.PerformService;

@Controller
public class ShipController {
	
	@Inject
	private ShipService shipService;
	

	
	@RequestMapping(value = "/ship/shipInsert", method = RequestMethod.GET)
	public String shipInsert(HttpServletRequest request, Model model) {
		
			int ordId = Integer.parseInt(request.getParameter("ordId"));
			Map<String, Object> ordlist = shipService.getorder(ordId);
			
			model.addAttribute("ordlist", ordlist);
			
			return "ship/shipInsert";
	}
	
	@RequestMapping(value = "/ship/shipInsertPro", method = RequestMethod.POST)
	public String shipInsertPro(ShipDTO shipDTO) {
		System.out.println("ShipController shipInsertPro()");
		
		// 수주번호 규격코드
		String shipDt = shipDTO.getShipDt();
		String date = shipDt.replaceAll("-", "");
		String date1 = date.substring(2);
		int count = shipService.shipSCount() + 1;
		System.out.println("확인 count:"+count);
		String shipNum = String.format("SP%s%05d", date1, count);
		
		shipDTO.setShipNum(shipNum);
		shipDTO.setInsertDt(new Timestamp(System.currentTimeMillis()));
		shipDTO.setCmpltYn("N");
		shipService.insertShip(shipDTO);
		shipService.delStock(shipDTO);
		shipService.delStorage(shipDTO);

		
		return "redirect:/common/offwindow";
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
		String sshdate = request.getParameter("sshdate");
		
		
		
		
		
		String userNum = request.getParameter("userNum");
		String userNm = request.getParameter("userNm");
		String userId = request.getParameter("userId");
		
		String itemNum = request.getParameter("itemNum");
		String itemNm = request.getParameter("itemNm");
		String invntUnit = request.getParameter("invntUnit");
		String shipQty = request.getParameter("shipQty");
		String cmpltYn = request.getParameter("cmpltYn");
		
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
		search.put("sshdate", sshdate);
		
		search.put("userNum", userNum);
		search.put("userNm", userNm);
		search.put("userId", userId);
		
		search.put("itemNum", itemNum);
		search.put("itemNm", itemNm);
		search.put("invntUnit", invntUnit);
		search.put("shipQty", shipQty);
		search.put("cmpltYn", cmpltYn);
		
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		int count;
		List<Map<String,Object>> shipList;
		if(shipId == null && shipNum == null && clntNm == null && Dlvdate == null
				&& userNm == null && itemNum == null && itemNm == null && invntUnit == null
				&& sshdate == null && shipQty == null && cmpltYn == null)
		{
		// 조회 안한 경우
			shipList = shipService.getListMap(pageDTO); // page만 필요해서
			count = shipService.countListShipp();
			
		
		}else { // 조회값 넣은 경우
			shipList = shipService.getListShipMap(search);
			count = shipService.countListShip(search);
			
		}
		
		//페이징 처리
		
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
//		System.out.println("cmpltYn"+shipList.get(0).get("cmpltYn"));
		model.addAttribute("shipList", shipList); 
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		
		
		return "ship/shipList";		
	}
	
//	출하관리
	@RequestMapping(value="/ship/shipAdmin", method = RequestMethod.GET)
	public String shipAdmin(Model model, HttpServletRequest request, PageDTO pageDTO) {
		
		try {
		System.out.println("ShipController shipAdmin()");
		
		String Dlvdate = request.getParameter("Dlvdate");
		String eDlvdate = request.getParameter("eDlvdate");
		
		String clntNm = request.getParameter("clntNm");
		
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

		

		search.put("Dlvdate", Dlvdate);
		search.put("eDlvdate", eDlvdate);

		
		search.put("clntNm", clntNm);
		
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		
		
		List<Map<String,Object>> shipAdmin1;
		if( Dlvdate==null && eDlvdate ==null && clntNm==null) {
			// 조회 안한 경우
			shipAdmin1 = shipService.getShipMap(pageDTO); // page만 필요해서
		
		}else { 
			// 조회값 넣은 경우
			shipAdmin1 = shipService.getSearchShipMap(search);
		}
		System.out.println("itemNm"+shipAdmin1.get(0).get("itemNm"));
		
		//페이징 처리
		int count = shipService.countShip(search);
		
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
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ship/shipAdmin";
	}
	
	// 제품정보
	@RequestMapping(value = "/ship/itemInfo", method = RequestMethod.GET)
	public String itemInfo(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String itemNum = request.getParameter("itemNum");
		String itemNm = request.getParameter("itemNm");
		String invntUnit = request.getParameter("invntUnit");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 3; // sql문에 들어가는 항목
		
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
//	@RequestMapping(value = "/ship/shipInfo", method = RequestMethod.GET)
//	public String shipInfo(Model model, HttpServletRequest request, PageDTO pageDTO) { 
//		String shipNum = request.getParameter("shipNum");
//		String shipQty = request.getParameter("shipQty");
//		String shipDt = request.getParameter("shipDt");
//		
//		// 한 화면에 보여줄 글 개수 설정
//		int pageSize = 3; // sql문에 들어가는 항목
//		
//		// 현페이지 번호 가져오기
//		String pageNum = request.getParameter("pageNum");
//		if(pageNum==null) {
//			pageNum="1";
//		}
//		// 페이지번호를 정수형 변경
//		int currentPage=Integer.parseInt(pageNum);
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
//		int endRow = startRow+pageDTO.getPageSize()-1;
//		
//		pageDTO.setStartRow(startRow-1); 
//		pageDTO.setEndRow(endRow);
//
//		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
//		search.put("shipNum", shipNum);
//		search.put("shipQty", shipQty);
//		search.put("shipDt", shipDt);
//		search.put("startRow", pageDTO.getStartRow());
//		search.put("pageSize", pageDTO.getPageSize());
// 
//		List<ShipDTO> shipInfo = shipService.getInfoList(search);
//			
//		//페이징 처리
//		int count = shipService.countInfoList(search);
//
//		int pageBlock = 10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount){
//		 	endPage = pageCount;
//		 }
//		
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//				
//		model.addAttribute("pageDTO", pageDTO);
//		model.addAttribute("search", search);
//		model.addAttribute("shipInfo", shipInfo);
//		return "ship/shipInfo";
//	}
	
	// 출하정보
	@RequestMapping(value = "/ship/shipInfo", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		System.out.println("ShipController shipInfo()");
		int shipId=Integer.parseInt(request.getParameter("shipId"));
		
		System.out.println("shipId"+shipId);
		
		Map<String, Object> shipDTO=shipService.getShip(shipId);
		
		model.addAttribute("shipDTO", shipDTO);
		
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
		int pageSize = 3; // sql문에 들어가는 항목
		
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
		int pageSize = 3; // sql문에 들어가는 항목
		
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
		
		Map<String, Object> shipDTO=shipService.getShip(shipId);
		
		model.addAttribute("shipDTO", shipDTO);
		
		return "ship/shupdate";
	}
	
	@RequestMapping(value = "/ship/shupdatePro", method = RequestMethod.POST)
	public String shupdatePro(ShipDTO shipDTO,HttpServletRequest request) {
		System.out.println("ShipController shupdatePro()");
		
		System.out.println("shipDTO 값" +shipDTO);
		shipService.updateShip(shipDTO);
		int shipId=Integer.parseInt(request.getParameter("shipId"));
		shipDTO=(ShipDTO) shipService.getShip(shipId);

		return "redirect:/common/offwindow";
	}
	
	@RequestMapping(value = "/ship/updateCmplt", method = RequestMethod.GET)
	public String updateCmplt(HttpServletRequest request, Model model,HttpSession session) {
		System.out.println("ShipController updateCmplt()");
		
		String shipId[]=request.getParameterValues("shipId");
	
		System.out.println("배열길이!!!" +shipId.length);
		System.out.println("확인1"+shipId[0]);
		System.out.println("확인2"+shipId[1]);
		
		ShipDTO shipDTO = new ShipDTO();
		
		
		
		for (int i = 0; i < shipId.length; i++) {
			String string = shipId[i];
		
			System.out.println("shipId"+string);
			shipDTO.setShipId(Integer.parseInt(string));
			shipService.updateCmplt(shipDTO);
		}
		return "redirect:/ship/shipList";
	}
	
	
	@RequestMapping(value = "/ship/deleteCmplt", method = RequestMethod.GET)
	public String deleteCmplt(HttpServletRequest request, Model model,HttpServletResponse response) throws IOException {
		System.out.println("ShipController deleteCmplt()");
		
		String shipId[]=request.getParameterValues("shipId");
		ShipDTO shipDTO = new ShipDTO();
		System.out.println("아이디 오는지 확인"+ shipId);
		for (int i = 0; i < shipId.length; i++) {
			
			String string = shipId[i];
			System.out.println("아이디 배열"+ shipId);
		
			System.out.println("shipId"+string);
			shipDTO.setShipId(Integer.parseInt(string));
			shipService.deleteCmplt(shipDTO);
		}
//		if(orderService.check(ordId)) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script type='text/javascript'>");
//			out.println("alert('해당 수주는 작업지시가 시작되었습니다.');");
//			out.println("history.back()");
//			out.println("</script>");
//			out.close();
//			return null;
//			
		return "redirect:/ship/shipList";
	}
	
	
	@RequestMapping(value = "/ship/shdelete", method = RequestMethod.GET)
	public String shdelete(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		int shipId = Integer.parseInt(request.getParameter("shipId"));
		System.out.println("확인용"+shipId);
		System.out.println("check 확인!:"+shipService.check(shipId));
		if(shipService.check(shipId)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('해당 출하는 작업지시가 시작되었습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
			
		}else{
		
//		orderService.deleteOrder(ordId);

		return "redirect:/common/offwindow";}
	}
	
	
	@RequestMapping(value = "/ship/openDelete", method = RequestMethod.GET)
	public String openDelete(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		int shipId = Integer.parseInt(request.getParameter("shipId"));
		System.out.println("확인용"+shipId);
		if(shipService.check(shipId)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('해당 출하는 작업지시가 시작되었습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}else {
			shipService.deleteOrder(shipId);
			
		}
		return "redirect:/ship/shipAdmin";
	}
	
	
	
	
	
}