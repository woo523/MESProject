package com.itwillbs.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.member.dao.MemberDAO;
import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.sample.dao.SampleDAO;
import com.itwillbs.sample.domain.SampleDTO;



@Service 
public class SampleServiceImpl implements SampleService{
	// 처리작업 
	@Inject
	private SampleDAO sampleDAO;

	
	@Override
	public List<SampleDTO> searchList() {
		return sampleDAO.searchList();
	}
	

	
}
