package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.common.PageUtil;
import com.itwillbs.mdm.dao.ClientDAO;
import com.itwillbs.mdm.domain.ClientDTO;



@Service
public class ClientServiceImpl implements ClientService{
	
	@Inject
	private ClientDAO clientDAO;

//	@Override
//	public  List<Map<String, Object>> getClientMap() {
//		System.out.println("ClientServiceImpl getClientMap()");
//		return clientDAO.getClientMap();
//	}

	@Override
	public List<ClientDTO> clientList() {
		System.out.println("ClientServiceImpl clientList()");
		return clientDAO.clientList();
	}

	@Override
	public void insertClient(ClientDTO clientDTO) {
		clientDAO.insertClient(clientDTO);
	}

	@Override
	public List<Map<String, Object>> clientSearch(Map<String, Object> clientSearch, PageDTO pageDTO, Model model) {
		int count = clientDAO.searchCount(clientSearch);
		PageUtil.getPaging(pageDTO, model, count);
		return clientDAO.clientSearch(clientSearch, pageDTO);
	}

	@Override
	public List<Map<String, Object>> clientList(PageDTO pageDTO, Model model) {
		int count = clientDAO.clientCount();
		PageUtil.getPaging(pageDTO, model, count);
		return clientDAO.clientList(pageDTO);
	}

	@Override
	public Integer clientCount() {
		return clientDAO.clientCount();
	}

	@Override
	public Integer searchCount(Map<String, Object> clientSearch) {
		return clientDAO.searchCount(clientSearch);
	}

	@Override
	public void deleteClient(int clntId) {
		clientDAO.deleteClient(clntId);
	}

	@Override
	public Map<String, Object> getclientlist(int clntId) {
		return clientDAO.getclientlist(clntId);
	}

	@Override
	public void updateClient(ClientDTO clientDTO) {
		clientDAO.updateClient(clientDTO);
	}

	@Override
	public List<Map<String, Object>> clientlist() {
		return clientDAO.clientlist();
	}
	
	
	
	
}
