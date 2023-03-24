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
	public List<Map<String, Object>> instrList(String lineName, String startDate, String endDate, String itemNum,
			String workSts1, String workSts2, String workSts3) {
		// System.out.println("InstructDAOImpl instrList");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("lineName", lineName);
		instrSearch.put("startDate", startDate);
		instrSearch.put("endDate", endDate);
		instrSearch.put("itemNum", itemNum);
		instrSearch.put("workSts1", workSts1);
		instrSearch.put("workSts2", workSts2);
		instrSearch.put("workSts3", workSts3);
		System.out.println(instrSearch);
		
		return sqlSession.selectList(namespace+".instrSearch", instrSearch);
	}

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch) {
		System.out.println("InstructDAOImpl instrList");
		
		return sqlSession.selectList(namespace+".instrSearch", instrSearch);
	}

}
