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
import com.itwillbs.mdm.domain.EquipDTO;
import com.itwillbs.mdm.service.EquipService;


@Controller
public class EquipController {

	@Inject
	private EquipService equipService;
		
	@RequestMapping(value = "/mdm/equip", method = RequestMethod.GET)
	public String equipList(Model model, HttpServletRequest request, PageDTO pageDTO) {
	System.out.println("EquipController equipList()");
		System.out.println("PageDTO:"+pageDTO.getPageNum());
		String equpCode = request.getParameter("equpCode"); //설비코드
		String equpName = request.getParameter("equpName"); //설비명
		String equpType = request.getParameter("equpType"); //설비유형
		String equpStat = request.getParameter("equpStat"); //설비상태
		String useYn = request.getParameter("useYn"); //사용여부
		
		Map<String, Object> equipSearch = new HashMap<String, Object>();
		equipSearch.put("equpCode", equpCode);
		equipSearch.put("equpName", equpName);
		equipSearch.put("equpType", equpType);
		equipSearch.put("equpStat", equpStat);
		equipSearch.put("useYn", useYn);
		
		System.out.println(equipSearch);
		
		List<Map<String,Object>> equipList;
		
		System.out.println("테스트테스트:" + equpStat);
		
		if(equpCode == null && equpName == null && equpType == null && equpStat == null && useYn == null) {
		//설비 전체 조회
			equipList = equipService.equipList(pageDTO, model);
			int equipcount = equipService.equipCount();
			model.addAttribute("equipcount", equipcount);
			System.out.println("테스트 :"+equipcount);
		
		}else {
			// 검색시
			equipList = equipService.equipSearch(equipSearch,pageDTO,model);
			int searchcount = equipService.searchCount(equipSearch);
			model.addAttribute("searchcount",searchcount);
			System.out.println("테스트 :"+searchcount);
		}
		
		model.addAttribute("equipList", equipList);
		model.addAttribute("equipSearch", equipSearch);
		model.addAttribute("pageDTO", pageDTO);
		
		return "mdm/equip";
	
	}
	
	@RequestMapping(value = "/mdm/equipinsert", method = RequestMethod.GET)
	public String insertequipList(HttpServletRequest request, Model model) {
		List<EquipDTO> equipList = equipService.equiplist();
		model.addAttribute("equipList", equipList);
		return "mdm/equipinsert";	
	}
	
	@RequestMapping(value = "/mdm/equipinsertPro", method = RequestMethod.POST)
	public String insertequipListPro(EquipDTO equipDTO) {
		
		
		equipService.insertEquip(equipDTO);
		return "redirect:/common/offwindow";	
	}
	
	@RequestMapping(value = "/mdm/equiplist", method = RequestMethod.GET)
	public String equiplist(HttpServletRequest request, Model model) {
		int equpId=Integer.parseInt(request.getParameter("equpId"));
		
		Map<String, Object> equipDTO=equipService.getequiplist(equpId);
		
		model.addAttribute("equipDTO", equipDTO);

		return "mdm/equip";
	}
	
	@RequestMapping(value = "/mdm/equipupdate", method = RequestMethod.GET)
	public String equipupdate(HttpServletRequest request, Model model) {
		System.out.println("equipupdate()");
		int equpId=Integer.parseInt(request.getParameter("equpId"));
		System.out.println("update 설비 아이디 : "+equpId);
		
		Map<String, Object> equipDTO = equipService.getequiplist(equpId);
		model.addAttribute("equipDTO", equipDTO);
		return "mdm/equipmodify";
	}
	
	@RequestMapping(value = "/mdm/equipupdatePro", method = RequestMethod.POST)
	public String equipupdatePro(HttpServletRequest request, EquipDTO equipDTO) {
		System.out.println("equipupdatePro()");
		int equpId=Integer.parseInt(request.getParameter("equpId"));
		System.out.println("id는"+equpId);

		
		equipService.updateEquip(equipDTO);
		
		// 주소변경 하면서 이동
		return "redirect:/common/offwindow";
	}
	
	@RequestMapping(value = "/mdm/equipdelete", method = RequestMethod.GET)
	public String equipdelete(HttpServletRequest request, PageDTO pageDTO) {
		
		int equpId=Integer.parseInt(request.getParameter("equpId"));

		equipService.deleteEquip(equpId);
		return "redirect:/mdm/equip?pageNum="+pageDTO.getPageNum();	
	}
	
	
}
