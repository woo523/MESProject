package com.itwillbs.line.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.common.PageDTO;
import com.itwillbs.line.domain.LineDTO;

@Repository
public class LineDAOImpl implements LineDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.lineMapper";

	@Override
	public List<LineDTO> lineList() {
		System.out.println("LineDAOImpl lineList()");
		
		return sqlSession.selectList(namespace + ".lineList");
	}

	@Override
	public List<Map<String, Object>> lineList(PageDTO pageDTO) {
		System.out.println("LineDAOImpl lineListPaging()");
		
		return sqlSession.selectList(namespace + ".lineListPaging", pageDTO);
	}

	@Override
	public List<Map<String, Object>> lineSearch(Map<String, Object> lineSearch, PageDTO pageDTO) {
		System.out.println("LineDAOImpl lineSearch()");
		System.out.println("라인 : " + lineSearch);
		
		// lineSearchPaging 리스트에 lineSearch, pageDTO 넣기
		Map<String, Object> lineSearchPaging = new HashMap<String, Object>();
		lineSearchPaging.put("lineSearch", lineSearch);
		lineSearchPaging.put("pageDTO", pageDTO);
		
		System.out.println("라인 페이징 : " + lineSearchPaging);
		
		return sqlSession.selectList(namespace+".lineSearch", lineSearchPaging);
	}

	@Override
	public Integer lineTotalCount() {
		System.out.println("LineDAOImpl lineTotalCount");
		
		return sqlSession.selectOne(namespace+".lineTotalCount");
	}

	@Override
	public Integer lineSearchCount(Map<String, Object> lineSearch) {
		System.out.println("LineDAOImpl lineSearchCount");
		
		return sqlSession.selectOne(namespace+".lineSearchCount", lineSearch);
	}

}
