package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.material.dao.MaterialDAO;
import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.work.domain.ItemDTO;

@Service
public class MaterialServiceImpl implements MaterialService{

	@Inject 
	private MaterialDAO materialDAO;
	
	@Override
	public List<Map<String, Object>> inmaterList() {
		System.out.println("InmaterialServiceImpl inmaterList()");
		
		return materialDAO.inmaterList();
	}

	@Override
	public List<Map<String, Object>> getInmaterLiMap(Map<String, Object> search) {
		System.out.println("InmaterialServiceImpl getInmaterLiMap()");
		return materialDAO.getInmaterLiMap(search);
	}

	@Override
	public List<Map<String, Object>> getInmaterLiMap() {
		System.out.println("InmaterialServiceImpl getInmaterLiMap()");
		return materialDAO.getInmaterLiMap();
	}
	
	@Override
	public List<Map<String, Object>> outmaterList() {
		System.out.println("OutmaterialServiceImpl outmaterList()");
		
		return materialDAO.outmaterList();
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(String whouse, String pcd, String startDate, String endDate,
			String ccd) {
		System.out.println("OutmaterialServiceImpl getOutmaterLiMap(서치용)");
		
		return materialDAO.getOutmaterLiMap(whouse, pcd, startDate, endDate, ccd);
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap() {
		System.out.println("OutmaterialServiceImpl getOutmaterLiMap()");
		
		return materialDAO.getOutmaterLiMap();
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String, Object> search) {	// 폼목 리스트 
		System.out.println("InmaterialServiceImpl getItemlist()");
		return materialDAO.getItemlist(search);
	}

	@Override
	public Integer countItemlist(Map<String, Object> search) {	// 개수
		System.out.println("InmaterialServiceImpl countItemlist()");
		return materialDAO.countItemlist(search);
	}

	@Override
	public List<ClientDTO> getClientlist(Map<String, Object> search) { // 업체 리스트 
		System.out.println("InmaterialServiceImpl getClientlist()");
		return materialDAO.getClientlist(search);
	}

	@Override
	public Integer countClientlist(Map<String, Object> search) {	// 개수
		System.out.println("InmaterialServiceImpl countClientlist()");
		return materialDAO.countClientlist(search);
	}



}