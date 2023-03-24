package com.itwillbs.work.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.service.InstructService;

@Controller
public class InstructController {
	
	@Inject
	private InstructService instructService;
	
	@RequestMapping(value = "/work/instructList", method = RequestMethod.GET)
	public String instructList(Model model) {
		System.out.println("InstructController instructList()");

		return "work/instructList";
	}
	
	@RequestMapping(value = "/work/instructListPro", method = RequestMethod.POST)
	public String instructListPro(Model model, HttpServletRequest request) {
		System.out.println("InstructController instructListPro()");
		
		String lineName = request.getParameter("lineName");
		String workDate = request.getParameter("workDate");
		String itemNum = request.getParameter("itemNum");
		// String edate = request.getParameter("edate");
		String workSts = request.getParameter("workSts");
		System.out.println(lineName);
		System.out.println(workDate);
		System.out.println(itemNum);
		System.out.println(workSts);
		
		List<Map<String, Object>> instrList = instructService.instrList(lineName, workDate, itemNum, workSts);
		model.addAttribute("instrList", instrList);
		
		return "redirect:/work/instructList";
	}

}
