package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ClientDTO;


public interface ClientDAO {
//	public List<Map<String, Object>> getClientMap();
	
	public List<ClientDTO> clientList();
	
	public void insertClient(ClientDTO clientDTO);
	
	public List<Map<String, Object>> clientSearch(Map<String, Object> clientSearch, PageDTO pageDTO);

	public List<Map<String, Object>> clientList(PageDTO pageDTO);
	
	public Integer clientCount();
	
	public Integer searchCount(Map<String, Object> clientSearch);
	
	public void deleteClient(int clntId);

	public Map<String, Object> getclientlist(int clntId);
	
	public void updateClient(ClientDTO clientDTO);
	
	public List<Map<String, Object>> clientlist();
	
}
