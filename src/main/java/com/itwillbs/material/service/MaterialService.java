package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.OutmaterialDTO;
import com.itwillbs.material.domain.PageDTO;
import com.itwillbs.material.domain.StockDTO;
import com.itwillbs.work.domain.ItemDTO;


@Service
public interface MaterialService {

	public List<Map<String, Object>> inmaterList();
	
	public List<Map<String, Object>> getInmaterLiMap(Map<String, Object> search);

	public List<Map<String, Object>> getInmaterLiMap(PageDTO pageDTO);
	
	public Integer countMtrlLi(Map<String,Object> search);
	
	public List<Map<String, Object>> outmaterList();
	
	public List<Map<String, Object>> getOutmaterLiMap(PageDTO pageDTO);

	public List<Map<String, Object>> getOutmaterLiMap(Map<String, Object> search);
	
	public Integer countOutLi(Map<String,Object> search);

	public List<ItemDTO> getItemlist(Map<String, Object> search);

	public Integer countItemlist(Map<String, Object> search);

	public List<ClientDTO> getClientlist(Map<String, Object> search);

	public Integer countClientlist(Map<String, Object> search);

	public List<Map<String, Object>> mtrlStateList(Map<String, Object> search);

	public List<Map<String, Object>> mtrlStateList(PageDTO pageDTO);
	
	public List<Map<String, Object>> materialState();

	public Integer countStateLi(Map<String, Object> search);

//	public Map<String, Object> getInmtrlMap(int inmtrlId);

	public void insertInmtrl(InmaterialDTO inmaterialDTO);

	public void deleteInmtrl(int inmtrlId);

	public void deleteOutmtrl(int outmtrlId);

	public void insertOutmtrl(OutmaterialDTO outmaterialDTO);

	public InmaterialDTO getInmtrlList(int inmtrlId);

	public void updateInmtrl(InmaterialDTO inmaterialDTO);

	public StockDTO getStockList(int stockId);

	public void updateStock(StockDTO stockDTO, int stockId);

	public InmaterialDTO getInmtrl(int inmtrlId);

	public Map<String, Object> getInmtrlMap(int inmtrlId);

	public OutmaterialDTO getOutmtrl(int outmtrlId);

	public Map<String, Object> getOutmtrlMap(int outmtrlId);

	public void updateOutmtrl(OutmaterialDTO outmaterialDTO);
	

}

