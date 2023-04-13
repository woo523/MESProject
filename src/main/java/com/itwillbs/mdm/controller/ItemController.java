package com.itwillbs.mdm.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
		System.out.println("품번:"+itemNum);
		System.out.println("품명:"+itemName);
		System.out.println("자재유형:"+mtrlType);
		System.out.println("자재구분:"+mtrlSort);
		System.out.println("사용여부:"+useYn);
		
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
			System.out.println("테스트" + itemcount);
		}else {
			// 검색시
			itemList = itemService.itemSearch(itemSearch,pageDTO,model);
			int searchcount = itemService.searchCount(itemSearch);
			model.addAttribute("searchcount",searchcount);
			System.out.println("테스트" + searchcount);
		}
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("itemSearch", itemSearch);
		model.addAttribute("pageDTO", pageDTO);
		return "mdm/item";	
	}

	@RequestMapping(value = "/mdm/iteminsert", method = RequestMethod.GET)
	public String insertitemList(HttpServletRequest request, Model model) {
		System.out.println("ItemController insertitemList()");
		List<Map<String, Object>> clientList = clientService.clientlist();
//		List<ItemDTO> itemList = itemService.itemList();
		model.addAttribute("clientList", clientList);
//		model.addAttribute("clientList", itemList);
		return "mdm/iteminsert";	
	}
	
	@RequestMapping(value = "/mdm/iteminsertPro", method = RequestMethod.POST)
	public String insertitemListPro(ItemDTO itemDTO) {
		System.out.println("ItemController insertitemListPro()");
		
		itemService.insertItem(itemDTO);
		return "redirect:/common/offwindow";	
	}
	
	
	@RequestMapping(value = "/mdm/itemlist", method = RequestMethod.GET)
	public String itemlist(HttpServletRequest request, Model model) {
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		
		Map<String, Object> itemDTO=itemService.getitemlist(itemId);
		
		model.addAttribute("itemDTO", itemDTO);

		// 주소변경 없이 이동
		// /WEB-INF/views/board/content.jsp
		return "mdm/item";
	}
	
	@RequestMapping(value = "/mdm/itemupdate", method = RequestMethod.GET)
	public String itemupdate(HttpServletRequest request, Model model) {
		System.out.println("itemupdate()");
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		System.out.println("update 아이템 아이디 : "+itemId);
		
		Map<String, Object> itemDTO=itemService.getitemlist(itemId);
		model.addAttribute("itemDTO", itemDTO);
		
		List<Map<String, Object>> clientList=clientService.clientlist();
		model.addAttribute("clientList", clientList);
		// 주소변경 없이 이동
		// /WEB-INF/views/board/updateForm.jsp
		return "mdm/itemmodify";
	}
	
	@RequestMapping(value = "/mdm/itemupdatePro", method = RequestMethod.POST)
	public String itemupdatePro(HttpServletRequest request, ItemDTO itemDTO) {
		System.out.println("itemupdatePro()");
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		System.out.println("id는"+itemId);
		
		System.out.println("바꿀품번:"+itemDTO.getItemNum());
		System.out.println("바꿀품명:"+itemDTO.getItemName());
		System.out.println("바꿀자재유형:"+itemDTO.getMtrlType());
		
		itemService.updateItem(itemDTO);
		
		// 주소변경 하면서 이동
		return "redirect:/common/offwindow";
	}
	
	
	@RequestMapping(value = "/mdm/itemdelete", method = RequestMethod.GET)
	public String itemdelete(HttpServletRequest request,  PageDTO pageDTO) {
		System.out.println("ItemController itemdelete()");
		
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		
		itemService.deleteItem(itemId);
		return "redirect:/mdm/item?pageNum="+pageDTO.getPageNum();
	}
	
//	@GetMapping("/clientList")
//	public void clientList(HttpServletRequest request, Model model) {
//		System.out.println("ItemController clientList()");
//		List<ClientDTO> clientList = clientService.clientlist();
//		model.addAttribute("clientList", clientList);
//	}
}
