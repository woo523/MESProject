package com.itwillbs.comcode.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.comcode.domain.ComCodeDTO;
import com.itwillbs.comcode.service.ComCodeService;
import com.itwillbs.member.domain.MemberDTO;


@Controller
public class ComCodeController {

	@Inject
	private ComCodeService comCodeService; // 4버전.자동으로 객체생성 한 것.
	
	
	
	/**********************************코드그룹(상위코드) 이동 및 처리부분 시작**************************************/
	// 목록화면 이동
	@RequestMapping(value = "/comCode/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController list()");
		
		List<ComCodeDTO> comCodeList = comCodeService.getComCodeList(comCodeDTO, model);
		
		model.addAttribute("comCodeList", comCodeList);
		
		return "comCode/list";
	}
	
	// 등록화면 이동
	@RequestMapping(value = "/comCode/create", method = RequestMethod.GET)
	public String create() {
		return "comCode/create";
	}
	
	// 수정화면 이동
	@RequestMapping(value = "/comCode/edit", method = RequestMethod.GET)
	   public String edit(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
	      System.out.println("ComCodeController edit()");

	      comCodeDTO.setCdGrp("0000");

	      ComCodeDTO dto = comCodeService.getComCode(comCodeDTO);
	      
	      model.addAttribute("dto", dto);

	      return "comCode/edit";
	}
	// 등록처리
	@RequestMapping(value = "/comCode/insert", method = RequestMethod.POST)
	public String insert(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController insert()");
		System.out.println(comCodeDTO.getCdGrp());
		System.out.println(comCodeDTO.getCd());
		System.out.println(comCodeDTO.getCdNm());

		comCodeService.insertComCode(comCodeDTO);
		
		if("POP".equals(comCodeDTO.getMode())) {//팝업에서 등록하였을 경우
			//return "common/offwindow";//팝업에서 등록하였을 경우 팝업창 닫는 페이지로 이동
			return "redirect:/comCode/listPop?cdGrp="+comCodeDTO.getCdGrp();//팝업에서 등록하였을 경우 팝업리스트로 이동
		}else {// 그 외 리스트로 이동
			return "redirect:/comCode/list";
		}

	}
	
	// 수정처리
	@RequestMapping(value = "/comCode/update", method = RequestMethod.POST)
	public String updatePro(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController update()");

		comCodeService.updateComCode(comCodeDTO);

		
		if("POP".equals(comCodeDTO.getMode())) {//팝업에서 수정하였을 경우
			return "redirect:/comCode/listPop?cdGrp="+comCodeDTO.getCdGrp();//팝업에서 수정하였을 경우 팝업리스트로 이동
		}else {// 그 외 리스트로 이동
			return "redirect:/comCode/list";
		}
	}

	// 삭제처리
	@RequestMapping(value = "/comCode/delete", method = RequestMethod.POST)
	public String delete(ComCodeDTO comCodeDTO, HttpSession session) {
		System.out.println("ComCodeController delete()");
		// 디비 삭제 처리 => 처리 => 디비 자바 메서드 호출
		
		// 삭제작업
		comCodeService.deleteComCode(comCodeDTO); 	// 상위코드 삭제
		
		if("POP".equals(comCodeDTO.getMode())) {
			comCodeDTO.setCdGrp(comCodeDTO.getCd());	// 하위코드를 삭제하기 위해서 상위코드를 하위코드그룹으로 세팅
			comCodeDTO.setCd(null);						// cdGrp로만 삭제하기 위해서 cd는 null로 세팅(cd가 null일경우, 쿼리 where절에 cd는 포함안됨) 
		}
		
		
		if("POP".equals(comCodeDTO.getMode())) {//팝업에서 삭제하였을 경우		
			//return "common/offwindow";//팝업에서 등록하였을 경우 팝업창 닫는 페이지로 이동
			return "redirect:/comCode/listPop?cdGrp="+comCodeDTO.getCdGrp();//팝업에서 삭제하였을 경우 팝업리스트로 이동
		}else {// 그 외 리스트로 이동
			return "redirect:/comCode/list";
		}
	}
	
	/**********************************코드그룹(상위코드) 이동 및 처리부분 끝**************************************/
	
	
	
	
	/**********************************코드(하위코드) 이동 및 처리부분 시작**************************************/
	//하위코드목록 팝업이동
	@RequestMapping(value = "/comCode/listPop", method = RequestMethod.GET)
	public String listPop(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeController listPop()");
		
		
		//코드그룹(상위코드)에 따른 하위코드 리스트 조회
		List<ComCodeDTO> comCodeList = comCodeService.getSubComCodeList(comCodeDTO.getCdGrp());
		
		//상위코드 정보 조회
		comCodeDTO.setCd(comCodeDTO.getCdGrp());
		comCodeDTO.setCdGrp("0000");
		ComCodeDTO parentCdDTO = comCodeService.getComCode(comCodeDTO);
		
		model.addAttribute("comCodeList", comCodeList); //코드그룹(상위코드)에 따른 하위코드 리스트 조회
		model.addAttribute("parentCdDTO", parentCdDTO); //상위코드 정보
		return "comCode/listPop";
	}
	
	// 등록화면 팝업이동
	@RequestMapping(value = "/comCode/createPop", method = RequestMethod.GET)
	public String createPop(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
		
		//상위코드 정보 조회
		comCodeDTO.setCd(comCodeDTO.getCdGrp());
		comCodeDTO.setCdGrp("0000");
		ComCodeDTO parentCdDTO = comCodeService.getComCode(comCodeDTO);
		
		model.addAttribute("parentCdDTO", parentCdDTO); //상위코드 정보
		
		return "comCode/createPop";
	}

	// 수정화면 팝업이동
   @RequestMapping(value = "/comCode/editPop", method = RequestMethod.GET)
   public String editPop(HttpServletRequest request, HttpServletResponse response, Model model, ComCodeDTO comCodeDTO) {
       System.out.println("ComCodeController edit()");
       	
       //수정할 하위코드 정보 조회
       ComCodeDTO dto = comCodeService.getComCode(comCodeDTO);

        
       //상위코드 정보 조회
       comCodeDTO.setCd(comCodeDTO.getCdGrp());
       comCodeDTO.setCdGrp("0000");
       ComCodeDTO parentCdDTO = comCodeService.getComCode(comCodeDTO);
      		
      		
       model.addAttribute("dto", dto); //수정할 하위코드 정보
       model.addAttribute("parentCdDTO", parentCdDTO); //상위코드 정보
       
       return "comCode/editPop";
   }
	
   /**********************************코드(하위코드) 이동 및 처리부분 끝**************************************/
   
   	 // 중복확인 
	// 가상주소 http://localhost:8080/comCode/comCheck
	@RequestMapping(value = "/comCode/comCheck")
	public ResponseEntity<String> comCheck(ComCodeDTO comCodeDTO,HttpServletRequest request) {
		System.out.println("ComCodeController comCheck() ");
		String result="";
		// request 파라미터 cdGrp 가져오기 (cd포함)
		String cdGrp=request.getParameter("cdGrp");
		
		// 디비 아이디 중복체크
		ComCodeDTO comCodeDTO2 = comCodeService.comCheck(comCodeDTO);
		
		if(comCodeDTO2!=null) {
			//아이디 있음 => 아이디 중복
			result="Y";
		}else {
			//아이디 없음 => 아이디 사용가능
			result="N";
		}
		//출력 결과 ResponseEntity 저장 => 되돌아감
		ResponseEntity<String> entity= new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}   
   
   
}
