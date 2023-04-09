package com.itwillbs.mdm.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.itwillbs.mdm.domain.ClientDTO;
import com.itwillbs.mdm.domain.ItemDTO;
import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.service.ClientService;
import com.itwillbs.mdm.service.ItemService;

@Controller
public class ItemController {

	@Inject
	private ItemService itemService;
	
	@Inject
	private ClientService clientService;
	
	
	@RequestMapping(value = "/mdm/item", method = RequestMethod.GET)
	public String itemList(Model model, HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("ItemController itemList()");
		
		String itemNum = request.getParameter("itemNum");
		String itemName = request.getParameter("itemName");
		String mtrlType = request.getParameter("mtrlType");
		String mtrlSort = request.getParameter("mtrlSort");
		String useYn = request.getParameter("useYn");
		
		Map<String, Object> itemSearch = new HashMap<String, Object>();
		itemSearch.put("itemNum", itemNum);
		itemSearch.put("itemName", itemName);
		itemSearch.put("mtrlType", mtrlType);
		itemSearch.put("mtrlSort", mtrlSort);
		itemSearch.put("useYn", useYn);
		System.out.println(itemSearch);
		
		List<Map<String,Object>> itemList;
		
		
		
		if(itemNum == null && itemName == null && mtrlType == null && mtrlSort == null && useYn == null) {
		//아이템 전체 조회
			itemList = itemService.itemList(pageDTO, model);
			int itemcount = itemService.itemCount();
			model.addAttribute("itemcount", itemcount);
		}else {
			// 검색시
			itemList = itemService.itemSearch(itemSearch,pageDTO,model);
			int searchcount = itemService.searchCount(itemSearch);
			model.addAttribute("searchcount",searchcount);
		}
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("itemSearch", itemSearch);
		
		return "mdm/item";	
	}

	@RequestMapping(value = "/mdm/iteminsert", method = RequestMethod.GET)
	public String insertitemList(HttpServletRequest request, Model model) {
		System.out.println("ItemController insertitemList()");
		List<ClientDTO> clientList = clientService.clientList();
		model.addAttribute("clientList", clientList);
		return "mdm/iteminsert";	
	}
	
	@RequestMapping(value = "/mdm/iteminsertPro", method = RequestMethod.POST)
	public String insertitemListPro(ItemDTO itemDTO) {
		System.out.println("ItemController insertitemListPro()");
		
		itemService.insertItem(itemDTO);
		return "mdm/iteminsert";	
	}
	
	
	@RequestMapping(value = "/mdm/itemlist", method = RequestMethod.GET)
	public String itemlist(HttpServletRequest request, Model model) {
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		
		ItemDTO itemDTO=itemService.getitemlist(itemId);
		
		model.addAttribute("boardDTO", itemDTO);
		
		// 주소변경 없이 이동
		// /WEB-INF/views/board/content.jsp
		return "mdm/item";
	}
	
	@RequestMapping(value = "/mdm/itemupdate", method = RequestMethod.GET)
	public String itemupdate(HttpServletRequest request, Model model) {
		System.out.println("itemupdate()");
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		System.out.println("update 아이템 아이디 : "+itemId);
		
		ItemDTO itemDTO=itemService.getitemlist(itemId);
		model.addAttribute("itemDTO", itemDTO);
		
		// 주소변경 없이 이동
		// /WEB-INF/views/board/updateForm.jsp
		return "mdm/item";
	}
	
	@RequestMapping(value = "/mdm/itemupdatePro", method = RequestMethod.POST)
	public String itemupdatePro(HttpServletRequest request, ItemDTO itemDTO, Model model) {
		System.out.println("itemupdatePro()");
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		System.out.println("id는"+itemId);
	
		ItemDTO itemDTO2=itemService.getitemlist(itemId);
		
		
		System.out.println("기존품번:"+itemDTO2.getItemNum());
		System.out.println("기존품명:"+itemDTO2.getItemName());
		System.out.println("기존자재유형:"+itemDTO2.getMtrlType());
		
		System.out.println("바꿀품번:"+itemDTO.getItemNum());
		System.out.println("바꿀품명:"+itemDTO.getItemName());
		System.out.println("바꿀자재유형:"+itemDTO.getMtrlType());
		
//		itemService.updateItem(itemDTO);
		
		// 주소변경 하면서 이동
		return "redirect:/mdm/item";
	}
	
	
	@RequestMapping(value = "/mdm/itemdelete", method = RequestMethod.GET)
	public String itemdelete(HttpServletRequest request) {
		System.out.println("ItemController itemdelete()");
		
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		
		itemService.deleteItem(itemId);
		return "mdm/item";	
	}
	
	@GetMapping("/clientList")
	public void clientList(HttpServletRequest request, Model model) {
		System.out.println("ItemController clientList()");
		List<ClientDTO> clientList = clientService.clientList();
		model.addAttribute("clientList", clientList);
	}
}
