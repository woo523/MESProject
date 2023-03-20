package com.itwillbs.work.service;

import java.util.List;

import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;

public interface PerformService {

	public List<InstruListDTO> InstruList();
	
	public List<PerformRgDTO> PerformRgList(int instrId);
}
