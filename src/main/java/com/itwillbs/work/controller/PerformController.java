package com.itwillbs.work.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value = "/InstruList", method = RequestMethod.GET)
	@ResponseBody
	public String InstruList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PerformController InstruList");
		
		JSONArray array = new JSONArray();
		
		List<InstruListDTO> instrulist = performService.InstruList();
		System.out.println(instrulist.size());
		for(int i =0;i<instrulist.size();i++) {	
			
			InstruListDTO instrulistDTO = instrulist.get(i);
			
			System.out.println(instrulistDTO.getInstrId());
			System.out.println(instrulistDTO.getClientName());
			System.out.println("???");
			JSONObject jsobject = new JSONObject();
			jsobject.put("instrId", instrulistDTO.getInstrId());
			jsobject.put("lineCd", instrulistDTO.getLineCd());
			jsobject.put("lineName", instrulistDTO.getLineName());
			jsobject.put("itemNum", instrulistDTO.getItemNum());
			jsobject.put("itemName", instrulistDTO.getItemName());
			jsobject.put("workSts", instrulistDTO.getWorkSts());
			jsobject.put("workDate", instrulistDTO.getWorkDate());
			jsobject.put("workQty", instrulistDTO.getWorkQty());
			jsobject.put("ordNum", instrulistDTO.getOrdNum());
			jsobject.put("ClientName", instrulistDTO.getClientName());
		
			array.put(jsobject);
		}

			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(array);


		return null;
	}
	
	
	@RequestMapping(value = "/work/performRegist", method = RequestMethod.GET)
	public String performRegist() {

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
	

}
