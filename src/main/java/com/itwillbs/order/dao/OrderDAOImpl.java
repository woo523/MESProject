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
	public List<Map<String, Object>> orderSearchMap(PageDTO pageDTO) { // 전체 조회
		System.out.println("OrderDAOImpl orderMap()");
		
		return sqlSession.selectList(namespace+".orderMap", pageDTO);
	}

	@Override
	public List<Map<String, Object>> orderSearchMap(Map<String, Object> search) { // 검색 조회
		System.out.println("OrderDAOImpl orderSearchMap(검색)"); 

	    return sqlSession.selectList(namespace+".orderSearchMap",search);
	}

	@Override
	public Integer countOrder(Map<String, Object> search) {
		System.out.println("OrderDAOImpl countOrder()"); 
		return sqlSession.selectOne(namespace+".countOrder",search);
	}
	



}
