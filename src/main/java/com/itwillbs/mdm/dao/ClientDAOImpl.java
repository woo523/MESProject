package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.mdm.domain.ClientDTO;



@Repository
public class ClientDAOImpl implements ClientDAO{
	
	//마이바티스 멤버변수 선언 => 자동객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.clientMapper";

	@Override
	public List<Map<String, Object>> getClientMap() {
		
		return sqlSession.selectList(namespace+".getClientMap");
	}

	@Override
	public List<ClientDTO> clientList() {
		return sqlSession.selectList(namespace+".clientList");
	}


	
}
