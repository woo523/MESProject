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

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.service.OrderService;


@Controller
public class OrderController {
	
	@Inject
	private OrderService orderService;

	@RequestMapping(value = "/order/management", method = RequestMethod.GET)
	public String management(Model model, HttpServletRequest request, PageDTO pageDTO) {

			String clntCd = request.getParameter("clntCd");
			String orderDt1 = request.getParameter("orderDt1");
			String orderDt2 = request.getParameter("orderDt2");
			String name = request.getParameter("name");
			String dlvryDt1 = request.getParameter("dlvryDt1");
			String dlvryDt2 = request.getParameter("dlvryDt2");
			
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
			search.put("clntCd", clntCd);
			search.put("orderDt1", orderDt1);
			search.put("orderDt2", orderDt2);
			search.put("name", name);
			search.put("dlvryDt1", dlvryDt1);
			search.put("dlvryDt2", dlvryDt2);
			
			search.put("startRow", pageDTO.getStartRow());
			search.put("pageSize", pageDTO.getPageSize());
	 
			
			List<Map<String,Object>> orderList;
			if(clntCd == null && orderDt1 == null && orderDt2 == null && name == null && dlvryDt1 == null && dlvryDt2 == null) {
			// 조회 안한 경우
				orderList = orderService.orderSearchMap(pageDTO); // page만 필요해서
			
			}else { // 조회값 넣은 경우
				orderList = orderService.orderSearchMap(search);
				
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


		return "order/management";
	}
	@RequestMapping(value = "/order/itemList", method = RequestMethod.GET)
	public String itemList(Model model) {
		return "order/itemList";
	}
	@RequestMapping(value = "/order/userList", method = RequestMethod.GET)
	public String userList(Model model) {
		return "order/userList";
	}
	@RequestMapping(value = "/order/clientList", method = RequestMethod.GET)
	public String clientList(Model model) {
		return "order/clientList";
	}
}

