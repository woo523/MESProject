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
public class InstructAjaxController {
	
	@Inject
	private PerformService performService;
	
	@RequestMapping(value = "/work/InstrStateList", method = RequestMethod.GET)
	public String instrStateList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("InstructAjaxController instrStateList");
		
		String instrId = request.getParameter("instrId");
		String workNum = request.getParameter("workNum");
		
		JSONArray arr = new JSONArray();
		
		// 지시번호에 해당하는 지시 현황 리스트
		List<Map<String, Object>> stateList = performService.getPfLiMap(instrId);
		
		if(stateList.size() == 0) {
			JSONObject object = new JSONObject();
			
			object.put("instrId", instrId);
			object.put("workNum", workNum);
			arr.put(object);
			
		} else {
			for(int i = 0; i < stateList.size(); i++) {
				Map<String, Object> stateDTO = stateList.get(i);
				JSONObject object = new JSONObject();
				
				// 제이슨 객체에 하나씩 담기
				object.put("performDate", stateDTO.get("performDate"));
				object.put("itemNum", 	  stateDTO.get("itemNum"));
				object.put("itemName", 	  stateDTO.get("itemName"));
				object.put("invntUnit",   stateDTO.get("invntUnit"));
				// 양품여부가 Y 또는 N일 경우
				if(stateDTO.get("gbYn").equals("Y")) {
					object.put("gbY", stateDTO.get("gbYn"));
					object.put("gbN", "-");
				} else {
					// gbYn == "N"
					object.put("gbY", "-");
					object.put("gbN", stateDTO.get("gbYn"));
				}
				// 불량사유가 null인 경우 공백 출력
				if(stateDTO.get("dbReason") == null) {
					object.put("dbReason", "-");
				} else {
					object.put("dbReason", stateDTO.get("dbReason"));
				}
				
				// 제이슨 배열에 객체 담기
				arr.put(object);
			}
		}
		// 한글 적용
		response.setContentType("application/x-json; charset=UTF-8");
		// 프린트
		response.getWriter().print(arr);
		
		return null;
	}

}
