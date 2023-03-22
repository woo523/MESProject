package com.itwillbs.line.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.line.service.LineService;
import com.itwillbs.work.domain.InstructDTO;

@Controller
public class LineController {
	
	@Inject
	private LineService lineService;
	
	@RequestMapping(value = "/line/line", method = RequestMethod.GET)
	public String lineList(Model model) {
		
		List<LineDTO> lineList = lineService.lineList();
		model.addAttribute("lineList", lineList);

		return "line/line";
	}

}
