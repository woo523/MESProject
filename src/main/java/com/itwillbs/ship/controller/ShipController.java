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
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.ship.domain.PageDTO;
import com.itwillbs.ship.service.ShipService;
import com.itwillbs.work.domain.ItemDTO;

@Controller
public class ShipController {
	
	@Inject
	private ShipService shipService;
	
	@RequestMapping(value="/ship/shipList", method = RequestMethod.GET)
	public String shipList(HttpServletRequest request,Model model) {
		System.out.println("ShipController shipList()");
		//검색어 가져오기
		String search=request.getParameter("search");
		
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
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//검색어
		pageDTO.setSearch(search);
				
		List<ShipDTO> shipList=shipService.getShipList(pageDTO);
		
		//페이징 처리
		//검색어
		int count = shipService.getShipCount(pageDTO);
		int pageBlock=10;
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
				
		model.addAttribute("shipList", shipList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 주소줄 변경없이 이동
		return "ship/shipList";
	}
	
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
		
		List<ShipDTO> shipAdmin = shipService.getshipList(search);
		
		
		List<Map<String,Object>> shipList;
		if(insertId == null && insertDt ==null && shipNum==null && shipDt==null && itemNum==null && itemName==null && barcord==null && itemUnit==null && amount==null && clntId==null) {
			// 조회 안한 경우
			shipList = shipService.getShipMap(pageDTO); // page만 필요해서
		
		}else { 
			// 조회값 넣은 경우
			shipList = shipService.getShipMap(search);
		}
		return "ship/shipAdmin";
	}
	
	
	@RequestMapping(value = "/ship/shipInfo", method = RequestMethod.GET)
	public String shipInfo(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String shipNum = request.getParameter("shipNum");
		String shipQty = request.getParameter("shipQty");
		String shipDt = request.getParameter("shipDt");
		
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
	


	
	
	
	
}