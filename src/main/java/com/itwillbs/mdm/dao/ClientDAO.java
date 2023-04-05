package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.mdm.domain.ClientDTO;





public interface ClientDAO {
	public List<Map<String, Object>> getClientMap();
	
	public List<ClientDTO> clientList();
	
}
