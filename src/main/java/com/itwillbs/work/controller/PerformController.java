package com.itwillbs.work.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONObject;
import org.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.itwillbs.work.domain.InstruListDTO;
import com.itwillbs.work.domain.PerformRgDTO;
import com.itwillbs.work.service.PerformService;





@Controller
public class PerformController {
	
	@Inject
	private PerformService performService;
	

	@RequestMapping(value = "/work/performRegist", method = RequestMethod.GET)
	public String performRegist(Model model, HttpServletRequest request) {
		request.getAttribute("line");
		
		
		List<Map<String,Object>> instrList = performService.getInstrLiMap();
		
		model.addAttribute("instrList", instrList);
		
		return "work/performRegist";
	}
	

	
	@RequestMapping(value = "/PerformRg", method = RequestMethod.GET)
	@ResponseBody
	public String PerformRg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PerformController PerformRg");
		
		int instrId = Integer.parseInt(request.getParameter("instrId"));
		
		System.out.println(instrId);
		JSONArray array = new JSONArray();
		
		List<PerformRgDTO> PerformRglist = performService.PerformRgList(instrId);
		
		for(int i =0;i<PerformRglist.size();i++) {	
			
			PerformRgDTO performRgDTO = PerformRglist.get(i);

			System.out.println("???");
			JSONObject jsobject = new JSONObject();
			jsobject.put("itemNum", performRgDTO.getItemNum());
			jsobject.put("itemName", performRgDTO.getItemName());
			jsobject.put("performDate", performRgDTO.getPerformDate());
			jsobject.put("gbYn", performRgDTO.getGbYn());
			jsobject.put("performQty", performRgDTO.getPerformQty());
			jsobject.put("dbReason", performRgDTO.getDbReason());
			

			
			array.put(jsobject);
		}

			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(array);


		return null;
	}
	
	@RequestMapping(value = "/pefSave", method = RequestMethod.GET)
	public String pefSave(HttpServletRequest request, Map<String, Object> row) {

		System.out.println("PerformController pefSave");
		
		String a = request.getParameter("gbYn");
		String b = request.getParameter("performQty");
		String c = request.getParameter("dbReason");
		
		row.put("gb_yn", a);
		row.put("prfrm_qty", b);
		row.put("db_rsns", c);
        
        
		performService.insertPerform(row);
		
		return "redirect:/work/performRegist";

	}
	
	
}


