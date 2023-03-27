package com.itwillbs.order.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;

public interface OrderService {
	public List<Map<String, Object>> orderSearchMap(PageDTO pageDTO);
	
	public List<Map<String, Object>> orderSearchMap(Map<String,Object> search);
	
	public Integer countOrder(Map<String,Object> search);
	
}
