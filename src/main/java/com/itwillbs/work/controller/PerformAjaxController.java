package com.itwillbs.work.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.work.service.PerformService;



@RestController
public class PerformAjaxController {

	
	@Inject
	private PerformService performService;
	

	@RequestMapping(value = "/work/Pflist", method = RequestMethod.GET)
	public String pflist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("PerformAjaxController pflist()");
		String instrId = request.getParameter("instrId");
		JSONArray array = new JSONArray();
		List<Map<String, Object>> pflist = performService.getPfLiMap(instrId);
		
		for(int i=0;i<pflist.size();i++) {
			Map<String, Object> pfliDTO = pflist.get(i);
			JSONObject jsobject = new JSONObject();
			System.out.println("itemName : " + pfliDTO.get("itemName"));
			if(pfliDTO.get("dbReason")==null){
				jsobject.put("dbReason", "");
			}else {
				jsobject.put("dbReason", pfliDTO.get("dbReason"));
			}
			jsobject.put("itemNum", pfliDTO.get("itemNum"));
			jsobject.put("itemName", pfliDTO.get("itemName"));
			jsobject.put("performDate", pfliDTO.get("performDate"));
			jsobject.put("gbYn", pfliDTO.get("gbYn"));
			jsobject.put("performQty", pfliDTO.get("performQty"));
			
			System.out.println("dbReason : " + pfliDTO.get("dbReason"));
			
			array.put(jsobject);
		}
		System.out.println("array : "+ array);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(array);

		return null;
	}
	
}
