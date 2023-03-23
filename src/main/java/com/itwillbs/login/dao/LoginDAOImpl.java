package com.itwillbs.login.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.member.domain.MemberDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.loginMapper";


	@Override
	public MemberDTO login(MemberDTO memberDTO) {// 로그인체크
		System.out.println("LoginDAOImpl login() 로그인체크");

		// selectOne = 리턴값이 MemberDTO 하나일 때 사용
		return sqlSession.selectOne(namespace + ".login", memberDTO);
		// (이름+".전체이름",변수);

	}


	@Override
	public MemberDTO idCheck(MemberDTO memberDTO) {
		System.out.println("LoginDAOImpl idCheck() 중복확인");
		
		return sqlSession.selectOne(namespace + ".idCheck", memberDTO);
		// (이름+".전체이름",변수);
	}

		
}
