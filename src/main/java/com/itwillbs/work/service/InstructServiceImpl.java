package com.itwillbs.work.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.common.PageUtil;
import com.itwillbs.work.dao.InstructDAO;
import com.itwillbs.work.domain.InstructDTO;

@Service 
public class InstructServiceImpl implements InstructService{
	
	@Inject
	private InstructDAO instructDAO;

	@Override
	public List<Map<String, Object>> instrList(Map<String, Object> instrSearch, PageDTO pageDTO, Model model) {
		// 작업지시 전체 목록
		System.out.println("InstructServiceImpl instrList 전체");
		
		int totalCnt = instructDAO.instrCount(instrSearch);
		
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return instructDAO.instrList(pageDTO);
	}

	@Override
	public List<Map<String, Object>> instrListSearch(Map<String, Object> instrSearch, PageDTO pageDTO, Model model) {
		// 작업지시 검색 목록
		System.out.println("InstructServiceImpl instrList 검색");
		
		int totalCnt = instructDAO.instrCount(instrSearch);
		
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return instructDAO.instrList(instrSearch, pageDTO);
	}

	@Override
	public Integer instrCount() {
		// 작업지시 전체 개수
		System.out.println("InstructServiceImpl instrCount");
		
		return instructDAO.instrCount();
	}

	@Override
	public Integer instrCount(Map<String, Object> instrSearch) {
		// 작업지시 검색 개수
		System.out.println("InstructServiceImpl instrCount");
		
		return instructDAO.instrCount(instrSearch);
	}

	@Override
	public void insertInstr(InstructDTO instructDTO) {
		// 작업지시 등록
		System.out.println("InstructServiceImpl insertInstr");
		
		instructDTO.setInsertDate(new Timestamp(System.currentTimeMillis()));
		
		instructDAO.insertInstr(instructDTO);
	}

	@Override
	public List<Map<String, Object>> getLineList(String lineName) {
		// 작업지시 등록 라인 조회
		System.out.println("InstructServiceImpl getLineList");
		
		return instructDAO.getLineList(lineName);
	}

	@Override
	public List<Map<String, Object>> getOrdList() {
		// 작업지시 등록 수주 조회
		return instructDAO.getOrdList();
	}

	@Override
	public List<Map<String, Object>> getOrdList(Map<String, Object> ordSearch) {
		// 작업지시 등록 수주 검색 조회
		System.out.println("InstructServiceImpl getOrdList");
		
		return instructDAO.getOrdList(ordSearch);
	}

	@Override
	public InstructDTO instrIdList(int instrId) {
		// 작업지시 번호에 해당하는 작업지시
		return instructDAO.instrIdList(instrId);
	}

	@Override
	public List<Map<String, Object>> getInstrList(int instrId) {
		// 작업지시 번호에 해당하는 작업지시
		System.out.println("InstructServiceImpl getInstrList");
		
		return instructDAO.getInstrList(instrId);
	}

	@Override
	public void instrUpdate(InstructDTO instructDTO, int instrId) {
		// 작업지시 수정
		System.out.println("InstructServiceImpl instrUpdate");
		
		instructDAO.instrUpdate(instructDTO, instrId);
	}

	@Override
	public void instrDelete(int instrId) {
		// 작업지시 삭제
		System.out.println("InstructServiceImpl instrDelete");
		
		instructDAO.instrDelete(instrId);
	}
	
}
