package com.itwillbs.auth.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.auth.domain.AuthDTO;
import com.itwillbs.auth.domain.MenuDTO;
import com.itwillbs.member.domain.MemberDTO;

public interface AuthDAO {

	public List<MenuDTO> getMenu();
	
	public void inauth(Map<String, Object> map);
	
	public void updateauth(Map<String, Object> map);
	
	public List<AuthDTO> getMenuauth(MemberDTO memberDTO);
	
	public List<AuthDTO> getauth(MemberDTO memberDTO);
	
	public void updatenonauth(Map<String, Object> map);
	
	public void delauth(MemberDTO memberDTO);
	
}
