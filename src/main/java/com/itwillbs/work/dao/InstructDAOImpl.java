package com.itwillbs.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.common.PageDTO;

@Repository
public class InstructDAOImpl implements InstructDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.instructMapper";

	@Override
	public List<Map<String, Object>> instrList(PageDTO pageDTO) {
		System.out.println("InstructDAOImpl instrList()");
		
		return sqlSession.selectList(namespace+".instrList", pageDTO);
	}

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch, PageDTO pageDTO) {
		System.out.println("InstructDAOImpl instrSearch");
		
		Map<String, Object> instrListPaging = new HashMap<String, Object>();
		instrListPaging.put("instrSearch", instrSearch);
		instrListPaging.put("pageDTO", pageDTO);
		
		System.out.println("작업지시 페이징 : " + instrListPaging);
		
		return sqlSession.selectList(namespace+".instrSearch", instrListPaging);
	}

	@Override
	public Integer instrCount() {
		System.out.println("InstructDAOImpl instrCount");
		
		return sqlSession.selectOne(namespace+".instrCount");
	}

	@Override
	public Integer instrCount(Map<String, Object> instrSearch) {
		System.out.println("InstructDAOImpl instrSearch");
		
		return sqlSession.selectOne(namespace+".instrSearchCount", instrSearch);
	}

}
