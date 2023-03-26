package com.itwillbs.comcode.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.comcode.domain.ComCodeDTO;
import com.itwillbs.comcode.service.ComCodeService;
import com.itwillbs.member.domain.MemberDTO;


@Controller
public class ComCodeController {

	@Inject
	private ComCodeService comCodeService; // 4버전.자동으로 객체생성 한 것.
	
	
	///////코드그룹(상위코드) 이동 및 처리부분 시작
	// 목록화면 이동
	@RequestMapping(value = "/comCode/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController list()");
		
		List<ComCodeDTO> comCodeList = comCodeService.getComCodeList(comCodeDTO, model);
		
		model.addAttribute("comCodeList", comCodeList);
		
		return "comCode/list";
	}
	
	// 등록화면 이동
	@RequestMapping(value = "/comCode/create", method = RequestMethod.GET)
	public String create() {
		return "comCode/create";
	}
	
	// 수정화면 이동
	@RequestMapping(value = "/comCode/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController update()");

		ComCodeDTO dto = comCodeService.getComCode(comCodeDTO);

		model.addAttribute("dto", dto);

		return "member/edit";
	}
	
	// 등록처리
	@RequestMapping(value = "/comCode/insert", method = RequestMethod.POST)
	public String insert(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController insert()");
		System.out.println(comCodeDTO.getCdGrp());
		System.out.println(comCodeDTO.getCd());
		System.out.println(comCodeDTO.getCdNm());

		comCodeService.insertComCode(comCodeDTO);
		
		if("POP".equals(comCodeDTO.getMode())) {//팝업에서 등록하였을 경우
			return "common/offwindow";//팝업에서 등록하였을 경우 팝업창 닫는 페이지로 이동
//			return "redirect:/comCode/listPop";//팝업에서 등록하였을 경우 팝업리스트로 이동
		}else {// 그 외 리스트로 이동
			return "redirect:/comCode/list";
		}

	}
	
	// 수정처리
	@RequestMapping(value = "/comCode/update", method = RequestMethod.POST)
	public String updatePro(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController update()");

		comCodeService.updateComCode(comCodeDTO);

		return "redirect:/comCode/list";
	}

	// 삭제처리
	@RequestMapping(value = "/comCode/delete", method = RequestMethod.POST)
	public String delete(ComCodeDTO comCodeDTO, HttpSession session) {
		System.out.println("ComCodeController delete()");
		// 디비 삭제 처리 => 처리 => 디비 자바 메서드 호출

		// 삭제작업
		comCodeService.deleteComCode(comCodeDTO);
		// 세션 초기화
		return "redirect:/comCode/list";
	}
	
	///////코드그룹(상위코드) 이동 및 처리부분 끝
	
	
	
	///////코드(하위코드) 이동 및 처리부분 시작
	//하위코드목록 팝업이동
	@RequestMapping(value = "/comCode/listPop", method = RequestMethod.GET)
	public String listPop(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
		
		System.out.println("ComCodeController listPop()");
		
		List<ComCodeDTO> comCodeList = comCodeService.getSubComCodeList(comCodeDTO.getCd());
		
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("cdGrp", comCodeDTO.getCd());
		model.addAttribute("cdGrpNm", comCodeDTO.getCdNm());
		return "comCode/listPop";
	}
	
	// 등록화면 팝업이동
	@RequestMapping(value = "/comCode/createPop", method = RequestMethod.GET)
	public String createPop(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
		model.addAttribute("comCodeDTO", comCodeDTO);
		return "comCode/createPop";
	}
	
	
	
	
	
	
	
	///////코드(하위코드) 이동 및 처리부분 끝
}
