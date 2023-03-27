package com.itwillbs.order.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;


public interface OrderDAO {

	public List<OrderDTO> orderList();
	
	public List<Map<String, Object>> orderSearch(Map<String, Object> orderSearch);
 
	
}
