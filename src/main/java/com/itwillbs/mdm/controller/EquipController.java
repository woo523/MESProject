package com.itwillbs.mdm.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.mdm.service.EquipService;


@Controller
public class EquipController {

	@Inject
	private EquipService equipService;
	
	@RequestMapping(value = "/mdm/equip", method = RequestMethod.GET)
	public String equipList(HttpServletRequest request, Model model) {
		System.out.println("EquipController equipList()");
		
		List<Map<String,Object>> equipList = equipService.getEquipMap();
		model.addAttribute("equipList", equipList);
		
		return "mdm/equip";
	
	}
}
