package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.StorageDTO;



@Repository
public class StorageDAOImpl implements StorageDAO{
	
	//마이바티스 멤버변수 선언 => 자동객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.storageMapper";

	@Override
	public List<StorageDTO> storageList() {
		return sqlSession.selectList(namespace + ".storageList");
	}

	@Override
	public void insertStorage(StorageDTO storageDTO) {
		sqlSession.insert(namespace+".insertStorage", storageDTO);		
	}

	@Override
	public List<Map<String, Object>> storageSearch(Map<String, Object> storageSearch, PageDTO pageDTO) {
		storageSearch.put("startRow", pageDTO.getStartRow());
		storageSearch.put("pageSize", pageDTO.getPageSize());
		
		return sqlSession.selectList(namespace+".SearchStorageMap", storageSearch);
	}

	@Override
	public List<Map<String, Object>> storageList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".storagePage", pageDTO);
	}

	@Override
	public Integer storageCount() {
		return sqlSession.selectOne(namespace+".storageCount");
	}

	@Override
	public Integer searchCount(Map<String, Object> storageSearch) {
		return sqlSession.selectOne(namespace+".searchCount", storageSearch);
	}

	@Override
	public void deleteStorage(int storId) {
		sqlSession.delete(namespace+".deleteStorage",storId);
	}

	@Override
	public Map<String, Object> getstoragelist(int storId) {
		return sqlSession.selectOne(namespace+".getstoragelist", storId);
	}

	@Override
	public void updateStorage(StorageDTO storageDTO) {
		sqlSession.update(namespace+".updateStorage", storageDTO);
	}

	
	
	
}
