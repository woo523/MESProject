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
	public List<Map<String, Object>> getInstrLiMap() { // 실적등록 지시목록
		System.out.println("PerformServiceImpl getInstrLiMap()");
		return performDAO.getInstrLiMap();
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap(String line, String pcd, String sdate, String edate,String ists1, String ists2, String ists3) {
		System.out.println("PerformServiceImpl getInstrLiMap(서치용)"); // 실적등록 지시목록
		return performDAO.getInstrLiMap(line, pcd, sdate, edate, ists1, ists2, ists3);

	}

	@Override
	public List<Map<String, Object>> getPfLiMap(String instrId) { // 실적 목록
		System.out.println("PerformServiceImpl getPfLiMap()");
		return performDAO.getPfLiMap(instrId);
	}

	@Override
	public Map<String, Object> getInstrMap(int instrId) { // 지시목록 1개 들고오기
		System.out.println("PerformServiceImpl getInstrMap()");
		return performDAO.getInstrMap(instrId);
	}

	@Override
	public void insertPf(PerformDTO performDTO) { // 실적 등록
		System.out.println("PerformServiceImpl insertPf()");
		
		System.out.println("insertID : "+performDTO.getInsertId());
		InstructDTO insDTO = performDAO.getInstr(performDTO.getInstrId());
		System.out.println("insDTO : " +insDTO);
		performDTO.setInstrId(insDTO.getInstrId());
		performDTO.setLineId(insDTO.getLineId());
		performDTO.setItemId(insDTO.getItemId());
		performDTO.setInsertDate(new Timestamp(System.currentTimeMillis()));
		System.out.println("수량 :"+performDTO.getPerformQty());
		performDAO.insertPf(performDTO);
	}

	@Override
	public void delPf(int performId) { // 실적 삭제
		System.out.println("PerformServiceImpl delPf()");
		performDAO.delPf(performId);
	}

	@Override
	public PerformDTO getPf(int performId) { // 실적 목록 1개 들고오기
		System.out.println("PerformServiceImpl getPf()");
		return performDAO.getPf(performId);
	}

}
