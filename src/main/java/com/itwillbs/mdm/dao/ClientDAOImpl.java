package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ClientDTO;



@Repository
public class ClientDAOImpl implements ClientDAO{
	
	//마이바티스 멤버변수 선언 => 자동객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.clientMapper";

//	@Override
//	public List<Map<String, Object>> getClientMap() {
//		
//		return sqlSession.selectList(namespace+".getClientMap");
//	}

	@Override
	public List<ClientDTO> clientList() {
		return sqlSession.selectList(namespace+".clientList");
	}

	@Override
	public void insertClient(ClientDTO clientDTO) {
		sqlSession.insert(namespace+".insertClient", clientDTO);
	}

	@Override
	public List<Map<String, Object>> clientSearch(Map<String, Object> clientSearch, PageDTO pageDTO) {
		clientSearch.put("startRow", pageDTO.getStartRow());
		clientSearch.put("pageSize", pageDTO.getPageSize());
		
		return sqlSession.selectList(namespace+".SearchClientMap", clientSearch);
	}

	@Override
	public List<Map<String, Object>> clientList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".clientPage", pageDTO);
	}

	@Override
	public Integer clientCount() {
		return sqlSession.selectOne(namespace+".clientCount");
	}

	@Override
	public Integer searchCount(Map<String, Object> clientSearch) {
		return sqlSession.selectOne(namespace+".searchCount", clientSearch);
	}

	@Override
	public void deleteClient(int clntId) {
		sqlSession.delete(namespace+".deleteClient",clntId);
	}

	@Override
	public Map<String, Object> getclientlist(int clntId) {
		return sqlSession.selectOne(namespace+".getclientlist", clntId);
	}

	@Override
	public void updateClient(ClientDTO clientDTO) {
		sqlSession.update(namespace+".updateClient", clientDTO);
	}


	
	
}
