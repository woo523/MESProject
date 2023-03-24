package com.itwillbs.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class InstructDAOImpl implements InstructDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.instructMapper";

	@Override
	public List<Map<String, Object>> instrList() {
		System.out.println("InstructDAOImpl instrList()");
		
		return sqlSession.selectList(namespace+".instrList");
	}

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch) {
		System.out.println("InstructDAOImpl instrList");
		
		return sqlSession.selectList(namespace+".instrSearch", instrSearch);
	}

}
