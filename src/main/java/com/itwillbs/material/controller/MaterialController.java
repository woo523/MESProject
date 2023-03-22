package com.itwillbs.material.controller;

import java.util.List;

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
public class MaterialController {
	
	@Inject
	private InmaterialService inmaterialService;
	
	@RequestMapping(value = "/material/inmaterList", method = RequestMethod.GET)
	public String inmeterList(HttpServletRequest request, Model model) {
		System.out.println("MaterialController inmaterList()");

		// 한 화면에 보여줄 글 개수 설정
		int pageSize=10;
		
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum == null) {
			// pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<InmaterialDTO> inmaterList=inmaterialService.getInmaterList(pageDTO);
		
		// 페이징
		int count=inmaterialService.getInmaterCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("inmaterList", inmaterList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 주소변경 없이 이동
		// /WEB-INF/views/board/list.jsp
		return "material/inmaterList";
	}
}
