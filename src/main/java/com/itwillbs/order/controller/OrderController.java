package com.itwillbs.order.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.order.service.OrderService;


@Controller
public class OrderController {
	
	@Inject
	private OrderService orderService;

	@RequestMapping(value = "/order/management", method = RequestMethod.GET)
	public String management(Model model, HttpServletRequest request) {
		
		List<Map<String,Object>> checkList = orderService.getCheckMap();
		model.addAttribute("checkList", checkList);
		
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
