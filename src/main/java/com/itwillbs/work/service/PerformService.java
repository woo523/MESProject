package com.itwillbs.work.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;

@Service
public interface PerformService {

	public List<InstruListDTO> InstruList();
	
	public List<PerformRgDTO> PerformRgList(int instrId);
}
