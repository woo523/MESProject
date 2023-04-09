package com.itwillbs.mdm.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.mdm.service.StorageService;

@Controller
public class StorageController {

	@Inject
	private StorageService storageService;
	
	@RequestMapping(value = "/mdm/storage", method = RequestMethod.GET)
	public String storageList(HttpServletRequest request, Model model) {
		System.out.println("StorageController storageList()");
		
		List<Map<String, Object>> storageList = storageService.getStorageMap();
		model.addAttribute("storageList", storageList);
		
		return "mdm/storage";
	
	}
}
