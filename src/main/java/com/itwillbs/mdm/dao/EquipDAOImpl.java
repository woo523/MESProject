package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.EquipDTO;





@Repository
public class EquipDAOImpl implements EquipDAO{
	
	//마이바티스 멤버변수 선언 => 자동객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.equipMapper";

//	@Override
//	public List<Map<String, Object>> getEquipMap() {
//		System.out.println("EquipDAOImpl getEquipMap()");
//		return sqlSession.selectList(namespace + ".getEquipMap");
//	}

	@Override
	public List<EquipDTO> equipList() {
		return sqlSession.selectList(namespace + ".equipList");
	}
	
	@Override
	public void insertEquip(EquipDTO equipDTO) {
		sqlSession.insert(namespace+".insertEquip", equipDTO);
	}

	@Override
	public List<Map<String, Object>> equipSearch(Map<String, Object> equipSearch, PageDTO pageDTO) {
		equipSearch.put("startRow", pageDTO.getStartRow());
		equipSearch.put("pageSize", pageDTO.getPageSize());
		
		return sqlSession.selectList(namespace+".SearchEquipMap", equipSearch);
	}

	@Override
	public List<Map<String, Object>> equipList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".equipPage", pageDTO);
	}

	@Override
	public Integer equipCount() {
		return sqlSession.selectOne(namespace+".equipCount");
	}

	@Override
	public Integer searchCount(Map<String, Object> equipSearch) {
		return sqlSession.selectOne(namespace+".searchCount", equipSearch);
	}

	@Override
	public void deleteEquip(int equpId) {
		sqlSession.delete(namespace+".deleteEquip",equpId);
	}

	@Override
	public Map<String, Object> getequiplist(int equpId) {
		return sqlSession.selectOne(namespace+".getequiplist", equpId);
	}

	@Override
	public void updateEquip(EquipDTO equipDTO) {
		sqlSession.update(namespace+".updateEquip", equipDTO);
	}



	
}
