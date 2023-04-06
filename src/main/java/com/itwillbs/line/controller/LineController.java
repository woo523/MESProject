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

import com.itwillbs.common.PageDTO;
import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.line.service.LineService;

@Controller
public class LineController {
	
	@Inject
	private LineService lineService;
	
	@RequestMapping(value = "/line/line", method = RequestMethod.GET)
	public String lineList(Model model, HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("LineController lineList()");
		
		String lineCode = request.getParameter("lineCode");
		String lineName = request.getParameter("lineName");
		String useChoice = request.getParameter("useChoice");
		
		Map<String, Object> lineSearch = new HashMap<String, Object>();
		lineSearch.put("lineCode", lineCode);
		lineSearch.put("lineName", lineName);
		lineSearch.put("useChoice", useChoice);
		System.out.println(lineSearch);
		
		List<Map<String, Object>> lineList;
		
		if(lineCode == null && lineName == null && useChoice == null) {
			// 라인 전체 조회
			
			lineList = lineService.lineList(pageDTO, model);
			int totalCnt = lineService.lineTotalCount();
			model.addAttribute("totalCnt", totalCnt);
			
		} else {
			// 라인 검색 조회
			
			lineList = lineService.lineSearch(lineSearch, pageDTO, model);
			int searchCnt = lineService.lineSearchCount(lineSearch);
			model.addAttribute("searchCnt", searchCnt);
		}
		
		System.out.println("라인 : " + lineList);
		model.addAttribute("lineList", lineList);
		model.addAttribute("lineSearch", lineSearch);
		
		return "line/line";
	}
	
	// 라인 등록
	@RequestMapping(value = "/line/lineInsert", method = RequestMethod.GET)
	public String lineInsert() {
		System.out.println("LineController lineInsert()");
		
		return "line/lineInsert";
	}

	// 라인 등록
	@RequestMapping(value = "/line/lineInsertPro", method = RequestMethod.POST)
	public String lineInsertPro(HttpServletRequest request, LineDTO lineDTO) {
		System.out.println("LineController lineInsertPro()");
		
		// 라인 규격코드
		int count = lineService.lineTotalCount() + 1;
		String lindCode = String.format("LINE%02d", count);
		lineDTO.setLineCode(lindCode);
		
		lineService.insertLine(lineDTO);
		System.out.println(lineDTO);
		
		return "redirect:/common/offwindow";
	}
	
	// 라인 수정
	@RequestMapping(value = "/line/lineModify", method = RequestMethod.GET)
	public String lineModify(HttpServletRequest request, Model model) {
		System.out.println("LineController lineModify()");
		
		int lineId = Integer.parseInt(request.getParameter("lineId"));
		
		LineDTO lineDTO = lineService.getLineList(lineId);
		List<LineDTO> lineList = lineService.getLinePlace();
		
		model.addAttribute("lineDTO", lineDTO);
		model.addAttribute("lineList", lineList);
		System.out.println("폼 : " + lineDTO);
		
		return "line/lineModify";
	}
	
	// 라인 수정
	@RequestMapping(value = "/line/lineModifyPro", method = RequestMethod.POST)
	public String lineModifyPro(HttpServletRequest request, LineDTO lineDTO) {
		System.out.println("LineController lineModifyPro()");
		
		int lineId = Integer.parseInt(request.getParameter("lineId"));
		
		lineService.updateLine(lineDTO, lineId);
		
		System.out.println("디비 : " + lineDTO);
		
		return "redirect:/common/offwindow";
	}
	
	// 라인 삭제
	@RequestMapping(value = "/line/lineDelete", method = RequestMethod.GET)
	public String lineDelete(HttpServletRequest request) {
		System.out.println("LineController lineDelete");
		
		int lineId = Integer.parseInt(request.getParameter("lineId"));
		
		lineService.deleteLine(lineId);
		
		return "redirect:/line/line";
	}
	
}
