package com.itwillbs.order.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.order.domain.ItemDTO;
import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.domain.clntDTO;
import com.itwillbs.order.domain.userDTO;


public interface OrderDAO {
	public List<Map<String, Object>> getOrderMap(PageDTO pageDTO);
	
	public List<Map<String, Object>> getSearchOrderMap(Map<String,Object> search);
	
	public Integer countOrder(Map<String,Object> search);
	
	public List<ItemDTO> getItemList(Map<String, Object> search);

	public Integer countItemList(Map<String, Object> search);

	public List<userDTO> getUserList(Map<String, Object> search);

	public Integer countUserList(Map<String, Object> search);

	public List<clntDTO> getClntList(Map<String, Object> search);

	public Integer countClntList(Map<String, Object> search);

	public void insertOrder(OrderDTO orderDTO);

	public OrderDTO getOrder(int ordId);

	public void updateOrder(OrderDTO orderDTO);


	
}
