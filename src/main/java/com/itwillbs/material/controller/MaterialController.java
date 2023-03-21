package com.itwillbs.material.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.itwillbs.material.service.InmaterialService;

@Controller
public class MaterialController {
	
	@Inject
	private InmaterialService inmaterialService;
}
