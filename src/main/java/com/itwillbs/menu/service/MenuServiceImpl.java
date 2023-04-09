package com.itwillbs.menu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageUtil;
import com.itwillbs.menu.dao.MenuDAO;
import com.itwillbs.menu.domain.MenuDTO;

@Service
public class MenuServiceImpl implements MenuService{

	// 처리작업
	@Inject
	private MenuDAO menuDAO;
	
	// 멤버변수 값을 전달 생성자, set메서드 통해서 전달
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuDTO> getMenuList(MenuDTO menuDTO,Model model) {
		System.out.println("MenuServiceImpl menuList()");
//		int totalCnt = menuDAO.getMemberCount(); // 페이징할때 쓰려고 회원총개수 조회함.
//		
//		PageUtil.getPaging(memberDTO, model, totalCnt); // 페이징처리 함수불러온다.
//		
//		return memberDAO.getMemberList(memberDTO); // 회원리스트를 리턴
		return menuDAO.getMenuList(menuDTO, model);
	}

	@Override
	public int insertMenu(MenuDTO menuDTO) {
		System.out.println("MenuServiceImpl insertMenu()");
		
		return menuDAO.insertMenu(menuDTO);
	}

	@Override
	public int updateMenu(MenuDTO menuDTO) {
		System.out.println("MenuServiceImpl updateMenu()");
		
		return menuDAO.updateMenu(menuDTO);
	}

	@Override
	public int deleteMenu(MenuDTO menuDTO) {
		System.out.println("MenuServiceImpl deleteMenu()");
		
		return menuDAO.deleteMenu(menuDTO);
	}

}
