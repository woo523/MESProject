package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.StorageDTO;


public interface StorageService {
	//추상메서드
	public List<StorageDTO> storagelist();
	
	public void insertStorage(StorageDTO storageDTO);
	
	public List<Map<String, Object>> storageSearch(Map<String, Object> storageSearch, PageDTO pageDTO, Model model);

	public List<Map<String, Object>> storageList(PageDTO pageDTO, Model model);
	
	public Integer storageCount();
	
	public Integer searchCount(Map<String, Object> storageSearch);
	
	public void deleteStorage(int storId);

	public Map<String, Object> getstoragelist(int storId);
	
	public void updateStorage(StorageDTO storageDTO);
}
