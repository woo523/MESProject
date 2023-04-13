package com.itwillbs.mdm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ClientDTO;
import com.itwillbs.mdm.service.ClientService;
import com.itwillbs.member.domain.MemberDTO;

@Controller
public class ClientController {

	@Inject
	private ClientService clientService;
	
	@RequestMapping(value = "/mdm/client", method = RequestMethod.GET)
	public String clientList(Model model, HttpServletRequest request, PageDTO pageDTO) {
	System.out.println("ClientController clientList()");
		System.out.println("PageDTO:"+pageDTO.getPageNum());
		String clntCode = request.getParameter("clntCode"); //거래처코드
		String clntName = request.getParameter("clntName"); //거래처명
		String clntType = request.getParameter("clntType"); //거래처구분
		String useYn = request.getParameter("useYn"); //사용여부
		System.out.println("거래처코드:"+clntCode);
		System.out.println("거래처명:"+clntName);
		System.out.println("거래처구분:"+clntType);
		System.out.println("사용여부:"+useYn);
		
		Map<String, Object> clientSearch = new HashMap<String, Object>();
		clientSearch.put("clntCode", clntCode);
		clientSearch.put("clntName", clntName);
		clientSearch.put("clntType", clntType);
		clientSearch.put("useYn", useYn);
		
		System.out.println(clientSearch);
		
		List<Map<String,Object>> clientList;
		
		
		
		if(clntCode == null && clntName == null && clntType == null && useYn == null) {
		//아이템 전체 조회
			clientList = clientService.clientList(pageDTO, model);
			int clientcount = clientService.clientCount();
			model.addAttribute("clientcount", clientcount);
			System.out.println("테스트" + clientcount);
		}else {
			// 검색시
			clientList = clientService.clientSearch(clientSearch,pageDTO,model);
			int searchcount = clientService.searchCount(clientSearch);
			model.addAttribute("searchcount",searchcount);
			System.out.println("테스트" + searchcount);
		}
		
		model.addAttribute("clientList", clientList);
		model.addAttribute("clientSearch", clientSearch);
		model.addAttribute("pageDTO", pageDTO);
		
		return "mdm/client";
	
	}
	
	@RequestMapping(value = "/mdm/clientinsert", method = RequestMethod.GET)
	public String insertclientList(HttpServletRequest request, Model model) {
		System.out.println("ClientController insertclientList()");
		List<ClientDTO> clientList = clientService.clientList();
		model.addAttribute("clientList", clientList);
		return "mdm/clientinsert";	
	}
	
	@RequestMapping(value = "/mdm/clientinsertPro", method = RequestMethod.POST)
	public String insertclientListPro(ClientDTO clientDTO) {
		System.out.println("ItemController insertclientListPro()");
		
		
		clientService.insertClient(clientDTO);
		return "redirect:/common/offwindow";	
	}
	
	@RequestMapping(value = "/mdm/clientlist", method = RequestMethod.GET)
	public String clientlist(HttpServletRequest request, Model model) {
		int clntId=Integer.parseInt(request.getParameter("clntId"));
		
		Map<String, Object> clientDTO=clientService.getclientlist(clntId);
		
		model.addAttribute("clientDTO", clientDTO);

		return "mdm/client";
	}
	
	@RequestMapping(value = "/mdm/clientupdate", method = RequestMethod.GET)
	public String clientupdate(HttpServletRequest request, Model model) {
		System.out.println("clientupdate()");
		int clntId=Integer.parseInt(request.getParameter("clntId"));
		System.out.println("update 아이템 아이디 : "+clntId);
		
//		ClientDTO clientDTO=clientService.getclientlist(clntId);
		Map<String, Object> clientDTO = clientService.getclientlist(clntId);
		model.addAttribute("clientDTO", clientDTO);
		// 주소변경 없이 이동
		// /WEB-INF/views/board/updateForm.jsp
		return "mdm/clientmodify";
	}
	
	@RequestMapping(value = "/mdm/clientupdatePro", method = RequestMethod.POST)
	public String clientupdatePro(HttpServletRequest request, ClientDTO clientDTO) {
		System.out.println("clientupdatePro()");
		int clntId=Integer.parseInt(request.getParameter("clntId"));
		System.out.println("id는"+clntId);

		
		clientService.updateClient(clientDTO);
		
		// 주소변경 하면서 이동
		return "redirect:/common/offwindow";
	}
	
	@RequestMapping(value = "/mdm/clientdelete", method = RequestMethod.GET)
	public String clientdelete(HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("ClientController clientdelete()");
		
		int clntId=Integer.parseInt(request.getParameter("clntId"));

		clientService.deleteClient(clntId);
		return "redirect:/mdm/client?pageNum="+pageDTO.getPageNum();	
	}
	
	

	
}
