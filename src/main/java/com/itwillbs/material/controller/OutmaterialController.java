package com.itwillbs.material.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.material.service.OutmaterialService;

@Controller
public class OutmaterialController {

	@Inject
	private OutmaterialService outmaterialService;
	
	@RequestMapping(value = "/material/outmaterList", method = RequestMethod.GET)
	public String outmeterList(HttpServletRequest request, Model model) {
		System.out.println("MaterialController outmaterList()");

		String whouse = request.getParameter("whouse");
		String pcd = request.getParameter("pcd");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String ccd = request.getParameter("ccd");
		
System.out.println("whouse :"+whouse);
		
	if(whouse == null && pcd == null && sdate == null && edate == null && ccd == null){
			
		List<Map<String, Object>> outmaterList =  outmaterialService.getOutmaterLiMap();
		
		model.addAttribute("outmeterList", outmaterList);} // 전체 리스트	
	else{
		List<Map<String,Object>> outmaterList = outmaterialService.getOutmaterLiMap(whouse, pcd, sdate, edate, ccd);
		model.addAttribute("outmaterList", outmaterList); // 서치 결과 리스트	
	}
	return "material/outmaterList";
	}
}
