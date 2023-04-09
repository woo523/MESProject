package com.itwillbs.login.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.auth.domain.AuthDTO;
import com.itwillbs.auth.service.AuthService;
import com.itwillbs.login.service.LoginService;
import com.itwillbs.member.domain.MemberDTO;


@Controller
public class LoginController {

	@Inject
	private LoginService loginService; // 4버전.자동으로 객체생성 한 것.
	
	@Inject
	private AuthService authService;

	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login() {
		
		return "login/login";
		
	}

	@RequestMapping(value = "/login/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("LoginController loginPro()");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		
		MemberDTO memberDTO2 = loginService.login(memberDTO);

		if (memberDTO2 != null) {
			// 아이디,비밀번호 일치
			System.out.println("LoginController.loginPro.아이디 비밀번호 일치");
			session.setAttribute("id", memberDTO.getId());
			session.setAttribute("name", memberDTO2.getName());
			
			List<AuthDTO> authlist = authService.getauth(memberDTO2);
			for(int i=0;i<authlist.size();i++) {
				AuthDTO auth = authlist.get(i);
				session.setAttribute("menu"+auth.getMenuCd(), auth.getMenuCd());
			}
			// 주소 변경되면서 메인페이지로 이동
			return "redirect:/member/list";
		} else {
			// 아이디,비밀번호 틀림
			System.out.println("LoginController.loginPro.아이디 비밀번호 틀림");
			// common/msg.jsp 만들어서 "아이디 비밀번호 틀림" 메시지 출력하고 뒤로이동
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

	// 가상주소 http://localhost:8080/login/idCheck
		@RequestMapping(value = "/login/idCheck")
		public ResponseEntity<String> idCheck(MemberDTO memberDTO,HttpServletRequest request) {
			System.out.println("LoginController idCheck() ");
			String result="";
			// request 파라미터 id값 가져오기
			String id=request.getParameter("id");
			// 디비 아이디 중복체크
			MemberDTO memberDTO2 = loginService.idCheck(memberDTO);
			if(memberDTO2!=null) {
				//아이디 있음 => 아이디 중복
				result="Y";
			}else {
				//아이디 없음 => 아이디 사용가능
				result="N";
			}
			//출력 결과 ResponseEntity 저장 => 되돌아감
			ResponseEntity<String> entity= new ResponseEntity<String>(result,HttpStatus.OK);
			return entity;
		}
}
	

