package com.itwillbs.order.service;

import java.sql.Timestamp;
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
		orderDTO.setInsertDt(new Timestamp(System.currentTimeMillis()));
		orderDAO.insertOrder(orderDTO);
	}

	@Override
	public OrderDTO getOrder(int ordId) {
		System.out.println("OrderServiceImpl getOrder()");
		return orderDAO.getOrder(ordId);
	}

	@Override
	public void updateOrder(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl updateOrder()");
		orderDTO.setUpdateDt(new Timestamp(System.currentTimeMillis()));
		orderDAO.updateOrder(orderDTO);
	}

	@Override
	public void deleteOrder(int ordId) {
		System.out.println("OrderServiceImpl deleteOrder()");
		orderDAO.deleteOrder(ordId);
		
	}

	@Override
	public Integer orderSCount() {
		System.out.println("OrderServiceImpl orderSCount()");
		return orderDAO.orderSCount();
	}

	@Override
	public List<Map<String, Object>> getStsOrderMap(Map<String, Object> search) {
		System.out.println("OrderServiceImpl getStsOrderMap()");
		return orderDAO.getStsOrderMap(search);
	}

	@Override
	public List<Map<String, Object>> getStsMap(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl getStsMap()");
		return orderDAO.getStsMap(pageDTO);
	}

	@Override
	public Integer countStsOrder(Map<String, Object> search) {
		System.out.println("OrderServiceImpl countStsOrder()");
		return orderDAO.countStsOrder(search);
	}

	@Override
	public void updateCmplt(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl updateCmplt()");
		orderDAO.updateCmplt(orderDTO);
		
	}

	@Override
	public void deleteCmplt(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl deleteCmplt()");
		orderDAO.deleteCmplt(orderDTO);
		
	}







}
