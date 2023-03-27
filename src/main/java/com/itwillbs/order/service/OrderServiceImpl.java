package com.itwillbs.order.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.order.dao.OrderDAO;
import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;


@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDAO orderDAO;

	@Override
	public List<Map<String, Object>> getCheckMap() {
		System.out.println("OrderServiceImpl getCheckMap()");
		return orderDAO.getCheckMap();
	}

	




}
