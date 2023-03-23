package com.itwillbs.material.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.material.service.OutmaterialService;

@Controller
public class OutmaterialController {

	@Inject
	private OutmaterialService outmaterialService;
	
	@RequestMapping(value = "/material/outmaterList", method = RequestMethod.GET)
	public String outmeterList(HttpServletRequest request, Model model) {
		System.out.println("MaterialController outmaterList()");

		List<Map<String, Object>> outmaterList =  outmaterialService.outmaterList();

		model.addAttribute("outmaterList", outmaterList);
		
		System.out.println(outmaterList);
		
		return "material/outmaterList";
	}
}
