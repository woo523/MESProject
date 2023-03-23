package com.itwillbs.material.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.PageDTO;

@Repository
public class InmaterialDAOImpl implements InmaterialDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.inmaterialMapper";
	
	@Override
	public List<Map<String, Object>> inmaterList() {
		System.out.println("InmaterialDAOImpl inmaterList()");
		
		return sqlSession.selectList(namespace + ".inmaterList");
	}

	@Override
	public List<InmaterialDTO> getInmaterList(PageDTO pageDTO) {
		System.out.println("InmaterialDAOImpl getInmaterList()");
		
		// limit #{startRow-1} , #{pageSize}
		// (1을 포함하지 않고 10개) 1-1,10 =>  1~10
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getInmaterList", pageDTO);
	}

	@Override
	public int getInmaterCount() {
		System.out.println("InmaterialDAOImpl getInmaterCount()");
		
		return sqlSession.selectOne(namespace+".getInmaterCount");
	}

	@Override
	public List<Map<String, Object>> getInmaterLiMap(String instock, String pcd, String sdate, String edate, String ccd,
			String cnm) {
		System.out.println("InmaterialDAOImpl getInmaterLiMap(서치용)");
		Map<String,String> search = new HashMap<>();
		search.put("instock", instock);
		search.put("pcd", pcd);
		search.put("sdate", sdate);
		search.put("edate", edate);
		search.put("ccd", ccd);
		search.put("cnm", cnm);

		
		System.out.println("search : "+search);
	    return sqlSession.selectList(namespace+".getInmaterLiMap",search);
	}

}