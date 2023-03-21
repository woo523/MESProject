package com.itwillbs.material.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.service.InmaterialService;


@Controller
public class MaterialController {
	
	@Inject
	private InmaterialService inmaterialService;
	
	@RequestMapping(value = "/material/inmaterList", method = RequestMethod.GET)
	public String index() {
		return "material/inmaterList";
	}
	
	@RequestMapping(value = "/material/inmaterList")
	@ResponseBody
	public List<InmaterialDTO> inmeterList(Model model) {
		
		List<InmaterialDTO> inmaterList = inmaterialService.inmaterList();
		model.addAttribute("inmaterList", inmaterList);

		return inmaterList;
	}
}
