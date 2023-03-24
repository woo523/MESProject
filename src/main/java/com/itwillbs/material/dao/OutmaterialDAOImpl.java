package com.itwillbs.material.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OutmaterialDAOImpl implements OutmaterialDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.outmaterialMapper";
	
	@Override
	public List<Map<String, Object>> outmaterList() {
		System.out.println("OutmaterialDAOImpl outmaterList()");
		
		return sqlSession.selectList(namespace + ".outmaterList");
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(String whouse, String pcd, String sdate, String edate, String ccd) {
		System.out.println("OutmaterialDAOImpl getOutmaterLiMap(서치용)");
		
		if(whouse==null) {
			whouse="";
		}

		Map<String,String> search = new HashMap<>();
		
		search.put("whouse", whouse);
		search.put("pcd", pcd);
		search.put("sdate", sdate);
		search.put("edate", edate);
		search.put("ccd", ccd);

		
		System.out.println("search : "+search);
	   
		return sqlSession.selectList(namespace+".getSearchOutmaterLiMap",search);
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap() {
		System.out.println("OutmaterialDAOImpl getOutmaterLiMap()");
		
		return sqlSession.selectList(namespace+".getOutmaterLiMap");
	}



}
