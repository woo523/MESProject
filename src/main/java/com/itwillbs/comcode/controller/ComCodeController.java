package com.itwillbs.comcode.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	// 등록처리
	@RequestMapping(value = "/comCode/insert", method = RequestMethod.POST)
	public String insert(ComCodeDTO comCodeDTO) {
		System.out.println("MemberController insert()");
		System.out.println(comCodeDTO.getCdGrp());
		System.out.println(comCodeDTO.getCdGrpNm());
		System.out.println(comCodeDTO.getCd());
		System.out.println(comCodeDTO.getCdNm());

		comCodeService.insertComCode(comCodeDTO);

		return "redirect:/comCode/list";
	}
}
