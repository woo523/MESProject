package com.itwillbs.auth.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.auth.domain.AuthDTO;
import com.itwillbs.auth.domain.MenuDTO;
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
	public String authuser(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO memberDTO) {
		
		List<MemberDTO> memberList = memberService.getMemberList(memberDTO, model);
		
		model.addAttribute("memberList", memberList);
		
		return "auth/user";
	}
	
	@RequestMapping(value = "/auth/auth", method = RequestMethod.GET)
	public String auth(Model model, HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		List<MenuDTO> menulist = authService.getMenu();
		
		MemberDTO memberDTO = memberService.getMember(userId);
		
		List<AuthDTO> authlist = authService.getMenuauth(memberDTO);
		
		model.addAttribute("authlist", authlist);
		model.addAttribute("menulist", menulist);
		model.addAttribute("memberDTO", memberDTO);
		
		return "auth/auth";
	}
	
	@RequestMapping(value = "/auth", method = RequestMethod.GET)
	public String authgo(HttpServletRequest request) {
		
		int userId = Integer.parseInt(request.getParameter("userId"));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		for(int i=1;i<=18;i++) {
			map.put("menuCd", i);
			authService.inauth(map);
		}
		
		return "redirect:/auth/user";
	}
	
	
	@RequestMapping(value = "/auth/update", method = RequestMethod.GET)
	public String update(@RequestParam List<Integer> menuCd, @RequestParam String userId) {
		
		
		System.out.println("메뉴코드 :"+menuCd);
		System.out.println("아이디 :"+userId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);

		List<Integer> allMenuCd = new ArrayList<>(); // 전체 메뉴 코드 리스트
		for (int i = 1; i <= 18; i++) {
		    allMenuCd.add(i);
		}

		List<Integer> nonAuthMenuCd = new ArrayList<>(); // 권한이 없는 메뉴 코드 리스트
		for (Integer code : allMenuCd) {
		    if (!menuCd.contains(code)) {
		        nonAuthMenuCd.add(code);
		    }
		}
		
		for(int i=0;i<menuCd.size();i++) {
			map.put("menuCd", menuCd.get(i));
			authService.updateauth(map); // 권한 부여하기
		}
		
		for(int i=0;i<nonAuthMenuCd.size();i++) {
			map.put("menuCd", nonAuthMenuCd.get(i));
			authService.updatenonauth(map); // 권한 삭제하기
		}

	    
		return "redirect:/auth/user";
	}
	
}
