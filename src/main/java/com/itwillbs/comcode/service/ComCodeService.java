package com.itwillbs.comcode.service;

import java.util.List;

import org.springframework.ui.Model;

import com.itwillbs.comcode.domain.ComCodeDTO;
import com.itwillbs.member.domain.MemberDTO;

public interface ComCodeService {

	public void insertComCode(ComCodeDTO comCodeDTO);

	public List<ComCodeDTO> getComCodeList(ComCodeDTO comCodeDTO, Model model);
	
	public void updateComCode(ComCodeDTO comCodeDTO);
	
	public void deleteComCode(ComCodeDTO comCodeDTO);
	
	public ComCodeDTO getComCode(ComCodeDTO comCodeDTO);
	
	//하위코드리스트 팝업에서 뿌려줄 하위코드들 조회 (코드그룹을 where 조건으로 줘서 조회)
	public List<ComCodeDTO> getSubComCodeList(String cd);
	
	
	//사용여부가 사용이면서 코드그룹으로 하위코드 리스트들 조회
	public List<ComCodeDTO> selcetCode(String cd);
}
