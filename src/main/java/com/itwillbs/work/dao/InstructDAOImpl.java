package com.itwillbs.work.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.work.domain.InstructDTO;

@Repository
public class InstructDAOImpl implements InstructDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.instructMapper";

	@Override
	public List<InstructDTO> instrList() {
		System.out.println("InstructDAOImpl instrList()");
		
		return sqlSession.selectList(namespace + ".instrList");
	}

}
