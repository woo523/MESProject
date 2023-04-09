package com.itwillbs.material.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.material.dao.MaterialDAO;
import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.OutmaterialDTO;
import com.itwillbs.material.domain.PageDTO;
import com.itwillbs.material.domain.StockDTO;
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
		System.out.println("InmaterialServiceImpl getInmaterLiMap(서치용)");
		return materialDAO.getInmaterLiMap(search);
	}

	@Override
	public List<Map<String, Object>> getInmaterLiMap(PageDTO pageDTO) {
		System.out.println("InmaterialServiceImpl getInmaterLiMap()");
		return materialDAO.getInmaterLiMap(pageDTO);
	}
	
	@Override
	public Integer countMtrlLi(Map<String, Object> search) {
		System.out.println("InmaterialServiceImpl countMtrlLi()");
		return  materialDAO.countMtrlLi(search);
	}
	
	@Override
	public List<Map<String, Object>> outmaterList() {
		System.out.println("OutmaterialServiceImpl outmaterList()");
		
		return materialDAO.outmaterList();
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(Map<String, Object> search) {
		System.out.println("OutmaterialServiceImpl getOutmaterLiMap(서치용)");
		
		return materialDAO.getOutmaterLiMap(search);
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(PageDTO pageDTO) {
		System.out.println("OutmaterialServiceImpl getOutmaterLiMap()");
		
		return materialDAO.getOutmaterLiMap(pageDTO);
	}
	
	@Override
	public Integer countOutLi(Map<String, Object> search) {
		System.out.println("InmaterialServiceImpl countOutLi()");
		return  materialDAO.countOutLi(search);
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

	@Override
	public List<Map<String, Object>> mtrlStateList(Map<String, Object> search) { // 자재현황 리스트
		System.out.println("materialServiceImpl mtrlStateList(검색)");
		return materialDAO.mtrlStateList(search);
	}

	@Override
	public List<Map<String, Object>> mtrlStateList(PageDTO pageDTO) {
		System.out.println("materialServiceImpl mtrlStateList()");
		return materialDAO.mtrlStateList(pageDTO);
	}

	@Override
	public List<Map<String, Object>> materialState() {
		System.out.println("materialServiceImpl materialState()");
		
		return materialDAO.materialState();
	}

	@Override
	public Integer countStateLi(Map<String, Object> search) {
		System.out.println("InmaterialServiceImpl countStateLi()");
		return materialDAO.countStateLi(search);
	}


//	@Override
//	public Map<String, Object> getInmtrlMap(int inmtrlId) {
//		System.out.println("InmaterialServiceImpl getInmtrlMap()");
//		return materialDAO.getInmtrlMap(inmtrlId);
//	}

	@Override
	public void insertInmtrl(InmaterialDTO inmaterialDTO) {
		System.out.println("InmaterialServiceImpl insertInmtrl()");
		materialDAO.insertInmtrl(inmaterialDTO);
	}

	@Override
	public void deleteInmtrl(int inmtrlId) {
		System.out.println("InmaterialServiceImpl deleteInmtrl()");
	
		materialDAO.deleteInmtrl(inmtrlId);
	}

	@Override
	public void deleteOutmtrl(int outmtrlId) {
		System.out.println("OutmaterialServiceImpl deleteOutmtrl()");
		materialDAO.deleteOutmtrl(outmtrlId);
	}

	@Override
	public void insertOutmtrl(OutmaterialDTO outmaterialDTO) {
		System.out.println("OutmaterialServiceImpl insertOutmtrl()");
		materialDAO.insertOutmtrl(outmaterialDTO);
	}

	@Override
	public InmaterialDTO getInmtrlList(int inmtrlId) {
		System.out.println("OutmaterialServiceImpl getInmtrlList()");
		return materialDAO.getInmtrlList(inmtrlId);
	}

	@Override
	public void updateInmtrl(InmaterialDTO inmaterialDTO) {
		System.out.println("OutmaterialServiceImpl updateInmtrl()");
		materialDAO.updateInmtrl(inmaterialDTO);
	}

	@Override
	public StockDTO getStockList(int stockId) {
		System.out.println("OutmaterialServiceImpl getStockList()");
		return materialDAO.getStockList(stockId);
	}

	@Override
	public void updateStock(StockDTO stockDTO, int stockId) {
		System.out.println("OutmaterialServiceImpl updateStock()");
		materialDAO.updateStock(stockDTO, stockId);
	}

	@Override
	public InmaterialDTO getInmtrl(int inmtrlId) {
		System.out.println("OutmaterialServiceImpl getInmtrl()");
		return materialDAO.getInmtrl(inmtrlId);
	}

	@Override
	public Map<String, Object> getInmtrlMap(int inmtrlId) {
		System.out.println("OutmaterialServiceImpl getInmtrlMap()");
		return materialDAO.getInmtrlMap(inmtrlId);
	}

	@Override
	public OutmaterialDTO getOutmtrl(int outmtrlId) {
		System.out.println("OutmaterialServiceImpl getOutmtrl()");
		return materialDAO.getOutmtrl(outmtrlId);
	}

	@Override
	public Map<String, Object> getOutmtrlMap(int outmtrlId) {
		System.out.println("OutmaterialServiceImpl getOutmtrlMap()");
		return materialDAO.getOutmtrlMap(outmtrlId);
	}

	@Override
	public void updateOutmtrl(OutmaterialDTO outmaterialDTO) {
		System.out.println("OutmaterialServiceImpl updateOutmtrl()");
		materialDAO.updateOutmtrl(outmaterialDTO);
	}





}