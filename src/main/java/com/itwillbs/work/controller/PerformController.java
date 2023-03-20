package com.itwillbs.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.work.domain.PerformDTO;
import com.itwillbs.work.service.PerformService;



public class PerformController {
	
	
	private PerformService performService;
	
	@RequestMapping(value = "/performList.json", method = RequestMethod.POST)
	public String performList() {
		
		List<PerformDTO> performlist = performService.performList();
		
		
		
		
		
		return null;
	}
}
