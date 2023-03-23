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
		String instrId = request.getParameter("instrId"); // 지시번호 들고 오기
		
		JSONArray array = new JSONArray(); // Json 배열
		List<Map<String, Object>> pflist = performService.getPfLiMap(instrId); // 지시번호 해당되는 실적리스트
		
		if(pflist.size()==0) {
			JSONObject jsobject = new JSONObject();
			
			jsobject.put("instrId", instrId);
			array.put(jsobject);
		}
		else {
		for(int i=0;i<pflist.size();i++) {
			Map<String, Object> pfliDTO = pflist.get(i);
			JSONObject jsobject = new JSONObject(); // 제이슨 객체
			System.out.println("itemName : " + pfliDTO.get("itemName"));
			if(pfliDTO.get("dbReason")==null){ // 불량사유가 null이면 공백 출력되게
				jsobject.put("dbReason", "");
			}else {
				jsobject.put("dbReason", pfliDTO.get("dbReason"));
			}
			jsobject.put("itemNum", pfliDTO.get("itemNum"));
			jsobject.put("itemName", pfliDTO.get("itemName"));
			jsobject.put("performDate", pfliDTO.get("performDate"));
			jsobject.put("gbYn", pfliDTO.get("gbYn"));
			jsobject.put("performQty", pfliDTO.get("performQty"));
			jsobject.put("performId", pfliDTO.get("performId"));
			jsobject.put("instrId", pfliDTO.get("instrId"));
			// 제이슨객체에 한개씩 담기
			System.out.println("dbReason : " + pfliDTO.get("dbReason"));
			
			array.put(jsobject); // 제이슨 배열에 객체 담기
		}
		}
		System.out.println("array : "+ array);
		response.setContentType("application/x-json; charset=UTF-8"); // 한글 안깨지게
		response.getWriter().print(array); // 프린트하기

		return null;
	}
	
}
