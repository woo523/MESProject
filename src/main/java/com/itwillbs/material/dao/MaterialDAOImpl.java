package com.itwillbs.material.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.PageDTO;
import com.itwillbs.work.domain.ItemDTO;

@Repository
public class MaterialDAOImpl implements MaterialDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.materialMapper";
	
	@Override
	public List<Map<String, Object>> inmaterList() {
		System.out.println("InmaterialDAOImpl inmaterList()");
		
		return sqlSession.selectList(namespace + ".inmaterList");
	}


	@Override
	public List<Map<String, Object>> getInmaterLiMap(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl getInmaterLiMap()");
		
		return sqlSession.selectList(namespace + ".getSearchInmaterLiMap", search);
	}

	@Override
	public List<Map<String, Object>> getInmaterLiMap() {
		System.out.println("InmaterialDAOImpl getInmaterLiMap()");
		return sqlSession.selectList(namespace+".getInmaterLiMap");
	}

	
	@Override
	public List<Map<String, Object>> outmaterList() {
		System.out.println("OutmaterialDAOImpl outmaterList()");
		
		return sqlSession.selectList(namespace + ".outmaterList");
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(String whouse, String pcd, String startDate, String endDate, String ccd) {
		System.out.println("OutmaterialDAOImpl getOutmaterLiMap(서치용)");
		
		if(whouse==null) {
			whouse="";
		}

		Map<String,String> search = new HashMap<>();
		
		search.put("whouse", whouse);
		search.put("pcd", pcd);
		search.put("startDate", startDate);
		search.put("endDate", endDate);
		search.put("ccd", ccd);

		
		System.out.println("search : "+search);
	   
		return sqlSession.selectList(namespace+".getSearchOutmaterLiMap",search);
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap() {
		System.out.println("OutmaterialDAOImpl getOutmaterLiMap()");
		
		return sqlSession.selectList(namespace+".getOutmaterLiMap");
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String, Object> search) { // 품목리스트 들고오기 (품번, 품명)
		System.out.println("inmaterialDAOImpl getItemlist()");
		return sqlSession.selectList(namespace+".itemlist", search);
	}

	@Override
	public Integer countItemlist(Map<String, Object> search) { 
		System.out.println("intmaterialDAOImpl countItemlist()");
		return sqlSession.selectOne(namespace+".countItemlist", search);
	}

	@Override
	public List<ClientDTO> getClientlist(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl getClientlist()");
		return sqlSession.selectList(namespace+".clientlist", search);
	}

	@Override
	public Integer countClientlist(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl countClientlist()");
		return sqlSession.selectOne(namespace+".countClientlist", search);
	}


	@Override
	public List<Map<String, Object>> mtrlStateList(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl mtrlStateList()");
		return sqlSession.selectList(namespace+".mtrlStateSearch", search);
	}


	@Override
	public List<Map<String, Object>> mtrlStateList() {
		System.out.println("intmaterialDAOImpl mtrlStateList()");
		return sqlSession.selectList(namespace + ".mtrlStateList");
	}


	@Override
	public List<Map<String, Object>> materialState() {
		System.out.println("materialDAOImpl materialState()");
		
		return sqlSession.selectList(namespace + ".materialState");
	}

}