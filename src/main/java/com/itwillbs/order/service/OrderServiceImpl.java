package com.itwillbs.order.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.order.dao.OrderDAO;
import com.itwillbs.order.domain.ItemDTO;
import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.domain.clntDTO;
import com.itwillbs.order.domain.userDTO;


@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDAO orderDAO;

	@Override
	public List<Map<String, Object>> getOrderMap(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl getOrderMap()");
		return orderDAO.getOrderMap(pageDTO);
	}

	@Override
	public List<Map<String, Object>> getSearchOrderMap(Map<String, Object> search) {
		System.out.println("OrderServiceImpl getSearchOrderMap()");
		return orderDAO.getSearchOrderMap(search);
	}

	@Override
	public Integer countOrder(Map<String, Object> search) {
		System.out.println("OrderServiceImpl countOrder()");
		return orderDAO.countOrder(search);
	}

	@Override
	public List<ItemDTO> getItemList(Map<String, Object> search) {
		System.out.println("OrderServiceImpl getItemList()");
		return orderDAO.getItemList(search);
	}

	@Override
	public Integer countItemList(Map<String, Object> search) {
		System.out.println("OrderServiceImpl countItemList()");
		return orderDAO.countItemList(search);
	}

	@Override
	public List<userDTO> getUserList(Map<String, Object> search) {
		System.out.println("OrderServiceImpl getUserList()");
		return orderDAO.getUserList(search);
	}

	@Override
	public Integer countUserList(Map<String, Object> search) {
		System.out.println("OrderServiceImpl countUserList()");
		return orderDAO.countUserList(search);
	}

	@Override
	public List<clntDTO> getClntList(Map<String, Object> search) {
		System.out.println("OrderServiceImpl getClntList()");
		return orderDAO.getClntList(search);
	}

	@Override
	public Integer countClntList(Map<String, Object> search) {
		System.out.println("OrderServiceImpl countClntList()");
		return orderDAO.countClntList(search);
	}

	@Override
	public void insertOrder(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl 메서드틀 정의 구현()");
		orderDAO.insertOrder(orderDTO);
	}

	@Override
	public OrderDTO getBoard(int ordId) {
		System.out.println("OrderServiceImpl getBoard()");
		return orderDAO.getBoard(ordId);
	}










}
