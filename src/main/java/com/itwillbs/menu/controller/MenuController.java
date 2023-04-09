package com.itwillbs.menu.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.menu.domain.MenuDTO;
import com.itwillbs.menu.service.MenuService;

@Controller
public class MenuController {

	@Inject
	private MenuService menuService;
	// 목록화면 이동
	@RequestMapping(value = "/menu/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response, Model model, MenuDTO menuDTO) {
		System.out.println("MenuController list()");
		
		List<MenuDTO> menuList = menuService.getMenuList(menuDTO,model);
		
		model.addAttribute("menuList", menuList);
		
		return "menu/list";
	}
	// 등록화면 이동
		@RequestMapping(value = "/menu/create", method = RequestMethod.GET)
		public String create(HttpServletRequest request, HttpServletResponse response, Model model) {
			System.out.println("MenuController create()");
			
			return "menu/create";
		}
	
	// 등록처리
		@RequestMapping(value = "/menu/insert", method = RequestMethod.POST)
		public String insert(MenuDTO menuDTO) {
			System.out.println("create insert()");
			
			menuService.insertMenu(menuDTO);

			return "redirect:/menu/list";
		}	
	
	
	}

