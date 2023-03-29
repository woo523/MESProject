package com.itwillbs.line.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.line.service.LineService;

@Controller
public class LineController {
	
	@Inject
	private LineService lineService;
	
	@RequestMapping(value = "/line/line", method = RequestMethod.GET)
	public String lineList(Model model, HttpServletRequest request) {
		System.out.println("LineController lineList()");
		
		String lineCode = request.getParameter("lineCode");
		String lineName = request.getParameter("lineName");
		String useChoice = request.getParameter("useChoice");
		System.out.println("라인코드 : "+lineCode);
		System.out.println("라인명 : "+lineName);
		System.out.println("사용여부 : "+useChoice);
		
		if(lineCode == null && lineName == null && useChoice == null) {
			// 라인 전체 조회
			
			List<LineDTO> lineList = lineService.lineList();
			int totalCnt = lineService.lineTotalCount();
			model.addAttribute("lineList", lineList);
			model.addAttribute("totalCnt", totalCnt);
			
		} else {
			// 라인 검색 조회
			
			Map<String, Object> lineSearch = new HashMap<String, Object>();
			lineSearch.put("lineCode", lineCode);
			lineSearch.put("lineName", lineName);
			lineSearch.put("useChoice", useChoice);
			System.out.println(lineSearch);
			
			List<Map<String, Object>> lineList = lineService.lineSearch(lineSearch);
			int searchCnt = lineService.lineSearchCount(lineSearch);
			model.addAttribute("lineList", lineList);
			model.addAttribute("searchCnt", searchCnt);
		}
		return "line/line";
	}

}
