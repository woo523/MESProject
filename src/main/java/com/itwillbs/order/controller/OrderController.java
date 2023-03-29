package com.itwillbs.order.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.order.domain.OrderDTO;
import com.itwillbs.order.domain.PageDTO;
import com.itwillbs.order.domain.clntDTO;
import com.itwillbs.order.domain.userDTO;
import com.itwillbs.order.service.OrderService;
import com.itwillbs.work.domain.ItemDTO;


@Controller
public class OrderController {
	
	@Inject
	private OrderService orderService;

	@RequestMapping(value = "/order/management", method = RequestMethod.GET)
	public String management(Model model, HttpServletRequest request, PageDTO pageDTO) {

			String clntCd = request.getParameter("clntCd");
			String sOdate = request.getParameter("sOdate");
			String eOdate = request.getParameter("eOdate");
			String name = request.getParameter("name");
			String sDdate = request.getParameter("sDdate");
			String eDdate = request.getParameter("eDdate"); 	
			
			// �븳 �솕硫댁뿉 蹂댁뿬以� 湲� 媛쒖닔 �꽕�젙
			int pageSize = 3; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
			
			// �쁽�럹�씠吏� 踰덊샇 媛��졇�삤湲�
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			// �럹�씠吏�踰덊샇瑜� �젙�닔�삎 蹂�寃�
			int currentPage=Integer.parseInt(pageNum);
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
			int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow-1); // limit startRow (0�씠 1�뿴�씠湲� �븣臾� 1�쓣 類�)
			pageDTO.setEndRow(endRow);

			Map<String,Object> search = new HashMap<>(); // sql�뿉 �뱾�뼱媛��빞�븷 �꽌移� �빆紐� 諛� pageDTO �빆紐� map�뿉 �떞湲�
			search.put("clntCd", clntCd);
			search.put("sOdate", sOdate);
			search.put("eOdate", eOdate);
			search.put("name", name);
			search.put("sDdate", sDdate);
			search.put("eDdate", eDdate);
			
			search.put("startRow", pageDTO.getStartRow());
			search.put("pageSize", pageDTO.getPageSize());
	 
			
			List<Map<String,Object>> orderList;
			if(clntCd == null && sOdate == null && eOdate == null && name == null && sDdate == null && eDdate == null) {
			// 議고쉶 �븞�븳 寃쎌슦
				orderList = orderService.getOrderMap(pageDTO); // page留� �븘�슂�빐�꽌
			
			}else { // 議고쉶媛� �꽔�� 寃쎌슦
				orderList = orderService.getOrderMap(search);
				
			}
					
			//�럹�씠吏� 泥섎━
			int count = orderService.countOrder(search);

			int pageBlock = 10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage > pageCount){
			 	endPage = pageCount;
			 }
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			System.out.println("endPage :"+pageDTO.getEndPage());
			System.out.println("count :"+pageDTO.getCount());
			model.addAttribute("orderList", orderList); 
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("search", search);


		return "order/management";
	}
	@RequestMapping(value = "/order/itemList", method = RequestMethod.GET)
	public String itemList(Model model, HttpServletRequest request, PageDTO pageDTO) { // �뭹紐� 由ъ뒪�듃
		String itemNum = request.getParameter("itemNum");
		String itemName = request.getParameter("itemName");
		
		// �븳 �솕硫댁뿉 蹂댁뿬以� 湲� 媛쒖닔 �꽕�젙
		int pageSize = 5; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
		
		// �쁽�럹�씠吏� 踰덊샇 媛��졇�삤湲�
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// �럹�씠吏�踰덊샇瑜� �젙�닔�삎 蹂�寃�
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0�씠 1�뿴�씠湲� �븣臾� 1�쓣 類�)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql�뿉 �뱾�뼱媛��빞�븷 �꽌移� �빆紐� 諛� pageDTO �빆紐� map�뿉 �떞湲�
		search.put("itemNum", itemNum);
		search.put("itemName", itemName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<ItemDTO> itemList = orderService.getItemList(search);
			
		//�럹�씠吏� 泥섎━
		int count = orderService.countItemList(search);

		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		model.addAttribute("itemList", itemList);
		return "order/itemList";
	}
	@RequestMapping(value = "/order/userList", method = RequestMethod.GET)
	public String userList(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String userNum = request.getParameter("userNum");
		String userName = request.getParameter("userName");
		
		// �븳 �솕硫댁뿉 蹂댁뿬以� 湲� 媛쒖닔 �꽕�젙
		int pageSize = 5; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
		
		// �쁽�럹�씠吏� 踰덊샇 媛��졇�삤湲�
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// �럹�씠吏�踰덊샇瑜� �젙�닔�삎 蹂�寃�
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0�씠 1�뿴�씠湲� �븣臾� 1�쓣 類�)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql�뿉 �뱾�뼱媛��빞�븷 �꽌移� �빆紐� 諛� pageDTO �빆紐� map�뿉 �떞湲�
		search.put("userNum", userNum);
		search.put("userName", userName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<userDTO> userList = orderService.getUserList(search);
			
		//�럹�씠吏� 泥섎━
		int count = orderService.countUserList(search);

		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		model.addAttribute("userList", userList);
		return "order/userList";
	}
	@RequestMapping(value = "/order/clntList", method = RequestMethod.GET)
	public String clntList(Model model, HttpServletRequest request, PageDTO pageDTO) { 
		String clntCd = request.getParameter("clntCd");
		String clntName = request.getParameter("clntName");
		
		// �븳 �솕硫댁뿉 蹂댁뿬以� 湲� 媛쒖닔 �꽕�젙
		int pageSize = 5; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
		
		// �쁽�럹�씠吏� 踰덊샇 媛��졇�삤湲�
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// �럹�씠吏�踰덊샇瑜� �젙�닔�삎 蹂�寃�
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql臾몄뿉 �뱾�뼱媛��뒗 �빆紐�
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0�씠 1�뿴�씠湲� �븣臾� 1�쓣 類�)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql�뿉 �뱾�뼱媛��빞�븷 �꽌移� �빆紐� 諛� pageDTO �빆紐� map�뿉 �떞湲�
		search.put("clntCd", clntCd);
		search.put("clntName", clntName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<clntDTO> clntList = orderService.getClntList(search);
			
		//�럹�씠吏� 泥섎━
		int count = orderService.countClntList(search);

		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		model.addAttribute("clntList", clntList);
		return "order/clntList";
	}
}

