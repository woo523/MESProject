package com.itwillbs.order.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.order.domain.ItemDTO;
import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.domain.clntDTO;
import com.itwillbs.order.domain.userDTO;
import com.itwillbs.order.service.OrderService;


@Controller
public class OrderController {
	
	@Inject
	private OrderService orderService;

	@RequestMapping(value = "/order/orderInsert", method = RequestMethod.GET)
	public String orderInsert() {
		
		
		
		return "order/orderInsert";
	}
	
	@RequestMapping(value = "/order/orderInsertPro", method = RequestMethod.GET)
	public String orderInsertPro(OrderDTO orderDTO) {
		System.out.println("insert화면에서 넘어옴orderDTO");
		System.out.println("orderDTO"+orderDTO.getUserId());
		System.out.println("orderDTO"+orderDTO.getUserNm());
		System.out.println("orderDTO"+orderDTO.getClntNm());
		
		orderService.insertOrder(orderDTO);
		
		return "redirect:/order/orderMng";
	}
	

	@RequestMapping(value = "/order/orderMng", method = RequestMethod.GET)
	public String orderMng(Model model, HttpServletRequest request, PageDTO pageDTO) {

			// 조회값들
			String ordId = request.getParameter("ordId");
			String clntId = request.getParameter("clntId");
			String clntCd = request.getParameter("clntCd");
			String clntNm = request.getParameter("clntNm");
			String sOdate = request.getParameter("sOdate");
			String eOdate = request.getParameter("eOdate");
			String sDdate = request.getParameter("sDdate");
			String eDdate = request.getParameter("eDdate");
			String userNum = request.getParameter("userNum");
			String userNm = request.getParameter("userNm");
			String userId = request.getParameter("userId");
	
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
			search.put("ordId", ordId);
			search.put("clntCd", clntCd);
			search.put("clntNm", clntNm);
			search.put("clntId", clntId);
			search.put("sOdate", sOdate);
			search.put("eOdate", eOdate);
			search.put("sDdate", sDdate);
			search.put("eDdate", eDdate);
			search.put("userNum", userNum);
			search.put("userNm", userNm);
			search.put("userId", userId);
			
			search.put("startRow", pageDTO.getStartRow());
			search.put("pageSize", pageDTO.getPageSize());
	 
			
			List<Map<String,Object>> orderList;
			if(ordId == null && clntCd == null && clntNm == null && sOdate == null && eOdate== null 
					&& sDdate == null && eDdate == null && userNum == null && userNm == null) {
			// 조회 안한 경우
				orderList = orderService.getOrderMap(pageDTO); // page만 필요해서
			
			}else { // 조회값 넣은 경우
				orderList = orderService.getSearchOrderMap(search);
				
			}
					
			//페이징 처리
			int count = orderService.countOrder(search);

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
			model.addAttribute("orderList", orderList); 
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("search", search);


		return "order/orderMng";
	}
	
	@RequestMapping(value = "/order/itemList", method = RequestMethod.GET)
	public String itemList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
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
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("itemNum", itemNum);
		search.put("itemNm", itemNm);
		search.put("invntUnit", invntUnit);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<ItemDTO> itemList = orderService.getItemList(search);
			
		//페이징 처리
		int count = orderService.countItemList(search);

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
		return "order/itemList";
	}
	@RequestMapping(value = "/order/userList", method = RequestMethod.GET)
	public String userList(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String userNum = request.getParameter("userNum");
		String userNm = request.getParameter("userNm");
		
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
		search.put("userNum", userNum);
		search.put("userNm", userNm);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<userDTO> userList = orderService.getUserList(search);
			
		//페이징 처리
		int count = orderService.countUserList(search);

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
		model.addAttribute("userList", userList);
		return "order/userList";
	}
	@RequestMapping(value = "/order/clntList", method = RequestMethod.GET)
	public String clientList(Model model, HttpServletRequest request, PageDTO pageDTO) {

		String clntCd = request.getParameter("clntCd");
		String clntNm = request.getParameter("clntNm");
		
		// �� ��硫댁�� 蹂댁�ъ� 湲� 媛��� �ㅼ��
		int pageSize = 5; // sql臾몄�� �ㅼ�닿��� ��紐�
		
		// �����댁� 踰��� 媛��몄�ㅺ린
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// ���댁�踰��몃�� ������ 蹂�寃�
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql臾몄�� �ㅼ�닿��� ��紐�
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0�� 1�댁�닿린 ��臾� 1�� 類�)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql�� �ㅼ�닿��쇳�� ��移� ��紐� 諛� pageDTO ��紐� map�� �닿린
		search.put("clntCd", clntCd);
		search.put("clntNm", clntNm);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<clntDTO> clntList = orderService.getClntList(search);
			
		//���댁� 泥�由�
		int count = orderService.countClntList(search);

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
		model.addAttribute("clntList", clntList);				

		return "order/clntList";
	}
	
	@RequestMapping(value = "/order/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		System.out.println("OrderController content()");
		int ordId=Integer.parseInt(request.getParameter("ordId"));
		
		OrderDTO orderDTO=orderService.getOrder(ordId);
		System.out.println(orderDTO.getUserNm());
		model.addAttribute("orderDTO", orderDTO);
		
		return "order/content";
	}
	
	@RequestMapping(value = "/order/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		System.out.println("OrderController update()");
		int ordId=Integer.parseInt(request.getParameter("ordId"));
		
		OrderDTO orderDTO=orderService.getOrder(ordId);
		
		model.addAttribute("orderDTO", orderDTO);
		
		return "order/update";
	}
	
	@RequestMapping(value = "/order/updatePro", method = RequestMethod.POST)
	public String updatePro(OrderDTO orderDTO,HttpServletRequest request) {
		System.out.println("OrderController updatePro()");
		
		orderService.updateOrder(orderDTO);

		return "redirect:/order/orderMng";
	}
	@RequestMapping(value = "/order/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("OrderController delete()");
		int ordId=Integer.parseInt(request.getParameter("ordId"));
		orderService.getDelete(ordId);
		return "order/orderMng";
	}
	
	
	
	
	
	@RequestMapping(value = "/order/orderSts", method = RequestMethod.GET)
	public String orderSts(Model model, HttpServletRequest request, PageDTO pageDTO) {

			// 조회값들
			String ordId = request.getParameter("ordId");
			String clntId = request.getParameter("clntId");
			String clntCd = request.getParameter("clntCd");
			String clntNm = request.getParameter("clntNm");
			String sOdate = request.getParameter("sOdate");
			String eOdate = request.getParameter("eOdate");
			String sDdate = request.getParameter("sDdate");
			String eDdate = request.getParameter("eDdate");
			String userNum = request.getParameter("userNum");
			String userNm = request.getParameter("userNm");
			String userId = request.getParameter("userId");
	
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
			search.put("ordId", ordId);
			search.put("clntCd", clntCd);
			search.put("clntNm", clntNm);
			search.put("clntId", clntId);
			search.put("sOdate", sOdate);
			search.put("eOdate", eOdate);
			search.put("sDdate", sDdate);
			search.put("eDdate", eDdate);
			search.put("userNum", userNum);
			search.put("userNm", userNm);
			search.put("userId", userId);
			
			search.put("startRow", pageDTO.getStartRow());
			search.put("pageSize", pageDTO.getPageSize());
	 
			
			List<Map<String,Object>> orderList;
			if(ordId == null && clntCd == null && clntNm == null && sOdate == null && eOdate== null 
					&& sDdate == null && eDdate == null && userNum == null && userNm == null) {
			// 조회 안한 경우
				orderList = orderService.getOrderMap(pageDTO); // page만 필요해서
			
			}else { // 조회값 넣은 경우
				orderList = orderService.getSearchOrderMap(search);
				
			}
					
			//페이징 처리
			int count = orderService.countOrder(search);

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
			model.addAttribute("orderList", orderList); 
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("search", search);


		return "order/orderSts";
	}
}

