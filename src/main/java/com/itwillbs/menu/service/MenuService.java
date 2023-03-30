package com.itwillbs.menu.service;

import java.util.List;

import org.springframework.ui.Model;

import com.itwillbs.menu.domain.MenuDTO;

public interface MenuService {
	
	public List<MenuDTO> getMenuList(MenuDTO menuDTO,Model model); // 메뉴리스트
	 
	public int insertMenu(MenuDTO menuDTO); // 메뉴등록
	
	public int updateMenu(MenuDTO menuDTO); // 메뉴수정
	
	public int deleteMenu(MenuDTO menuDTO); // 메뉴삭제
}
