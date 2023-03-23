package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.material.dao.InmaterialDAO;
import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.PageDTO;

@Service
public class InmaterialServiceImpl implements InmaterialService{

	@Inject
	private InmaterialDAO inmaterialDAO;
	
	@Override
	public List<Map<String, Object>> inmaterList() {
		System.out.println("Inmaterial inmaterList()");
		
		return inmaterialDAO.inmaterList();
	}
	
	@Override
	public List<InmaterialDTO> getInmaterList(PageDTO pageDTO) {
		System.out.println("InmaterialImpl getInmaterList()");

		// 시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		// DTO에 담기
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);		
		
		return inmaterialDAO.getInmaterList(pageDTO);
	}

	@Override
	public int getInmaterCount() {
		System.out.println("Inmaterial getInmaterCount()");
		
		return inmaterialDAO.getInmaterCount();
	}

//	@Override
//	public List<Map<String, Object>> getInmaterLiMap(String instock, String pcd, String sdate, String edate, String ccd, String cnm) {
//		System.out.println("PerformServiceImpl getInmaterLiMap(서치용)");
//		return InmaterialDAO.getInmaterLiMap(instock, pcd, sdate, edate, ccd, cnm);
//	}

}