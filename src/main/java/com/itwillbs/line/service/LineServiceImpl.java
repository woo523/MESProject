package com.itwillbs.line.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.common.PageUtil;
import com.itwillbs.line.dao.LineDAO;
import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.work.domain.InstructDTO;

@Service
public class LineServiceImpl implements LineService{
	
	@Inject
	private LineDAO lineDAO;

	@Override
	public List<LineDTO> lineList() {
		System.out.println("LineServiceImpl lineList()");
		
		return lineDAO.lineList();
	}

	@Override
	public List<Map<String, Object>> lineList(PageDTO pageDTO, Model model) {
		System.out.println("LineServiceImpl lineList()");
		
		int totalCnt = lineDAO.lineTotalCount();
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return lineDAO.lineList(pageDTO);
	}

	@Override
	public List<Map<String, Object>> lineSearch(Map<String, Object> lineSearch, PageDTO pageDTO, Model model) {
		System.out.println("LineServiceImpl lineSearch()");
		
		int totalCnt = lineDAO.lineSearchCount(lineSearch);
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return lineDAO.lineSearch(lineSearch, pageDTO);
	}

	@Override
	public Integer lineTotalCount() {
		System.out.println("LineServiceImpl lineTotalCount");
		
		return lineDAO.lineTotalCount();
	}

	@Override
	public Integer lineSearchCount(Map<String, Object> lineSearch) {
		System.out.println("LineServiceImpl lineSearchCount");
		
		return lineDAO.lineSearchCount(lineSearch);
	}

	@Override
	public void insertLine(LineDTO lineDTO) {
		System.out.println("LineServiceImpl insertLine");
		
		lineDAO.insertLine(lineDTO);
	}

	@Override
	public LineDTO getLineList(int lineId) {
		// lindId에 해당하는 라인 목록 가져오기
		System.out.println("LineServiceImpl getLineList");
		
		return lineDAO.getLineList(lineId);
	}

	@Override
	public List<InstructDTO> getWorkList() {
		// 작업지시 지시상태 가져오기
		
		return lineDAO.getWorkList();
	}

	@Override
	public void updateLine(LineDTO lineDTO, int lineId) {
		// lineId에 해당하는 라인 수정
		System.out.println("LineServiceImpl updateLine");
		
		lineDAO.updateLine(lineDTO, lineId);
	}

	@Override
	public void deleteLine(int lineId) {
		System.out.println("LineServiceImpl deleteLine");
		
		lineDAO.deleteLine(lineId);
	}

}
