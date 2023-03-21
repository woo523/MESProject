package com.itwillbs.work.dao;


import java.util.List;

import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;


public interface PerformDAO {

	public List<InstruListDTO> InstruList();
	
	public List<PerformRgDTO> PerformRgList(int instrId);
	
}
