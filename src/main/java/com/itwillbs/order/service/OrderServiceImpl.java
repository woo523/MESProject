package com.itwillbs.order.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.order.dao.OrderDAO;
import com.itwillbs.order.domain.PageDTO;


@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDAO orderDAO;

	@Override
	public List<Map<String, Object>> orderSearchMap(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl orderSearchMap()");
		return orderDAO.orderSearchMap(pageDTO);
	}

	@Override
	public List<Map<String, Object>> orderSearchMap(Map<String, Object> search) {
		System.out.println("OrderServiceImpl orderSearchMap(검색)");
		return orderDAO.orderSearchMap(search);
	}

	@Override
	public Integer countOrder(Map<String, Object> search) {
		System.out.println("OrderServiceImpl countOrder()");
		return orderDAO.countOrder(search);
	}









}
