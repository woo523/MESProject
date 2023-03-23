package com.itwillbs.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.PerformDTO;



@Repository
public class PerformDAOImpl implements PerformDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.performMapper";

	@Override
	public List<Map<String, Object>> getInstrLiMap() {
		System.out.println("PerformDAOImpl getInstrLiMap()");
		
		return sqlSession.selectList(namespace+".getInstrLiMap");
	}


	@Override
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3) {
		System.out.println("PerformDAOImpl getInstrLiMap(서치용)");
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


	@Override
	public List<Map<String, Object>> getPfLiMap(String instrId) {
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectList(namespace+".getPfLiMap",instrId);
	}


	@Override
	public Map<String, Object> getInstrMap(String instrId) { // 실적 등록에 보여지는 지시 리스트 항목 하나 불러오기
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectOne(namespace+".getInstrMap",instrId);
	}


	@Override
	public InstructDTO getInstr(int instrId) {
		System.out.println("PerformDAOImpl getInstr()");
		return sqlSession.selectOne(namespace+".getInstr",instrId);
	}


	@Override
	public void insertPf(PerformDTO performDTO) {
		System.out.println("PerformDAOImpl insertPf()");
		sqlSession.insert(namespace+".insertPf", performDTO);
	}
	
	
	
	
}
