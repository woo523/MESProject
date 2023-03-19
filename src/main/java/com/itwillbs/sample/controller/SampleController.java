package com.itwillbs.sample.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.member.service.MemberService;
import com.itwillbs.sample.domain.SampleDTO;
import com.itwillbs.sample.service.SampleService;


@Controller
public class SampleController {
	
	@Inject
	private SampleService sampleService;
	
	
	@RequestMapping(value = "/sample/list", method = RequestMethod.GET)
	public String index() {
		return "sample/list";
	}
	
	
	@RequestMapping(value = "/sample/searchList")
	@ResponseBody // List<SampleDTO>자바객체를 다시 HTTP 응답 바디로 변환해준다. 
	public List<SampleDTO> searchList(HttpServletRequest request, HttpServletResponse response, Model model, SampleDTO dto) {
		
		List<SampleDTO> searchList = sampleService.searchList();
		
		model.addAttribute("searchList", searchList);
		
		return searchList;
	}
	
	
}
