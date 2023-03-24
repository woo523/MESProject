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
	public List<Map<String, Object>> getInstrLiMap() { // 실적등록 지시목록
		System.out.println("PerformDAOImpl getInstrLiMap()");
		
		return sqlSession.selectList(namespace+".getInstrLiMap");
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate, String ists1, String ists2, String ists3) {
		System.out.println("PerformDAOImpl getInstrLiMap(서치용)"); // 실적등록 지시목록
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
	public List<Map<String, Object>> getPfLiMap(String instrId) { // 지시번호에 해당되는 실적 목록(화면에 출력되는)
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectList(namespace+".getPfLiMap",instrId);
	}

	@Override
	public Map<String, Object> getInstrMap(int instrId) { // 실적등록에 보여지는 지시 목록 하나 불러오기
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectOne(namespace+".getInstrMap",instrId);
	}

	@Override
	public InstructDTO getInstr(int instrId) { // 지시번호에 해당되는 지시목록
		System.out.println("PerformDAOImpl getInstr()");
		return sqlSession.selectOne(namespace+".getInstr",instrId);
	}

	@Override
	public void insertPf(PerformDTO performDTO) { // 실적 등록
		System.out.println("PerformDAOImpl insertPf()");
		sqlSession.insert(namespace+".insertPf", performDTO);
	}

	@Override
	public void delPf(int performId) { // 실적 삭제
		System.out.println("PerformDAOImpl delPf()");
		sqlSession.delete(namespace+".delPf", performId);
	}

	@Override
	public PerformDTO getPf(int performId) { // 실적 정보 1개 가져오기
		System.out.println("PerformDAOImpl getPf()");
		return sqlSession.selectOne(namespace+".getPf",performId);
	}

	@Override
	public void updatePf(PerformDTO performDTO) {
		System.out.println("PerformDAOImpl updatePf()");
		sqlSession.update(namespace+".updatePf", performDTO);
	}
	
	
	
	
}
