package com.itwillbs.work.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.work.dao.PerformDAO;
import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.work.domain.PageDTO;
import com.itwillbs.work.domain.PerformDTO;


@Service
public class PerformServiceImpl implements PerformService {

	@Inject
	private PerformDAO performDAO;

	@Override
	public List<Map<String, Object>> getInstrLiMap(PageDTO pageDTO) { // 실적등록 지시목록
		System.out.println("PerformServiceImpl getInstrLiMap()");
		return performDAO.getInstrLiMap(pageDTO);
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap(Map<String,Object> search) {
		System.out.println("PerformServiceImpl getInstrLiMap(서치용)"); // 실적등록 지시목록
		return performDAO.getInstrLiMap(search);

	}
	
	@Override
	public Integer countInstrLi(Map<String,Object> search) { // 실적등록 지시목록 개수
		System.out.println("PerformServiceImpl countInstrLi()");
		return performDAO.countInstrLi(search);
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

	@Override
	public void updatePf(PerformDTO performDTO) { // 실적 수정
		System.out.println("PerformServiceImpl updatePf()");
		performDAO.updatePf(performDTO);
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String,Object> search) { // 폼목 리스트 
		System.out.println("PerformServiceImpl getItemlist()");
		return performDAO.getItemlist(search);
	}



}
