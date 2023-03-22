package com.itwillbs.ship.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.ship.domain.ShipDTO;
import com.itwillbs.ship.service.ShipService;

@Controller
public class ShipController {
	
	@Inject
	private ShipService shipService;
	
	@RequestMapping(value="/ship/shipList", method = RequestMethod.GET)
	public String insert() {
		return "ship/shipList";
	}
	
	@RequestMapping(value="/ship/shipList")
	@ResponseBody
	public List<ShipDTO> shipList(Model model) {
		
		List<ShipDTO> shipList = shipService.shipList();
		model.addAttribute("shipList",shipList);
		
		return shipList;
	}
	
}
