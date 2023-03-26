package com.itwillbs.comcode.service;

import java.util.List;

import org.springframework.ui.Model;

import com.itwillbs.comcode.domain.ComCodeDTO;

public interface ComCodeService {

	public void insertComCode(ComCodeDTO comCodeDTO);

	public List<ComCodeDTO> getComCodeList(ComCodeDTO comCodeDTO, Model model);
}
