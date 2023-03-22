package com.itwillbs.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.work.domain.PerformRgDTO;


@Repository
public class PerformDAOImpl implements PerformDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.performMapper";

	@Override
	public List<Map<String, Object>> getInstrLiMap() {
		System.out.println("MemberDAOImpl getInstrLiMap()");
		
		return sqlSession.selectList(namespace+".getInstrLiMap");
	}

	@Override
	public List<PerformRgDTO> PerformRgList(int instrId) {
		System.out.println("PerformDAOImpl PerformRgList()");
		return sqlSession.selectList(namespace+".PerformRgList", instrId);
	} // 안씀

	@Override
	public void insertPerform(Map<String, Object> row) {
		System.out.println("PerformDAOImpl insertPerform()");
		
		sqlSession.insert(namespace+".insertPerform", row);
	} //안씀
	
	
	@Override
	public Integer getMaxNumP() {
		System.out.println("PerformDAOImpll getMaxNumP()");
		
		return sqlSession.selectOne(namespace+".getMaxNumP");
	} // 안씀

	@Override
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3) {
		System.out.println("MemberDAOImpl getInstrLiMap(서치용)");
		Map<String,String> search = new HashMap<>();
		search.put("line", line);
		search.put("pcd", pcd);
		search.put("sdate", sdate);
		search.put("edate", edate);
		search.put("ists1", ists1);
		search.put("ists2", ists2);
		search.put("ists3", ists3);
		
		System.out.println("search : "+search);
	    return sqlSession.selectList(namespace+".getSearchInstrLiMap",search);

	}
	
	
	
	
}
