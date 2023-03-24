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
	public List<Map<String, Object>> instrList(String lineName, String workDate, String itemNum, String workSts) {
		System.out.println("InstructDAOImpl instrList()");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put(lineName, lineName);
		instrSearch.put(workDate, workDate);
		instrSearch.put(itemNum, itemNum);
		instrSearch.put(workSts, workSts);
		
		return sqlSession.selectList(namespace+".instrList", instrSearch);
	}

}
