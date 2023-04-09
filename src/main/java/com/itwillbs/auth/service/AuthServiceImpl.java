package com.itwillbs.auth.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.auth.dao.AuthDAO;
import com.itwillbs.auth.domain.AuthDTO;
import com.itwillbs.auth.domain.MenuDTO;
import com.itwillbs.member.domain.MemberDTO;

@Service
public class AuthServiceImpl implements AuthService {
	
	@Inject
	private AuthDAO authDAO;

	@Override
	public List<MenuDTO> getMenu() {
		System.out.println("AuthServiceImpl getMenu()");
		return authDAO.getMenu();
	}

	@Override
	public void inauth(int userId) { // 권한 기본적으로 전부 N로 부여하기
		System.out.println("AuthServiceImpl inauth()");	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		for(int i=1;i<=18;i++) {
			map.put("menuCd", i);
			authDAO.inauth(map);
		}
		
	}

	@Override
	public void updateauth(Map<String, Object> map) {
		System.out.println("AuthServiceImpl inauth()");	
		authDAO.updateauth(map);
		
	}

	@Override
	public List<AuthDTO> getMenuauth(MemberDTO memberDTO) {
		System.out.println("AuthServiceImpl getMenuauth()");	
		
		return authDAO.getMenuauth(memberDTO);
	}

	@Override
	public List<AuthDTO> getauth(MemberDTO memberDTO) {
		System.out.println("AuthServiceImpl getauth()");	
		return authDAO.getauth(memberDTO);
	}

	@Override
	public void updatenonauth(Map<String, Object> map) {
		System.out.println("AuthServiceImpl updatenonauth()");
		authDAO.updatenonauth(map);
	}

	@Override
	public void delauth(MemberDTO memberDTO) {
		System.out.println("AuthServiceImpl delauth()");
		authDAO.delauth(memberDTO);
	}

}
