package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.mdm.dao.ClientDAO;
import com.itwillbs.mdm.dao.ItemDAO;
import com.itwillbs.mdm.domain.ClientDTO;



@Service
public class ClientServiceImpl implements ClientService{
	
	@Inject
	private ClientDAO clientDAO;

	@Override
	public  List<Map<String, Object>> getClientMap() {
		System.out.println("ClientServiceImpl getClientMap()");
		return clientDAO.getClientMap();
	}

	@Override
	public List<ClientDTO> clientList() {
		System.out.println("ClientServiceImpl clientList()");
		return clientDAO.clientList();
	}


	
	
	
}
