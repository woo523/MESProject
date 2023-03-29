package com.itwillbs.comcode.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.comcode.dao.ComCodeDAO;
import com.itwillbs.comcode.domain.ComCodeDTO;
import com.itwillbs.common.PageUtil;

@Service
public class ComCodeServiceImpl implements ComCodeService {

	// 처리작업
	@Inject
	private ComCodeDAO comCodeDAO ;
	
	// 멤버변수 값을 전달 생성자, set메서드 통해서 전달
	public void setComCodeDAO(ComCodeDAO comCodeDAO) {
		this.comCodeDAO = comCodeDAO;
	}


	@Override
	public void insertComCode(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeServiceImpl insertComCode()");
		// 메서드 호출
		comCodeDAO.insertComCode(comCodeDTO);
		
	}


	@Override
	public List<ComCodeDTO> getComCodeList(ComCodeDTO comCodeDTO, Model model) {
		System.out.println("ComCodeServiceImpl comCodeList()");
	
		int totalCnt = comCodeDAO.getComCodeCount(); // 페이징할때 쓰려고 총공통코드개수 조회함.
		
		PageUtil.getPaging(comCodeDTO, model, totalCnt); // 페이징처리 함수불러온다.
		
		return comCodeDAO.getComCodeList(comCodeDTO); // 회원리스트를 리턴
	}


	@Override
	public void updateComCode(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeServiceImpl updateComCode()");
		comCodeDAO.updateComCode(comCodeDTO);
	}


	@Override
	public void deleteComCode(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeServiceImpl deleteComCode()");
		comCodeDAO.deleteComCode(comCodeDTO);
	}


	@Override
	public ComCodeDTO getComCode(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeServiceImpl getComCode()");
		return comCodeDAO.getComCode(comCodeDTO);
	}


	
	
	//하위코드리스트 팝업에서 뿌려줄 하위코드들 조회 (코드그룹을 where 조건으로 줘서 조회)
	@Override
	public List<ComCodeDTO> getSubComCodeList(String cdGrp) {
		System.out.println("ComCodeServiceImpl getSubComCodeList()");
		
		return comCodeDAO.getSubComCodeList(cdGrp);
	}


	//사용여부가 사용이면서 코드그룹으로 하위코드 리스트들 조회
	@Override
	public List<ComCodeDTO> selcetCode(String cdGrp) {
		System.out.println("ComCodeServiceImpl selcetCode()");
		
		return comCodeDAO.selcetCode(cdGrp);
	}

	// 공통코드 중복체크
	@Override
	public ComCodeDTO comCheck(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeServiceImpl comCheck()");
		
		return comCodeDAO.comCheck(comCodeDTO);
	}


	


	

	
	
	
	
	
	
}
