package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.mdm.domain.ClientDTO;



public interface ClientService {
	//추상메서드
	public List<Map<String, Object>> getClientMap();
	
	public List<ClientDTO> clientList();
}
