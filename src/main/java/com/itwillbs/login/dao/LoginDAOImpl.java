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
	public MemberDTO login(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl userCheck()");

		// selectOne = 리턴값이 MemberDTO 하나일 때 사용
		return sqlSession.selectOne(namespace + ".login", memberDTO);
		// (이름+".전체이름",변수);

	}

}
