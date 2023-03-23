package com.itwillbs.login.dao;

import java.util.List;

import com.itwillbs.member.domain.MemberDTO;

public interface LoginDAO {
	// 추상메서드 틀 정의
	
	// id,pw확인
	public MemberDTO login(MemberDTO memberDTO);

	// 중복체크
	public MemberDTO idCheck(MemberDTO memberDTO);
}
