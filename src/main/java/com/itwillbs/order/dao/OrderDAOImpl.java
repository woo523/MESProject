package com.itwillbs.order.dao;

import java.util.List;

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
	



}
