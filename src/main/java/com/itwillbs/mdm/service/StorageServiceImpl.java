package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.common.PageUtil;
import com.itwillbs.mdm.dao.StorageDAO;
import com.itwillbs.mdm.domain.StorageDTO;




@Service
public class StorageServiceImpl implements StorageService{
	
	@Inject
	private StorageDAO storageDAO;

	@Override
	public List<StorageDTO> storagelist() {
		System.out.println("StorageServiceImpl storageList()");
		return storageDAO.storageList();
	}

	@Override
	public void insertStorage(StorageDTO storageDTO) {
		storageDAO.insertStorage(storageDTO);
	}

	@Override
	public List<Map<String, Object>> storageSearch(Map<String, Object> storageSearch, PageDTO pageDTO, Model model) {
		int count = storageDAO.searchCount(storageSearch);
		PageUtil.getPaging(pageDTO, model, count);
		return storageDAO.storageSearch(storageSearch, pageDTO);
	}

	@Override
	public List<Map<String, Object>> storageList(PageDTO pageDTO, Model model) {
		int count = storageDAO.storageCount();
		PageUtil.getPaging(pageDTO, model, count);
		return storageDAO.storageList(pageDTO);
	}

	@Override
	public Integer storageCount() {
		return storageDAO.storageCount();
	}

	@Override
	public Integer searchCount(Map<String, Object> storageSearch) {
		return storageDAO.searchCount(storageSearch);
	}

	@Override
	public void deleteStorage(int storId) {
		storageDAO.deleteStorage(storId);
	}

	@Override
	public Map<String, Object> getstoragelist(int storId) {
		return storageDAO.getstoragelist(storId);
	}

	@Override
	public void updateStorage(StorageDTO storageDTO) {
		storageDAO.updateStorage(storageDTO);
	}

	

	
	
	
}
