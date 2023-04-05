package com.itwillbs.mdm.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.mdm.service.ClientService;

@Controller
public class ClientController {

	@Inject
	private ClientService clientService;
	
	@RequestMapping(value = "/mdm/client", method = RequestMethod.GET)
	public String clientList(HttpServletRequest request, Model model) {
		System.out.println("ClientController clientList()");
		
		List<Map<String, Object>> clientList = clientService.getClientMap();
		model.addAttribute("clientList", clientList);
		
		return "mdm/client";
	
	}
}
