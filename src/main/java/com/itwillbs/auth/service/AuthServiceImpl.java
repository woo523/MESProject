package com.itwillbs.auth.service;

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
	public void inauth(Map<String, Object> map) {
		System.out.println("AuthServiceImpl inauth()");	
		authDAO.inauth(map);
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

}
