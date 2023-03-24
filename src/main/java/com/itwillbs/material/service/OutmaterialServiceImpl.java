package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.material.dao.OutmaterialDAO;

@Service
public class OutmaterialServiceImpl implements OutmaterialService{

	@Inject
	private OutmaterialDAO outmaterialDAO;
	
	@Override
	public List<Map<String, Object>> outmaterList() {
		System.out.println("OutmaterialServiceImpl outmaterList()");
		
		return outmaterialDAO.outmaterList();
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(String whouse, String pcd, String sdate, String edate,
			String ccd) {
		System.out.println("OutmaterialServiceImpl getOutmaterLiMap(서치용)");
		
		return outmaterialDAO.getOutmaterLiMap(whouse, pcd, sdate, edate, ccd);
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap() {
		System.out.println("OutmaterialServiceImpl getOutmaterLiMap()");
		
		return outmaterialDAO.getOutmaterLiMap();
	}

}
