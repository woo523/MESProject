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

}
