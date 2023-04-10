package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.StorageDTO;



public interface StorageDAO {
//	public List<Map<String, Object>> storageList();
	
	public List<StorageDTO> storageList();
	
	public void insertStorage(StorageDTO storageDTO);
	
	public List<Map<String, Object>> storageSearch(Map<String, Object> storageSearch, PageDTO pageDTO);

	public List<Map<String, Object>> storageList(PageDTO pageDTO);
	
	public Integer storageCount();
	
	public Integer searchCount(Map<String, Object> storageSearch);
	
	public void deleteStorage(int storId);

	public Map<String, Object> getstoragelist(int storId);
	
	public void updateStorage(StorageDTO storageDTO);
}
