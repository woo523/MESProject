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
		
		if(performDAO.checkY(performDTO.getInstrId())) { // 양품이 지시수량보다 같거나 많으면
			performDAO.updateClose(performDTO.getInstrId()); // 마감으로 지시 상태 변경
		}
		
		Map<String, Object> instr = performDAO.getInstrMap(performDTO.getInstrId());
		if(instr.get("workSts").equals("지시")) { // 지시 상태면 
			performDAO.updateStart(performDTO.getInstrId()); // 시작으로 변경
		}
		
		performDAO.updateStorage(performDTO); // 창고 재고 업뎃
		
		if(performDTO.getGbYn().equals("Y")){
		performDAO.updateStock(performDTO); }// 재고 현재고 업뎃
		
	}

	@Override
	public void delPf(int performId) { // 실적 삭제
		System.out.println("PerformServiceImpl delPf()");
		PerformDTO performDTO = performDAO.getPf(performId);
		int instrId = performDTO.getInstrId();
		performDAO.delPf(performId);
		
		if(performDAO.checkY(instrId)==false) { // 양품이 지시수량보다 적으면
			performDAO.updateStart(instrId); // 시작상태로 변경
			if(performDAO.getPfLiMap(String.valueOf(instrId)).size()==0) { // 실적이 하나도 없으면
				performDAO.updateInstr(instrId); // 지시상태로 변경
			}
		}
	
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
		
		if(performDAO.checkY(performDTO.getInstrId())) { // 양품이 지시수량보다 같거나 많으면
			performDAO.updateClose(performDTO.getInstrId()); // 마감으로 지시 상태 변경
		}else { // 양품이 지시수량보다 적으면
			performDAO.updateStart(performDTO.getInstrId()); // 상태는 시작
		}
		
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String,Object> search) { // 폼목 리스트 
		System.out.println("PerformServiceImpl getItemlist()");
		return performDAO.getItemlist(search);
	}

	@Override
	public Integer countItemlist(Map<String, Object> search) { // 품목 개수
		System.out.println("PerformServiceImpl countItemlist()");
		return performDAO.countItemlist(search);
	}

	@Override
	public List<Map<String, Object>> PerformLiMap(Map<String, Object> search) { // 실적등록 현황 생산실적 목록
		System.out.println("PerformServiceImpl PerformLiMap()");
		return performDAO.PerformLiMap(search);
	}

	@Override
	public Integer countPerformLi(Map<String, Object> search) { // 실적등록 현황 생산실적 목록 개수(for 페이징)
		System.out.println("PerformServiceImpl countPerformLi()");
		return performDAO.countPerformLi(search);
	}

	@Override
	public List<Map<String, Object>> ReqList(String performId) {
		System.out.println("PerformServiceImpl ReqList()");
		return performDAO.ReqList(performId);
	}



}
