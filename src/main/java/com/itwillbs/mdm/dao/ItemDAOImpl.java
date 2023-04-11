package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ItemDTO;



@Repository
public class ItemDAOImpl implements ItemDAO{
	
	//마이바티스 멤버변수 선언 => 자동객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.itemMapper";

	@Override
	public List<ItemDTO> itemList() {
		
		return sqlSession.selectList(namespace + ".itemList");
	}

	@Override
	public void insertItem(ItemDTO itemDTO) {
		System.out.println("ItemDAOImpl insertitem()");
		
		sqlSession.insert(namespace+".insertItem", itemDTO);
	}

	@Override
	public List<Map<String, Object>> itemSearch(Map<String, Object> itemSearch, PageDTO pageDTO) {
		System.out.println("ItemDAOImpl itemSearch()");
		
		itemSearch.put("startRow", pageDTO.getStartRow());
		itemSearch.put("pageSize", pageDTO.getPageSize());
		
		return sqlSession.selectList(namespace+".SearchItemMap", itemSearch);
	}

	@Override
	public List<Map<String, Object>> itemList(PageDTO pageDTO) {
		System.out.println("ItemDAOImpl getItemMap()");
		return sqlSession.selectList(namespace + ".itemPage", pageDTO);
	}

	@Override
	public Integer itemCount() {
		System.out.println("ItemDAOImpl itemCount()");
		return sqlSession.selectOne(namespace+".itemCount");
	}

	@Override
	public Integer searchCount(Map<String, Object> itemSearch) {
		
		return sqlSession.selectOne(namespace+".searchCount", itemSearch);
	}

	@Override
	public void deleteItem(int itemId) {
		
		sqlSession.delete(namespace+".deleteItem",itemId);
	}

	@Override
	public Map<String, Object> getitemlist(int itemId) {
		return sqlSession.selectOne(namespace+".getitemlist", itemId);
	}

	@Override
	public void updateItem(ItemDTO itemDTO) {

		sqlSession.update(namespace+".updateItem", itemDTO);
	}


	
	

	

	
	

	
}
