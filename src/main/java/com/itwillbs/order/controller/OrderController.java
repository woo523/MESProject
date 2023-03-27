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
import com.itwillbs.order.service.OrderService;


@Controller
public class OrderController {
	
	@Inject
	private OrderService orderService;

	@RequestMapping(value = "/order/management", method = RequestMethod.GET)
	public String management(Model model, HttpServletRequest request) {
		
//		List<Map<String,Object>> checkList = orderService.getCheckMap();
//		model.addAttribute("checkList", checkList);
//		
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
	
	@RequestMapping(value = "/order/ordersearch", method = RequestMethod.GET)
	public String orderList(Model model, HttpServletRequest request) {
		System.out.println("OrderController orderList()");
		
		String clntCd = request.getParameter("clntCd");
		String orderDt = request.getParameter("orderDt");
		String name = request.getParameter("name");
		String dlvryDt = request.getParameter("dlvryDt");
		System.out.println("업체 :"+clntCd);
		System.out.println("수주일자 : "+orderDt);
		System.out.println("담당자 : "+name);
		System.out.println("납품예정일 : "+dlvryDt);
		
		if(clntCd == null && orderDt == null && name == null && dlvryDt == null) {
			// 라인 전체 조회
			List<OrderDTO> orderList = orderService.orderList();
			model.addAttribute("orderList", orderList);
			
		} else {
			// 라인 검색 조회
			
			Map<String, Object> orderSearch = new HashMap<String, Object>();
			orderSearch.put("clntCd", clntCd);
			orderSearch.put("orderDt", orderDt);
			orderSearch.put("name", name);
			orderSearch.put("dlvryDt", dlvryDt);
			System.out.println(orderSearch);
			
			List<Map<String, Object>> orderList = orderService.orderSearch(orderSearch);
			model.addAttribute("orderList", orderList);
		}
		return "order/ordersearch";
	}
}
