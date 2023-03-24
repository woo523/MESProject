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
	public String instructList(HttpServletRequest request, Model model) {
		System.out.println("InstructController instructList()");
		
		String lineName = request.getParameter("lineName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String itemNum = request.getParameter("itemNum");
		String workSts1 = request.getParameter("workSts1");
		String workSts2 = request.getParameter("workSts2");
		String workSts3 = request.getParameter("workSts3");
		System.out.println("라인 : " + lineName);
		System.out.println("지시일자 : " + startDate);
		System.out.println("지시일자 : " + endDate);
		System.out.println("품번 : " + itemNum);
		System.out.println("지시상태 : " + workSts1);
		System.out.println("지시상태 : " + workSts2);
		System.out.println("지시상태 : " + workSts3);
		
		if(lineName == null && itemNum == null && startDate == null && endDate == null && workSts1 == null && workSts2 == null && workSts3 == null) {
			List<Map<String, Object>> instrList = instructService.instrList();
			model.addAttribute("instrList", instrList);
		} else {
			List<Map<String, Object>> instrList = instructService.instrList(lineName, itemNum, startDate, endDate, workSts1, workSts2, workSts3);
			model.addAttribute("instrList", instrList);
		}
		return "work/instructList";
	}

}
