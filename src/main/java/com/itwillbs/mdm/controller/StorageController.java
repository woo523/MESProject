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

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ClientDTO;
import com.itwillbs.mdm.domain.StorageDTO;
import com.itwillbs.mdm.service.StorageService;

@Controller
public class StorageController {

	@Inject
	private StorageService storageService;
	
	@RequestMapping(value = "/mdm/storage", method = RequestMethod.GET)
	public String storageList(Model model, HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("StorageController storageList()");
		System.out.println("PageDTO:"+pageDTO.getPageNum());
		String storCode = request.getParameter("storCode"); //창고코드
		String storName = request.getParameter("storName"); //창고명
		String storType = request.getParameter("storType"); //창고유형
		String useYn = request.getParameter("useYn"); //사용여부
		
		System.out.println("창고코드:"+storCode);
		System.out.println("창고명:"+storName);
		System.out.println("창고유형:"+storType);
		System.out.println("사용여부:"+useYn);
		
		Map<String, Object> storageSearch = new HashMap<String, Object>();
		storageSearch.put("storCode", storCode);
		storageSearch.put("storName", storName);
		storageSearch.put("storType", storType);
		storageSearch.put("useYn", useYn);
	
		System.out.println(storageSearch);
		
		List<Map<String, Object>> storageList;
		
		if(storCode == null && storName == null && storType == null && useYn == null) {
			//아이템 전체 조회
			storageList = storageService.storageList(pageDTO, model);
				int storagecount = storageService.storageCount();
				model.addAttribute("storagecount", storagecount);
			}else {
				// 검색시
				storageList = storageService.storageSearch(storageSearch,pageDTO,model);
				int searchcount = storageService.searchCount(storageSearch);
				model.addAttribute("searchcount",searchcount);
			}
			
			model.addAttribute("storageList", storageList);
			model.addAttribute("storageSearch", storageSearch);
			model.addAttribute("pageDTO", pageDTO);
			
		
		return "mdm/storage";
	
	}
	
	@RequestMapping(value = "/mdm/storageinsert", method = RequestMethod.GET)
	public String insertstorageList(HttpServletRequest request, Model model) {
		System.out.println("StorageController insertstorageList()");
		List<StorageDTO> storageList = storageService.storagelist();
		model.addAttribute("storageList", storageList);
		return "mdm/storageinsert";	
	}
	
	@RequestMapping(value = "/mdm/storageinsertPro", method = RequestMethod.POST)
	public String insertclientListPro(StorageDTO storageDTO) {
		System.out.println("StorageController insertstorageListPro()");
		
		storageService.insertStorage(storageDTO);
		return "mdm/storageinsert";	
	}
	
	@RequestMapping(value = "/mdm/storagelist", method = RequestMethod.GET)
	public String storagelist(HttpServletRequest request, Model model) {
		int storId=Integer.parseInt(request.getParameter("storId"));
		
		Map<String, Object> storageDTO=storageService.getstoragelist(storId);
		
		model.addAttribute("storageDTO", storageDTO);
//		System.out.println("clientlist 거래처코드:"+clientDTO.getClntCode());
//		System.out.println("clientlist 거래처명:"+clientDTO.getClntName());
		// 주소변경 없이 이동
		// /WEB-INF/views/board/content.jsp
		return "mdm/storage";
	}
	
	@RequestMapping(value = "/mdm/storageupdate", method = RequestMethod.GET)
	public String storageupdate(HttpServletRequest request, Model model) {
		System.out.println("storageupdate()");
		int storId=Integer.parseInt(request.getParameter("storId"));
		System.out.println("update 창고 아이디 : "+storId);
		
		Map<String, Object> storageDTO = storageService.getstoragelist(storId);
		model.addAttribute("storageDTO", storageDTO);
		// 주소변경 없이 이동
		// /WEB-INF/views/board/updateForm.jsp
		return "mdm/storagemodify";
	}
	
	@RequestMapping(value = "/mdm/storageupdatePro", method = RequestMethod.POST)
	public String storageupdatePro(HttpServletRequest request, StorageDTO storageDTO) {
		System.out.println("storageupdatePro()");
		int storId=Integer.parseInt(request.getParameter("storId"));
		System.out.println("id는"+storId);

		
		storageService.updateStorage(storageDTO);
		
		// 주소변경 하면서 이동
		return "mdm/storagemodify";
	}
	
	@RequestMapping(value = "/mdm/storagedelete", method = RequestMethod.GET)
	public String storagedelete(HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("StorageController storagedelete()");
		
		int storId=Integer.parseInt(request.getParameter("storId"));

		storageService.deleteStorage(storId);
		return "redirect:/mdm/storage?pageNum="+pageDTO.getPageNum();	
	}
}
