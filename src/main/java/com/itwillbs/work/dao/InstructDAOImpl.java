package com.itwillbs.work.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.common.PageDTO;
import com.itwillbs.work.domain.InstructDTO;

@Repository
public class InstructDAOImpl implements InstructDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.instructMapper";

	@Override
	public List<Map<String, Object>> instrList(PageDTO pageDTO) {
		// 작업지시 전체 목록
		System.out.println("InstructDAOImpl instrList()");
		
		return sqlSession.selectList(namespace+".instrList", pageDTO);
	}

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch, PageDTO pageDTO) {
		// 작업지시 조회 목록
		System.out.println("InstructDAOImpl instrSearch");
		
		instrSearch.put("startRow", pageDTO.getStartRow());
		instrSearch.put("pageSize", pageDTO.getPageSize());
		
		System.out.println("작업지시 페이징 : " + instrSearch);
		
		return sqlSession.selectList(namespace+".instrSearch", instrSearch);
	}

	@Override
	public Integer instrCount() {
		// 작업지시 전체 목록 개수
		System.out.println("InstructDAOImpl instrCount");
		
		return sqlSession.selectOne(namespace+".instrCount");
	}

	@Override
	public Integer instrCount(Map<String, Object> instrSearch) {
		// 작업지시 조회 목록 개수
		System.out.println("InstructDAOImpl instrSearchCount");
		
		return sqlSession.selectOne(namespace+".instrSearchCount", instrSearch);
	}

	@Override
	public void insertInstr(InstructDTO instructDTO) {
		// 작업지시 등록
		System.out.println("InstructDAOImpl insertInstr");
		
		sqlSession.insert(namespace+".instrInsert", instructDTO);
	}

	@Override
	public List<Map<String, Object>> getLineList(String lineName) {
		// 작업지시 등록 라인 조회
		System.out.println("InstructDAOImpl getLineList");
		
		return sqlSession.selectList(namespace+".getLineList", lineName);
	}

	@Override
	public List<Map<String, Object>> getOrdList() {
		// 작업지시 등록 수주 조회
		return sqlSession.selectList(namespace+".getOrdList");
	}

	@Override
	public List<Map<String, Object>> getOrdList(Map<String, Object> ordSearch) {
		// 작업지시 등록 수주 검색 조회
		System.out.println("InstructDAOImpl getOrdList");
		
		return sqlSession.selectList(namespace+".getOrdListSearch", ordSearch);
	}

	@Override
	public InstructDTO instrIdList(int instrId) {
		// 작업지시 번호에 해당하는 작업지시
		return sqlSession.selectOne(namespace+".instrIdList", instrId);
	}

	@Override
	public List<Map<String, Object>> getInstrList(int instrId) {
		// 작업지시 번호에 해당하는 작업지시
		System.out.println("InstructDAOImple getInstrList");
		return sqlSession.selectList(namespace+".getInstrList", instrId);
	}

	@Override
	public void instrUpdate(InstructDTO instructDTO, int instrId) {
		// 작업지시 수정
		System.out.println("InstructDAOImpl instrUpdate");
		instructDTO.setInstrId(instrId);
		
		sqlSession.update(namespace+".instrUpdate", instructDTO);
	}

	@Override
	public void instrDelete(int instrId) {
		// 작업지시 삭제
		System.out.println("InstructDAOImpl instrDelete");
		
		sqlSession.delete(namespace+".instrDelete", instrId);
	}

}
