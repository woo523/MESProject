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

import com.itwillbs.common.PageDTO;
import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.line.service.LineService;
import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.service.InstructService;

@Controller
public class InstructController {
	
	@Inject
	private InstructService instructService;
	
	@Inject
	private LineService lineService;
	
	@RequestMapping(value = "/work/instructList", method = RequestMethod.GET)
	public String instructList(HttpServletRequest request, Model model, PageDTO pageDTO) {
		System.out.println("InstructController instructList()");
		
		String lineName = request.getParameter("lineName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String itemNum = request.getParameter("itemNum");
		String workSts1 = request.getParameter("workSts1");
		String workSts2 = request.getParameter("workSts2");
		String workSts3 = request.getParameter("workSts3");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("lineName", lineName);
		instrSearch.put("startDate", startDate);
		instrSearch.put("endDate", endDate);
		instrSearch.put("itemNum", itemNum);
		instrSearch.put("workSts1", workSts1);
		instrSearch.put("workSts2", workSts2);
		instrSearch.put("workSts3", workSts3);
		
		List<Map<String, Object>> instrList;
		
		if(lineName == null && startDate == null && endDate == null && itemNum == null && workSts1==null && workSts2==null && workSts3==null) {
			// 작업지시 전체 조회
			
			instrList = instructService.instrList(pageDTO, model);
			int instrTotal = instructService.instrCount();
			model.addAttribute("instrTotal", instrTotal);
		
		} else {
			// 작업지시 검색 조회
			
			instrList = instructService.instrList(instrSearch, pageDTO, model);
			int instrSearchCount = instructService.instrCount(instrSearch);
			model.addAttribute("instrSearchCount", instrSearchCount);
		}
		
		// 라인 이름 불러오기
		List<LineDTO> lineList = lineService.lineList();
		model.addAttribute("lineList", lineList);
		
		System.out.println(instrList);
		model.addAttribute("instrList", instrList);
		model.addAttribute("instrSearch", instrSearch);
		
		return "work/instructList";
	}
	
	// 작업지시 현황 - 작업지시 검색
	@RequestMapping(value = "/work/instructState", method = RequestMethod.GET)
	public String instructState(HttpServletRequest request, Model model, PageDTO pageDTO) {
		System.out.println("InstructController instructState()");
		
		String lineName = request.getParameter("lineName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String itemNum = request.getParameter("itemNum");
		String workSts1 = request.getParameter("workSts1");
		String workSts2 = request.getParameter("workSts2");
		String workSts3 = request.getParameter("workSts3");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("lineName", lineName);
		instrSearch.put("startDate", startDate);
		instrSearch.put("endDate", endDate);
		instrSearch.put("itemNum", itemNum);
		instrSearch.put("workSts1", workSts1);
		instrSearch.put("workSts2", workSts2);
		instrSearch.put("workSts3", workSts3);
		
		List<Map<String, Object>> instrList;
		
		if(lineName == null && startDate == null && endDate == null && itemNum == null && workSts1==null && workSts2==null && workSts3==null) {
			// 작업지시 전체 조회
			
			instrList = instructService.instrList(pageDTO, model);
			int instrTotal = instructService.instrCount();
			model.addAttribute("instrList", instrList);
			model.addAttribute("instrTotal", instrTotal);
		
		} else {
			// 작업지시 검색 조회

			instrList = instructService.instrList(instrSearch, pageDTO, model);
			int instrSearchCount = instructService.instrCount(instrSearch);
			model.addAttribute("instrList", instrList);
			model.addAttribute("instrSearchCount", instrSearchCount);
			
		}
		
		// 라인 이름 불러오기
		List<LineDTO> lineList = lineService.lineList();
		model.addAttribute("lineList", lineList);
		
		model.addAttribute("instrList", instrList);
		model.addAttribute("instrSearch", instrSearch);
		
		return "work/instructState";
	}
	
	// 작업지시 등록
	@RequestMapping(value = "/work/instructInsert", method = RequestMethod.GET)
	public String instructInsert() {
		System.out.println("InstructController instructInsert()");
		
		return "work/instructInsert";
	}
	
	// 작업지시 등록
	@RequestMapping(value = "/work/instructInsertPro", method = RequestMethod.POST)
	public String instructInsertPro(HttpServletRequest request, InstructDTO instructDTO) {
		System.out.println("InstructController instructInsertPro()");
		
		// 작업지시 규격코드
		String instrDate = request.getParameter("instrDate");
		String date = (instrDate.replaceAll("-", "")).substring(2);
		int count = instructService.instrCount() + 1;
		String instrNum = String.format("ORD%s%05d", date, count);
		
		instructDTO.setWorkNum(instrNum);
		instructDTO.setWorkDate(request.getParameter("instrDate"));
		instructDTO.setInsertId(request.getParameter("insertId"));
		instructDTO.setOrdId(Integer.parseInt(request.getParameter("ordId")));
		instructDTO.setLineId(Integer.parseInt(request.getParameter("lineId")));
		instructDTO.setWorkQty(Integer.parseInt(request.getParameter("instrCnt")));
		
		instructService.insertInstr(instructDTO);
		
		return "redirect:/common/offwindow";
	}
	
	// 작업지시 등록 수주 조회
	@RequestMapping(value = "/work/orderList", method = RequestMethod.GET)
	public String orderList(HttpServletRequest request, Model model) {
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String clientName = request.getParameter("clientName");
		String dlvryDate = request.getParameter("dlvryDate");
		String itemNum = request.getParameter("itemNum");
		
		Map<String, Object> ordSearch = new HashMap<String, Object>();
		ordSearch.put("startDate", startDate);
		ordSearch.put("endDate", endDate);
		ordSearch.put("clientName", clientName);
		ordSearch.put("dlvryDate", dlvryDate);
		ordSearch.put("itemNum", itemNum);
		
		List<Map<String, Object>> getOrdList;
		
		if(startDate == null && endDate == null && clientName == null && dlvryDate == null && itemNum == null) {
			getOrdList = instructService.getOrdList();
		} else {
			getOrdList = instructService.getOrdList(ordSearch);
		}
		
		model.addAttribute("getOrdList", getOrdList);
		System.out.println(getOrdList);
		
		return "work/orderList";
	}
	
	// 작업지시 등록 라인 조회
	@RequestMapping(value = "/work/lineList", method = RequestMethod.GET)
	public String lineList(HttpServletRequest request, Model model) {
		
		String lineName = request.getParameter("lineName");
		List<Map<String, Object>> getLineList = instructService.getLineList(lineName);
		
		model.addAttribute("getLineList", getLineList);
		
		return "work/lineList";
	}
	
	// 작업지시 수정
	@RequestMapping(value = "/work/instructModify", method = RequestMethod.GET)
	public String instructModify(HttpServletRequest request, Model model) {
		
		int instrId = Integer.parseInt(request.getParameter("instrId"));
		
		// 작업지시번호에 해당하는 작업지시 목록
		InstructDTO instrDTO = instructService.instrIdList(instrId);
		List<Map<String, Object>> getInstrList = instructService.getInstrList(instrId);
		
		model.addAttribute("instrDTO", instrDTO);
		model.addAttribute("getInstrList", getInstrList);
		
		return "work/instructModify";
	}
	
	// 작업지시 수정
	@RequestMapping(value = "/work/instructModifyPro", method = RequestMethod.POST)
	public String instructModifyPro(HttpServletRequest request, InstructDTO instructDTO) {
		System.out.println("InstructController instructModifyPro()");
		
		int instrId = Integer.parseInt(request.getParameter("instrId"));
		
		instructDTO.setOrdId(Integer.parseInt(request.getParameter("ordId")));
		instructDTO.setWorkQty(Integer.parseInt(request.getParameter("instrCnt")));
		
		instructService.instrUpdate(instructDTO, instrId);
		
		return "redirect:/common/offwindow";
	}
	
	// 작업지시 삭제
	@RequestMapping(value = "/work/instructDelete", method = RequestMethod.GET)
	public String workDelete(HttpServletRequest request, PageDTO pageDTO) {
		
		int instrId = Integer.parseInt(request.getParameter("instrId"));
		instructService.instrDelete(instrId);
		
		return "redirect:/work/instructList?pageNum=" + pageDTO.getPageNum();
	}
	
}
