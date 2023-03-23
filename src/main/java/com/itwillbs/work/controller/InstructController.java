package com.itwillbs.work.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.service.InstructService;

@Controller
public class InstructController {
	
	@Inject
	private InstructService instructService;
	
	@RequestMapping(value = "/work/instructList", method = RequestMethod.GET)
	public String instructList(Model model) {
		System.out.println("instructService instructList()");

		return "work/instructList";
	}
	
	@RequestMapping(value = "/work/instructListPro", method = RequestMethod.GET)
	public String instructListPro(Model model) {
		System.out.println("instructService instructListPro()");
		
		List<InstructDTO> instrList = instructService.instrList();
		model.addAttribute("instrList", instrList);
		
		return "redirect:/work/instructList";
	}

}
