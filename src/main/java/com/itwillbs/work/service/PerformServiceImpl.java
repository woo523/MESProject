package com.itwillbs.work.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.work.dao.PerformDAO;





@Service
public class PerformServiceImpl implements PerformService {

	@Inject
	private PerformDAO performDAO;

	@Override
	public List<Map<String, Object>> getInstrLiMap() {
		System.out.println("PerformServiceImpl getInstrLiMap()");
		return performDAO.getInstrLiMap();
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate,String ists1, String ists2, String ists3) {
		System.out.println("PerformServiceImpl getInstrLiMap(서치용)");
		return performDAO.getInstrLiMap(line, pcd, sdate, edate, ists1, ists2, ists3);

	}

}
