package com.itwillbs.menu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.itwillbs.menu.domain.MenuDTO;
@Repository
public class MenuDAOImpl implements MenuDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.menuMapper";
	
	// 메뉴리스트
	@Override
	public List<MenuDTO> getMenuList(MenuDTO menuDTO,Model model) {
		System.out.println("MenuDAOImpl getMenuList()");
		return sqlSession.selectList(namespace+ ".getMenuList");
	}

	// 메뉴등록
	@Override
	public int insertMenu(MenuDTO menuDTO) {
		System.out.println("MenuDAOImpl insertMenu()");
		return sqlSession.insert(namespace+ ".insertMenu",menuDTO);
	}
	
	// 메뉴수정
	@Override
	public int updateMenu(MenuDTO menuDTO) {
		System.out.println("MenuDAOImpl updateMenu()");
		return sqlSession.update(namespace+ ".updateMenu",menuDTO);
	}
	
	// 메뉴삭제
	@Override
	public int deleteMenu(MenuDTO menuDTO) {
		System.out.println("MenuDAOImpl deleteMenu()");
		return sqlSession.delete(namespace + ".deleteMenu", menuDTO);
	}

}
