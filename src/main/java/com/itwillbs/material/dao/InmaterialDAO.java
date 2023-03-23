package com.itwillbs.material.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.PageDTO;

public interface InmaterialDAO {
	
	public List<Map<String, Object>> inmaterList();
	
	public List<InmaterialDTO> getInmaterList(PageDTO pageDTO);
	
	public int getInmaterCount();
}
