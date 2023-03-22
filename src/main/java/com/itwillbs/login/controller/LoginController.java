package com.itwillbs.login.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.login.service.LoginService;
import com.itwillbs.member.domain.MemberDTO;


@Controller
public class LoginController {

	@Inject
	private LoginService loginService; // 4버전.자동으로 객체생성 한 것.

	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login() {
		
		return "login/login";
		
	}

	@RequestMapping(value = "/login/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		
		MemberDTO memberDTO2 = loginService.login(memberDTO);

		if (memberDTO2 != null) {
			// 아이디,비밀번호 일치
			System.out.println("loginController.loginPro.아이디 비밀번호 일치");
			session.setAttribute("id", memberDTO.getId());
			// 주소 변경되면서 메인페이지로 이동
			return "redirect:/member/list";
		} else {
			// 아이디,비밀번호 틀림
			System.out.println("memberController.loginPro.아이디 비밀번호 틀림");
			// member/msg.jsp 만들어서 "아이디 비밀번호 틀림" 메시지 출력하고 뒤로이동
			return "common/msg";
		}
	}
	@RequestMapping(value = "/login/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		// 세션 초기화
		session.invalidate();
		
		return "redirect:/login/login";
	}

	
	
}
