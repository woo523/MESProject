package com.itwillbs.work.controller;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.line.service.LineService;
import com.itwillbs.line.service.LineServiceImpl;
import com.itwillbs.work.domain.PerformDTO;
import com.itwillbs.work.service.PerformService;



@Controller
public class PerformController {
	
	@Inject
	private PerformService performService;
	
	@Inject
	private LineService lineService;
	
	@RequestMapping(value = "/work/performRegist", method = RequestMethod.GET)
	public String performRegist(Model model, HttpServletRequest request) {

		// 조회 값들
		String line = request.getParameter("line");
		String pcd = request.getParameter("pcd");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String ists1 = request.getParameter("ists1");
		String ists2 = request.getParameter("ists2");
		String ists3 = request.getParameter("ists3");
		
		
		if(line == null && pcd == null && sdate == null && edate == null && ists1 == null && ists2 == null && ists3 == null) {
		// 조회 안한 경우
			List<Map<String,Object>> instrList = performService.getInstrLiMap();
		
			model.addAttribute("instrList", instrList);} // 전체 리스트
		else { // 조회값 넣은 경우
			List<Map<String,Object>> instrList = performService.getInstrLiMap(line, pcd, sdate, edate, ists1, ists2, ists3);
			model.addAttribute("instrList", instrList); // 서치 결과 리스트
		}
		
		
		// 라인 목록 불러오기
			List<LineDTO> linelist = lineService.lineList();	
			System.out.println("linelist : "+linelist);
			model.addAttribute("linelist", linelist);
				
		return "work/performRegist";
	}
	
	@RequestMapping(value = "/work/itemList", method = RequestMethod.GET)
	public String itemList(Model model) { // 품목 리스트
		
		
//		model.addAttribute("itemList", itemList);
		return "work/itemList";
	}
	
	@RequestMapping(value = "/work/performList", method = RequestMethod.GET)
	public String performList(Model model) {  // 생산실적 현황 페이지
		
		
//		model.addAttribute("performList", performList);
		return "work/performList";
	}
	
	
	@RequestMapping(value = "/work/pfmodi", method = RequestMethod.GET)
	public String pfmodi(HttpServletRequest request, Model model) { // 실적 수정창
		
		int performId = Integer.parseInt(request.getParameter("performId"));
		
		PerformDTO pfDTO = performService.getPf(performId);
		
		Map<String, Object> getInstr = performService.getInstrMap(pfDTO.getInstrId()); // 품명 가져오기 위해
		
		model.addAttribute("pfDTO", pfDTO);
		model.addAttribute("getInstr", getInstr);
		
		return "work/pfmodi";
	}
	
	@RequestMapping(value = "/work/pfInsert", method = RequestMethod.GET)
	public String pfInsert(HttpServletRequest request, Model model) { // 실적 등록 창
		int instrId = Integer.parseInt(request.getParameter("instrId"));
		
		Map<String, Object> getInstr = performService.getInstrMap(instrId);
		
		model.addAttribute("getInstr", getInstr);
		return "work/pfInsert";
	}
	

	@RequestMapping(value = "/common/offwindow", method = RequestMethod.GET)
	public String offwindow(HttpServletRequest request, Model model) { // 팝업창 닫기(폼에서 다른 페이지로 넘어가고 닫아야하는 경우 사용)
		return "common/offwindow";
	}
	
	
	@RequestMapping(value = "/work/PinsertPro", method = RequestMethod.GET)
	public String PinserPro (HttpServletRequest request, HttpSession session){ // 실적 등록 실행

		PerformDTO performDTO = new PerformDTO();
		String id = (String)session.getAttribute("id");
		performDTO.setInsertId(id);
		performDTO.setInstrId(Integer.parseInt(request.getParameter("instrId")));


		String date = request.getParameter("performDate");
		Date performDate = Date.valueOf(date); // String -> Date(sql)로 변환
		performDTO.setPerformDate(performDate);

		performDTO.setPerformQty(Integer.parseInt(request.getParameter("performQty")));
		performDTO.setGbYn(request.getParameter("gbYn"));
		performDTO.setDbReason(request.getParameter("dbReason"));
		performDTO.setNote(request.getParameter("note"));
		
		
		performService.insertPf(performDTO);
		
		return "redirect:/common/offwindow";
	}
	
	@RequestMapping(value = "/work/del", method = RequestMethod.GET)
	public String del(HttpServletRequest request, Model model) { // 실적 삭제창
		int performId = Integer.parseInt(request.getParameter("performId"));
		
		performService.delPf(performId);
		
		return "redirect:/work/performRegist";
	}

	
	
	
	
	
}


