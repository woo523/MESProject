package com.itwillbs.mdm.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.mdm.service.RequireService;

@Controller
public class RequireController {

	@Inject
	private RequireService requireService;
	
	@RequestMapping(value = "/mdm/require", method = RequestMethod.GET)
	public String requireList(HttpServletRequest request, Model model) {
		System.out.println("RequireController itemList()");
		
		List<Map<String,Object>> requireList = requireService.getRequireMap();
		model.addAttribute("requireList",requireList);
		
		return "mdm/require";
	
	}
}
