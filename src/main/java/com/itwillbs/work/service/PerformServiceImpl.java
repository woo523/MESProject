package com.itwillbs.work.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.work.dao.PerformDAO;
import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformDTO;
import com.itwillbs.work.domain.PerformRgDTO;



@Service
public class PerformServiceImpl implements PerformService {

	@Inject
	private PerformDAO performDAO;
	


	@Override
	public List<PerformRgDTO> PerformRgList(int instrId) {
		System.out.println("PerformServiceImpl PerformRgList()");
		return performDAO.PerformRgList(instrId);
	}

	@Override
	public void insertPerform(Map<String,Object> row) {
		System.out.println("PerformServiceImpl insertPerform()");
		if(performDAO.getMaxNumP()==null) {
			row.put("prfrm_id", 1);
		}else {
			row.put("prfrm_id",performDAO.getMaxNumP()+1);
		}		
		
		row.put("prfrm_dt", new Timestamp(System.currentTimeMillis()));
		row.put("insert_dt", new Timestamp(System.currentTimeMillis()));
		
		
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap() {
		System.out.println("PerformServiceImpl getInstrLiMap()");
		return performDAO.getInstrLiMap();
	}

	

}
