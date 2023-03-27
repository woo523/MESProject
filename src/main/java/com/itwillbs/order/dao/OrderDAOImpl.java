package com.itwillbs.order.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;


@Repository
public class OrderDAOImpl implements OrderDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.itwillbs.mappers.orderMapper";

	@Override
	public List<OrderDTO> orderList() {
		System.out.println("OrderDAOImpl orderList()");
		return sqlSession.selectList(namespace+".orderList");
	}

	@Override
	public List<Map<String, Object>> orderSearch(Map<String, Object> orderSearch) {
		System.out.println("OrderDAOImpl orderSearch()");
		return sqlSession.selectList(namespace+".orderSearch", orderSearch);
	}


	



}
