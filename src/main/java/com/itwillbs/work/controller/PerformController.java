package com.itwillbs.work.controller;


import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.work.domain.PerformDTO;
import com.itwillbs.work.service.PerformService;



@Controller
public class PerformController {
	
	@Inject
	private PerformService performService;
	

	@RequestMapping(value = "/work/performRegist", method = RequestMethod.GET)
	public String performRegist(Model model, HttpServletRequest request) {

		String line = request.getParameter("line");
		String pcd = request.getParameter("pcd");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String ists1 = request.getParameter("ists1");
		String ists2 = request.getParameter("ists2");
		String ists3 = request.getParameter("ists3");
		
		System.out.println("line :"+line);
		
		if(line == null && pcd == null && sdate == null && edate == null && ists1 == null && ists2 == null && ists3 == null) {
		
			List<Map<String,Object>> instrList = performService.getInstrLiMap();
		
			model.addAttribute("instrList", instrList);} // 전체 리스트
		else {
			List<Map<String,Object>> instrList = performService.getInstrLiMap(line, pcd, sdate, edate, ists1, ists2, ists3);
			model.addAttribute("instrList", instrList); // 서치 결과 리스트
		}
		
		
		return "work/performRegist";
	}
	
	@RequestMapping(value = "/work/itemList", method = RequestMethod.GET)
	public String itemList(Model model) {
		
		
//		model.addAttribute("itemList", itemList);
		return "work/itemList";
	}
	
	@RequestMapping(value = "/work/performList", method = RequestMethod.GET)
	public String performList(Model model) {
		
		
//		model.addAttribute("performList", performList);
		return "work/performList";
	}
	
	
	@RequestMapping(value = "/work/pfmodi", method = RequestMethod.GET)
	public String pfmodi(HttpServletRequest request) {
		String performId = request.getParameter("performId");
		
		return "work/pfmodi";
	}
	
	@RequestMapping(value = "/work/pfInsert", method = RequestMethod.GET)
	public String pfInsert(HttpServletRequest request, Model model) {
		String instrId = request.getParameter("instrId");
		
		Map<String, Object> getInstr = performService.getInstrMap(instrId);
		
		model.addAttribute("getInstr", getInstr);
		return "work/pfInsert";
	}
	

	@RequestMapping(value = "/work/PinserPro", method = RequestMethod.POST)
	public String PinserPro(PerformDTO performDTO, HttpSession session) {

		String id = (String)session.getAttribute("id");
		performDTO.setInsertId(id);
		performService.insertPf(performDTO);
		
		return "work/PinserPro";
	}
	

	
	
	
	
	
}


