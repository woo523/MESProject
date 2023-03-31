package com.itwillbs.order.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.domain.clntDTO;
import com.itwillbs.order.domain.userDTO;
import com.itwillbs.work.domain.ItemDTO;


@Repository
public class OrderDAOImpl implements OrderDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.itwillbs.mappers.orderMapper";

	@Override
	public List<Map<String, Object>> getOrderMap(PageDTO pageDTO) { // ��泥� 議고��
		System.out.println("OrderDAOImpl getOrderMap()");
		
		return sqlSession.selectList(namespace+".getOrderMap", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getOrderMap(Map<String, Object> search) { // 寃��� 議고��
		System.out.println("OrderDAOImpl getOrderMap(寃���)"); 

	    return sqlSession.selectList(namespace+".getSearchOrderMap",search);
	}

	@Override
	public Integer countOrder(Map<String, Object> search) {
		System.out.println("OrderDAOImpl countOrder()"); 
		return sqlSession.selectOne(namespace+".countOrder",search);
	}

	@Override
	public List<ItemDTO> getItemList(Map<String, Object> search) {
		System.out.println("OrderDAOImpl getItemList()");
		
		return sqlSession.selectList(namespace+".getItemList", search);
	}

	@Override
	public Integer countItemList(Map<String, Object> search) {
		System.out.println("OrderDAOImpl countItemList()");
		return sqlSession.selectOne(namespace+".countItemList", search);
	}

	@Override
	public List<userDTO> getUserList(Map<String, Object> search) {
		System.out.println("OrderDAOImpl getUserList()");
		return sqlSession.selectList(namespace+".getUserList", search);
	}

	@Override
	public Integer countUserList(Map<String, Object> search) {
		System.out.println("OrderDAOImpl countUserList()");
		return sqlSession.selectOne(namespace+".countUserList", search);
	}

	@Override
	public List<clntDTO> getClntList(Map<String, Object> search) {
		System.out.println("OrderDAOImpl getClntList()");
		return sqlSession.selectList(namespace+".getClntList", search);
	}

	@Override
	public Integer countClntList(Map<String, Object> search) {
		System.out.println("OrderDAOImpl countClntList()");
		return sqlSession.selectOne(namespace+".countClntList", search);
	}

	@Override
	public void insertOrder(OrderDTO orderDTO) {
		System.out.println("OrderDAOImpl insertOrder() 화면단 정보를 db에 저장");
		sqlSession.selectList(namespace+".insertOrder", orderDTO);
	}





}
