package com.itwillbs.material.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.PageDTO;
import com.itwillbs.material.service.InmaterialService;


@Controller
public class InmaterialController {
	
	@Inject
	private InmaterialService inmaterialService;
	
	@RequestMapping(value = "/material/inmaterList", method = RequestMethod.GET)
	public String inmeterList(HttpServletRequest request, Model model) {
		System.out.println("MaterialController inmaterList()");

		String whouse = request.getParameter("whouse");
		String pcd = request.getParameter("pcd");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String ccd = request.getParameter("ccd");
		
		System.out.println("whouse :"+whouse);
		
		if(whouse == null && pcd == null && sdate == null && edate == null && ccd == null){
			
			List<Map<String,Object>> inmaterList = inmaterialService.getInmaterLiMap();
		
			model.addAttribute("inmaterList", inmaterList);} // 전체 리스트
		else {
			List<Map<String,Object>> inmaterList = inmaterialService.getInmaterLiMap(whouse, pcd, sdate, edate, ccd);
			model.addAttribute("inmaterList", inmaterList); // 서치 결과 리스트
		}
		return "material/inmaterList";
	}
		
		
		
		
		
//		// 한 화면에 보여줄 글 개수 설정
//		int pageSize=10;
//		
//		// 현페이지 번호 가져오기
//		String pageNum=request.getParameter("pageNum");
//		if(pageNum == null) {
//			// pageNum 없으면 1페이지 설정
//			pageNum="1";
//		}
//		int currentPage=Integer.parseInt(pageNum);
//		
//		PageDTO pageDTO=new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		
//		List<InmaterialDTO> inmaterList=inmaterialService.getInmaterList(pageDTO);
//		
//		// 페이징
//		int count=inmaterialService.getInmaterCount();
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount) {
//			endPage = pageCount;
//		}
//		
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		
//		model.addAttribute("inmaterList", inmaterList); // 전체 리스트
//		model.addAttribute("pageDTO", pageDTO);
//		System.out.println(inmaterList);
		// 주소변경 없이 이동
		// /WEB-INF/views/board/list.jsp
//		return "material/inmaterList";
//	}
	
	@RequestMapping(value = "/material/itemList", method = RequestMethod.GET)
	public String itemList(Model model) {
				
//		model.addAttribute("itemList", itemList);
		return "material/itemList";
	}
	
	@RequestMapping(value = "/material/clntList", method = RequestMethod.GET)
	public String clntList(Model model) {
				
//		model.addAttribute("itemList", itemList);
		return "material/clntList";
	}
}
