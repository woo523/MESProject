package com.itwillbs.login.service;


import com.itwillbs.member.domain.MemberDTO;

public interface LoginService {
	// 클래스 만들기 위한 부모 인터페이스 틀
	// 추상메서드 틀 정의
	
	public MemberDTO login(MemberDTO memberDTO);
	
	public MemberDTO idCheck(MemberDTO memberDTO);
}
