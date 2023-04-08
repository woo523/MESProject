package com.itwillbs.auth.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.auth.domain.AuthDTO;
import com.itwillbs.auth.domain.MenuDTO;
import com.itwillbs.member.domain.MemberDTO;

@Repository
public class AuthDAOImpl implements AuthDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.authMapper";

	@Override
	public List<MenuDTO> getMenu() {
		System.out.println("AuthDAOImpl getMenu()");
		return sqlSession.selectList(namespace + ".getMenu");
	}
	
	@Override
	public void inauth(Map<String, Object> map) {
		System.out.println("AuthDAOImpl inauth()");
		
		sqlSession.selectList(namespace + ".inauth", map);
	}
	
	
	@Override
	public void updateauth(Map<String, Object> map) {
		System.out.println("AuthDAOImpl updateauth()");
		System.out.println("메뉴코드: " +map.get("menuCd"));
		
		sqlSession.selectList(namespace + ".updateauth", map);
	}
	
	@Override
	public void updatenonauth(Map<String, Object> map) {
		System.out.println("AuthDAOImpl updateauth()");
		System.out.println("메뉴코드: " +map.get("menuCd"));
		
		sqlSession.selectList(namespace + ".updatenonauth", map);
	}
	
	
	
	
	@Override
	public List<AuthDTO> getMenuauth(MemberDTO memberDTO) {
		System.out.println("AuthDAOImpl getMenuauth()");
		return sqlSession.selectList(namespace + ".getMenuauth", memberDTO);
	}
	
	
	@Override
	public List<AuthDTO> getauth(MemberDTO memberDTO) {
		System.out.println("AuthDAOImpl getauth()");
		return sqlSession.selectList(namespace + ".getauth", memberDTO);
	}
	
	
	

}
