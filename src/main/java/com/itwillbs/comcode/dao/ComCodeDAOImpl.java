package com.itwillbs.comcode.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.comcode.domain.ComCodeDTO;

@Repository
public class ComCodeDAOImpl implements ComCodeDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.comCodeMapper";

	@Override
	public void insertComCode(ComCodeDTO comCodeDTO) {
		// 디비작업
		System.out.println("ComCodeDAOImpl insertComCode()");
	
		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.insert(namespace + ".insertComCode", comCodeDTO);
	}

	@Override
	public List<ComCodeDTO> getComCodeList(ComCodeDTO comCodeDTO) {
		
		System.out.println("MemberDAOImpl getMemberList()");
		
		return sqlSession.selectList(namespace + ".getComCodeList", comCodeDTO);
		
	}

	@Override
	public int getComCodeCount() {// 총 개수 조회
		System.out.println("ComCodeDAOImpl getComCodeCount()");
		
		return sqlSession.selectOne(namespace + ".getComCodeCount");
	}

}
