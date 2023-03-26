package com.itwillbs.comcode.dao;

import java.util.List;

import com.itwillbs.comcode.domain.ComCodeDTO;

public interface ComCodeDAO {

	public void insertComCode(ComCodeDTO comCodeDTO);

	public List<ComCodeDTO> getComCodeList(ComCodeDTO comCodeDTO);

	public int getComCodeCount();



}
