package com.itwillbs.order.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;


public interface OrderDAO {
	public List<Map<String, Object>> orderSearchMap(PageDTO pageDTO);
	
	public List<Map<String, Object>> orderSearchMap(Map<String,Object> search);
	
	public Integer countOrder(Map<String,Object> search);
	
}
