package com.itwillbs.sample.service;

import java.util.List;

import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.sample.domain.SampleDTO;

public interface SampleService {
	
	//그리드에 뿌려줄 데이터 조회
	public List<SampleDTO> searchList();
}
