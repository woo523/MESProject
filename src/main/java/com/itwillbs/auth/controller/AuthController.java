package com.itwillbs.auth.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.auth.service.AuthService;
import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.member.service.MemberService;

@Controller
public class AuthController {

	@Inject
	private AuthService authService;
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/auth/user", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO memberDTO) {
		
		List<MemberDTO> memberList = memberService.getMemberList(memberDTO, model);
		
		model.addAttribute("memberList", memberList);
		
		return "auth/user";
	}
	
	
}
