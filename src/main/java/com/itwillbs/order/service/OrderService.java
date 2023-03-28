package com.itwillbs.order.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.domain.userDTO;
import com.itwillbs.work.domain.ItemDTO;

public interface OrderService {
	public List<Map<String, Object>> getOrderMap(PageDTO pageDTO);
	
	public List<Map<String, Object>> getOrderMap(Map<String,Object> search);
	
	public Integer countOrder(Map<String,Object> search);

	public List<ItemDTO> getItemList(Map<String, Object> search);

	public Integer countItemList(Map<String, Object> search);

	public List<userDTO> getUserList(Map<String, Object> search);

	public Integer countUserList(Map<String, Object> search);
	
}
