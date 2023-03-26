package com.itwillbs.work.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		if(lineName == null && startDate == null && endDate == null && itemNum == null && workSts1==null && workSts2==null && workSts3==null) {
			// 작업지시 전체 조회
			
			List<Map<String, Object>> instrList = instructService.instrList();
			int instrTotal = instructService.instrCount();
			model.addAttribute("instrList", instrList);
			model.addAttribute("instrTotal", instrTotal);
		
		} else {
			// 작업지시 검색 조회
			
			Map<String, Object> instrSearch = new HashMap<String, Object>();
			instrSearch.put("lineName", lineName);
			instrSearch.put("startDate", startDate);
			instrSearch.put("endDate", endDate);
			instrSearch.put("itemNum", itemNum);
			instrSearch.put("workSts1", workSts1);
			instrSearch.put("workSts2", workSts2);
			instrSearch.put("workSts3", workSts3);
			System.out.println(instrSearch);
			
			List<Map<String, Object>> instrList = instructService.instrList(instrSearch);
			int instrSearchCount = instructService.instrCount(instrSearch);
			model.addAttribute("instrList", instrList);
			model.addAttribute("instrSearchCount", instrSearchCount);
			
		}
		return "work/instructList";
	}
	
	// 작업지시 현황
	@RequestMapping(value = "/work/instructState", method = RequestMethod.GET)
	public String instructState(HttpServletRequest request, Model model) {
		System.out.println("InstructController instructState()");
		
		String lineName = request.getParameter("lineName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String itemNum = request.getParameter("itemNum");
		String workSts1 = request.getParameter("workSts1");
		String workSts2 = request.getParameter("workSts2");
		String workSts3 = request.getParameter("workSts3");
		
		if(lineName == null && startDate == null && endDate == null && itemNum == null && workSts1==null && workSts2==null && workSts3==null) {
			// 작업지시 전체 조회
			
			List<Map<String, Object>> instrList = instructService.instrList();
			model.addAttribute("instrList", instrList);
		
		} else {
			// 작업지시 검색 조회
			
			Map<String, Object> instrSearch = new HashMap<String, Object>();
			instrSearch.put("lineName", lineName);
			instrSearch.put("startDate", startDate);
			instrSearch.put("endDate", endDate);
			instrSearch.put("itemNum", itemNum);
			instrSearch.put("workSts1", workSts1);
			instrSearch.put("workSts2", workSts2);
			instrSearch.put("workSts3", workSts3);
			System.out.println(instrSearch);
			
			List<Map<String, Object>> instrList = instructService.instrList(instrSearch);
			model.addAttribute("instrList", instrList);
			
		}
		return "work/instructState";
	}
	
}
