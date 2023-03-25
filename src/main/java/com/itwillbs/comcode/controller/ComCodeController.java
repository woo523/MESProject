package com.itwillbs.comcode.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.itwillbs.comcode.service.ComCodeService;


@Controller
public class ComCodeController {

	@Inject
	private ComCodeService comCodeService; // 4버전.자동으로 객체생성 한 것.
}
