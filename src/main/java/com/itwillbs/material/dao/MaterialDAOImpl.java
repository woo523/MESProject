package com.itwillbs.material.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.material.domain.ClientDTO;
import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.OutmaterialDTO;
import com.itwillbs.material.domain.PageDTO;
import com.itwillbs.material.domain.StockDTO;
import com.itwillbs.work.domain.ItemDTO;

@Repository
public class MaterialDAOImpl implements MaterialDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.materialMapper";
	
	@Override
	public List<Map<String, Object>> inmaterList() {
		System.out.println("InmaterialDAOImpl inmaterList()");
		
		return sqlSession.selectList(namespace + ".inmaterList");
	}


	@Override
	public List<Map<String, Object>> getInmaterLiMap(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl getInmaterLiMap()");
		
		return sqlSession.selectList(namespace + ".getSearchInmaterLiMap", search);
	}

	@Override
	public List<Map<String, Object>> getInmaterLiMap(PageDTO pageDTO) {
		System.out.println("InmaterialDAOImpl getInmaterLiMap()");
		
		return sqlSession.selectList(namespace+".getInmaterLiMap", pageDTO);
	}

	@Override
	public Integer countMtrlLi(Map<String, Object> search) {
		System.out.println("InmaterialDAOImpl countMtrlLi()");
		
		return sqlSession.selectOne(namespace+".countMtrlLi", search);
	}
	
	@Override
	public List<Map<String, Object>> outmaterList() {
		System.out.println("OutmaterialDAOImpl outmaterList()");
		
		return sqlSession.selectList(namespace + ".outmaterList");
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(Map<String, Object> search) {
		System.out.println("OutmaterialDAOImpl getOutmaterLiMap(서치용)");
	   
		return sqlSession.selectList(namespace+".getSearchOutmaterLiMap",search);
	}

	@Override
	public List<Map<String, Object>> getOutmaterLiMap(PageDTO pageDTO) {
		System.out.println("OutmaterialDAOImpl getOutmaterLiMap()");
		
		return sqlSession.selectList(namespace+".getOutmaterLiMap", pageDTO);
	}
	
	@Override
	public Integer countOutLi(Map<String, Object> search) {
		System.out.println("InmaterialDAOImpl countOutLi()");
		
		return sqlSession.selectOne(namespace+".countOutLi", search);
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String, Object> search) { // 품목리스트 들고오기 (품번, 품명)
		System.out.println("inmaterialDAOImpl getItemlist()");
		return sqlSession.selectList(namespace+".itemlist", search);
	}

	@Override
	public Integer countItemlist(Map<String, Object> search) { 
		System.out.println("intmaterialDAOImpl countItemlist()");
		return sqlSession.selectOne(namespace+".countItemlist", search);
	}

	@Override
	public List<ClientDTO> getClientlist(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl getClientlist()");
		return sqlSession.selectList(namespace+".clientlist", search);
	}

	@Override
	public Integer countClientlist(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl countClientlist()");
		return sqlSession.selectOne(namespace+".countClientlist", search);
	}


	@Override
	public List<Map<String, Object>> mtrlStateList(Map<String, Object> search) {
		System.out.println("intmaterialDAOImpl mtrlStateList(검색)");
		return sqlSession.selectList(namespace+".mtrlStateSearch", search);
	}


	@Override
	public List<Map<String, Object>> mtrlStateList(PageDTO pageDTO) {
		System.out.println("intmaterialDAOImpl mtrlStateList()");
		return sqlSession.selectList(namespace + ".mtrlStateList", pageDTO);
	}


	@Override
	public List<Map<String, Object>> materialState() {
		System.out.println("materialDAOImpl materialState()");
		
		return sqlSession.selectList(namespace + ".materialState");
	}


	@Override
	public Integer countStateLi(Map<String, Object> search) {
		System.out.println("materialDAOImpl countStateLi()");
		return sqlSession.selectOne(namespace+".countStateLi", search);
	}


//	@Override
//	public Map<String, Object> getInmtrlMap(int inmtrlId) {
//		System.out.println("materialDAOImpl getInmtrlMap()");
//		return sqlSession.selectOne(namespace+".getInmtrlMap",inmtrlId);
//	}


	@Override
	public void insertInmtrl(InmaterialDTO inmaterialDTO) {
		System.out.println("materialDAOImpl insertInmtrl()");
		sqlSession.insert(namespace+".insertInmtrl", inmaterialDTO);
	}


	@Override
	public void deleteInmtrl(int inmtrlId) {
		System.out.println("materialDAOImpl deleteInmtrl()");
		sqlSession.delete(namespace+".deleteInmtrl", inmtrlId);
	}


	@Override
	public void deleteOutmtrl(int outmtrlId) {
		System.out.println("materialDAOImpl deleteOutmtrl()");
		sqlSession.delete(namespace+".deleteOutmtrl", outmtrlId);
	}


	@Override
	public void insertOutmtrl(OutmaterialDTO outmaterialDTO) {
		System.out.println("materialDAOImpl insertOutmtrl()");
		sqlSession.insert(namespace+".insertOutmtrl", outmaterialDTO);
	}


	@Override
	public InmaterialDTO getInmtrlList(int inmtrlId) {
		System.out.println("materialDAOImpl getInmtrlList()");
		return sqlSession.selectOne(namespace+".getInmtrlList",inmtrlId);
	}


	@Override
	public void updateInmtrl(InmaterialDTO inmaterialDTO) {
		System.out.println("materialDAOImpl updateInmtrl()");
		
		sqlSession.update(namespace+".updateInmtrl", inmaterialDTO);
	}


	@Override
	public InmaterialDTO getInmtrl(int inmtrlId) {
		System.out.println("materialDAOImpl getInmtrl()");
		return sqlSession.selectOne(namespace+".getInmtrl", inmtrlId);
	}


	@Override
	public Map<String, Object> getInmtrlMap(int inmtrlId) {
		System.out.println("materialDAOImpl getInmtrlMap()");
		return sqlSession.selectOne(namespace+".getInmtrlMap", inmtrlId);
	}


	@Override
	public OutmaterialDTO getOutmtrl(int outmtrlId) {
		System.out.println("materialDAOImpl getOutmtrl()");
		return sqlSession.selectOne(namespace+".getOutmtrl", outmtrlId);
	}


	@Override
	public Map<String, Object> getOutmtrlMap(int outmtrlId) {
		System.out.println("materialDAOImpl getOutmtrlMap()");
		return sqlSession.selectOne(namespace+".getOutmtrlMap", outmtrlId);
	}


	@Override
	public void updateOutmtrl(OutmaterialDTO outmaterialDTO) {
		System.out.println("materialDAOImpl updateOutmtrl()");		
		sqlSession.update(namespace+".updateOutmtrl", outmaterialDTO);
	}


	@Override
	public StockDTO getStock(int stockId) {
		System.out.println("materialDAOImpl getStock()");
		return sqlSession.selectOne(namespace+".getStock", stockId);
	}


	@Override
	public void updateStock(StockDTO stockDTO) {
		System.out.println("materialDAOImpl updateStock()");		
		sqlSession.update(namespace+".updateStock", stockDTO);
	}
	
	@Override
	public Integer getinStock(int itemId) {
		System.out.println("materialDAOImpl getinStock()");
		return sqlSession.selectOne(namespace+".getinStock", itemId);
	}
	
	@Override
	public void updateinStock(InmaterialDTO inmaterialDTO) {
		System.out.println("materialDAOImpl updateinStock()");		
		sqlSession.update(namespace+".updateinStock", inmaterialDTO);
	}
	
	@Override
	public void updateinStorage(InmaterialDTO inmaterialDTO) {
		System.out.println("materialDAOImpl updateinStorage()");		
		sqlSession.update(namespace+".updateinStorage", inmaterialDTO);
	}


	@Override
	public void delinStock(InmaterialDTO inmaterialDTO) {
		System.out.println("materialDAOImpl delStock()");
		sqlSession.update(namespace+".delinStock", inmaterialDTO);
	}


	@Override
	public void delinStorage(InmaterialDTO inmaterialDTO) {
		System.out.println("materialDAOImpl delStorage()");
		sqlSession.update(namespace+".delinStorage", inmaterialDTO);
	}
	
	
	
	


}