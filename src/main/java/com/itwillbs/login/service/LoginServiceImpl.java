package com.itwillbs.login.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.login.dao.LoginDAO;
import com.itwillbs.member.domain.MemberDTO;

@Service
public class LoginServiceImpl implements LoginService {
	// 처리작업
	@Inject
	private LoginDAO loginDAO;

	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl login()");
		
		return loginDAO.login(memberDTO);
	}





	

}
