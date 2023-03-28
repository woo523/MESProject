package com.itwillbs.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.work.domain.PageDTO;
import com.itwillbs.work.domain.PerformDTO;



@Repository
public class PerformDAOImpl implements PerformDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.performMapper";

	@Override
	public List<Map<String, Object>> getInstrLiMap(PageDTO pageDTO) { // 실적등록 지시목록
		System.out.println("PerformDAOImpl getInstrLiMap()");
		
		return sqlSession.selectList(namespace+".getInstrLiMap", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap(Map<String,Object> search) {
		System.out.println("PerformDAOImpl getInstrLiMap(서치용)"); // 실적등록 지시목록

	    return sqlSession.selectList(namespace+".getSearchInstrLiMap",search);

	}
	
	@Override
	public Integer countInstrLi(Map<String,Object> search) { // 실적등록 지시목록 개수(for 페이징)
		System.out.println("PerformDAOImpl countInstrLi()");
		return sqlSession.selectOne(namespace+".countInstrLi", search);
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
	public void updatePf(PerformDTO performDTO) { // 실적 정보 수정
		System.out.println("PerformDAOImpl updatePf()");
		sqlSession.update(namespace+".updatePf", performDTO);
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String,Object> search) { // 품목리스트 들고오기 (품번, 품명만..)
		System.out.println("PerformDAOImpl getItemlist()");
		
		return sqlSession.selectList(namespace+".itemlist", search);
	}

	@Override
	public Integer countItemlist(Map<String, Object> search) { // 품목 개수(for 페이징)
		System.out.println("PerformDAOImpl countItemlist()");
		return sqlSession.selectOne(namespace+".countItemlist", search);
		
	}

	@Override
	public List<Map<String, Object>> PerformLiMap(Map<String, Object> search) { // 실적등록 현황 생산실적 목록
		System.out.println("PerformDAOImpl countItemlist()");
		return sqlSession.selectList(namespace+".PerformList", search);
	}

	@Override
	public Integer countPerformLi(Map<String, Object> search) { // 실적등록 현황 생산실적 목록 개수(for 페이징)
		System.out.println("PerformDAOImpl countPerformLi()");
		return sqlSession.selectOne(namespace+".countPerformLi", search);
	}

	@Override
	public List<Map<String, Object>> ReqList(String performId) {
		System.out.println("pI : " +performId);
		System.out.println("PerformDAOImpl ReqList()");
		return sqlSession.selectList(namespace+".ReqList", performId);
	}


	
	
	
	
}
