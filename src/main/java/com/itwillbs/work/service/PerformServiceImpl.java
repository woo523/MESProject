package com.itwillbs.work.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.work.dao.PerformDAO;
import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.PerformDTO;


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

	@Override
	public List<Map<String, Object>> getPfLiMap(String instrId) {
		System.out.println("PerformServiceImpl getPfLiMap()");
		return performDAO.getPfLiMap(instrId);
	}

	@Override
	public Map<String, Object> getInstrMap(String instrId) {
		System.out.println("PerformServiceImpl getInstrMap()");
		return performDAO.getInstrMap(instrId);
	}

	@Override
	public void insertPf(PerformDTO performDTO) {
		System.out.println("PerformServiceImpl insertPf()");
		
		performDTO.setPerformId(0);
		System.out.println(performDTO.getInsertId());
		InstructDTO insDTO = performDAO.getInstr(performDTO.getInsertId());
		performDTO.setInstrId(insDTO.getInstrId());
		performDTO.setLineId(insDTO.getLineId());
		performDTO.setItemId(insDTO.getItemId());
		performDTO.setInsertDate(new Timestamp(System.currentTimeMillis()));
		performDTO.setPerformDate(new Timestamp(System.currentTimeMillis()));
		performDAO.insertPf(performDTO);
	}

}
