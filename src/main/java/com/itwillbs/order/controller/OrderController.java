package com.itwillbs.order.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.order.service.OrderService;


@Controller
public class OrderController {
	
	@Inject
	private OrderService orderService;

	@RequestMapping(value = "/order/management", method = RequestMethod.GET)
	public String write() {
		return "order/management";
	}

}
