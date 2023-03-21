package com.itwillbs.material.service;

import java.util.List;


import com.itwillbs.material.domain.InmaterialDTO;

public interface InmaterialService {
	//그리드에 뿌려줄 데이터 조회
	public List<InmaterialDTO> inmaterList();
}
