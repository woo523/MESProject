package com.itwillbs.ship.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	public String shipList(HttpServletRequest request,Model model) {
		return "ship/shipList";
	}
	
	@RequestMapping(value="/ship/shipAdmin", method = RequestMethod.GET)
	public String shAdmin(HttpServletRequest request,Model model) {
		System.out.println("ShipController shAdmin()");
		
		String shipNum = request.getParameter("shipNum");
		String insertId = request.getParameter("insertId");
		String barcord = request.getParameter("barcord");
		System.out.println("출하번호 :"+shipNum);
		System.out.println("등록자 :"+insertId);
		System.out.println("바코드 :"+barcord);
		
		if(shipNum == null && insertId ==null && barcord==null) {
			List<ShipDTO> shAdmin = shipService.shipList();
			model.addAttribute("shAdmin",shAdmin);
		}else {
			Map<String, Object> shipAdmin = new HashMap<String, Object>();
			shipAdmin.put("shipNum", shipNum);
			shipAdmin.put("insertId", insertId);
			shipAdmin.put("barcord", barcord);
			System.out.println(shipAdmin);
			
			List<Map<String, Object>> shAdmin = shipService.shipAdmin(shipAdmin);
			model.addAttribute("shAdmin", shAdmin);
		}
		return "ship/shipAdmin";
	}
	
	
	
}
