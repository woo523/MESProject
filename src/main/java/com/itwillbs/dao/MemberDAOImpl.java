package com.itwillbs.dao;

import java.sql.Timestamp;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject 
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.memberMapper";
	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 디비작업 
		System.out.println("MemberDAOImpl insertMember()");
		
		// 날짜는 처리작업에서 하지만 우선은 디비작업에서 한다.
		// import java.sql.Timestamp;
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.insert(namespace+ ".insertMember",memberDTO);	
	}


	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl userCheck()");
		
		// selectOne = 리턴값이 MemberDTO 하나일 때 사용
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
		// (이름+".전체이름",변수);
	}

}
