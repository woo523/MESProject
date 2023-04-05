package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



@Repository
public class StorageDAOImpl implements StorageDAO{
	
	//마이바티스 멤버변수 선언 => 자동객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.storageMapper";

	@Override
	public List<Map<String, Object>> getStorageMap() {
		System.out.println("StorageDAOImpl getStorageMap()");
		return sqlSession.selectList(namespace + ".getStorageMap");
	}

	
	
	
}
