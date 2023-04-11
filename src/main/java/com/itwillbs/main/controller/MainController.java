package com.itwillbs.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		System.out.println("main");
		
		return "main/main";
	}

}
