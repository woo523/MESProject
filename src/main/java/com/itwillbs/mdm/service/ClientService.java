package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ClientDTO;




public interface ClientService {
	//추상메서드
//	public List<Map<String, Object>> getClientMap();
	
	public List<ClientDTO> clientList();
	
	public void insertClient(ClientDTO clientDTO);
	
	public List<Map<String, Object>> clientSearch(Map<String, Object> clinetSearch, PageDTO pageDTO, Model model);
	
	public List<Map<String, Object>> clientList(PageDTO pageDTO, Model model);
	
	public Integer clientCount();
	
	public Integer searchCount(Map<String, Object> clientSearch);
	
	public void deleteClient(int clntId);
	
	public Map<String, Object> getclientlist(int clntId);

	public void updateClient(ClientDTO clientDTO);
	
	public List<Map<String, Object>> clientlist();
}
