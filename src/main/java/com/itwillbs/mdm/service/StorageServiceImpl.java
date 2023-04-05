package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.mdm.dao.ClientDAO;
import com.itwillbs.mdm.dao.ItemDAO;
import com.itwillbs.mdm.dao.StorageDAO;
import com.itwillbs.mdm.domain.ClientDTO;



@Service
public class StorageServiceImpl implements StorageService{
	
	@Inject
	private StorageDAO storageDAO;

	@Override
	public List<Map<String, Object>> getStorageMap() {
		System.out.println("StorageServiceImpl getStorageMap()");
		return storageDAO.getStorageMap();
	}

	

	
	
	
}
