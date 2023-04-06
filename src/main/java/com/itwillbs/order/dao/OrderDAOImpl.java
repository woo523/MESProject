package com.itwillbs.order.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.order.domain.ItemDTO;
import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.domain.clntDTO;
import com.itwillbs.order.domain.userDTO;


@Repository
public class OrderDAOImpl implements OrderDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.itwillbs.mappers.orderMapper";

	@Override
	public List<Map<String, Object>> getOrderMap(PageDTO pageDTO) { 
		System.out.println("OrderDAOImpl getOrderMap()");
		return sqlSession.selectList(namespace+".getOrderMap", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getSearchOrderMap(Map<String, Object> search) { 
		System.out.println("OrderDAOImpl getSearchOrderMap()"); 
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
		sqlSession.insert(namespace+".insertOrder", orderDTO);
	}

	@Override
	public OrderDTO getOrder(int ordId) { // 주문 아이디 가져오기
		System.out.println("OrderDAOImpl getOrder() ");
		return sqlSession.selectOne(namespace+".getOrder", ordId);
	}

	@Override
	public void updateOrder(OrderDTO orderDTO) {
		System.out.println("OrderDAOImpl updateOrder() 화면단 정보를 db에 저장");
		sqlSession.update(namespace+".updateOrder", orderDTO);
		
	}

	@Override
	public void getDelete(int ordId) {
		System.out.println("OrderDAOImpl getDelete() 화면단 정보를 db에 저장");
		sqlSession.delete(namespace+".getDelete", ordId);
		
	}

	@Override
	public Integer orderSCount() {
		System.out.println("OrderDAOImpl orderSCount() 화면단 정보를 db에 저장");
		return sqlSession.selectOne(namespace+".orderSCount");
	}

	@Override
	public List<Map<String, Object>> getStsOrderMap(Map<String, Object> search) {
		System.out.println("OrderDAOImpl getStsOrderMap()"); 
	    return sqlSession.selectList(namespace+".getStsOrderMap",search);
	}

	@Override
	public List<Map<String, Object>> getStsMap(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getStsMap()");
		return sqlSession.selectList(namespace+".getStsMap", pageDTO);
	}

	@Override
	public Integer countStsOrder(Map<String, Object> search) {
		System.out.println("OrderDAOImpl countStsOrder()"); 
		return sqlSession.selectOne(namespace+".countStsOrder",search);
	}





}
