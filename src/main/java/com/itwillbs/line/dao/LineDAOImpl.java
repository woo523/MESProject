package com.itwillbs.line.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
