package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



@Repository
public class RequireDAOImpl implements RequireDAO{
	
	//마이바티스 멤버변수 선언 => 자동객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.requireMapper";

	@Override
	public List<Map<String, Object>> getRequireMap() {
		
		return sqlSession.selectList(namespace + ".getRequireMap");
	}
	
	

	
}
