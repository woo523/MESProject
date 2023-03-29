package com.itwillbs.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.comcode.service.ComCodeService;
import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.member.service.MemberService;

@Controller
public class MemberController {

	@Inject
	private MemberService memberService; // 4버전.자동으로 객체생성 한 것.
	
	@Inject
	private ComCodeService comCodeService; //공통코드

	// 목록화면 이동
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO memberDTO) {
		System.out.println("MemberController list()");
		
		List<MemberDTO> memberList = memberService.getMemberList(memberDTO, model);
		
		model.addAttribute("memberList", memberList);
		
		return "member/list";
	}

	// 상세화면 이동
	@RequestMapping(value = "/member/show", method = RequestMethod.GET)
	public String show(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO memberDTO) {
		System.out.println("MemberController show()");

		MemberDTO dto = memberService.getMember(memberDTO.getId());

		model.addAttribute("memberDTO", dto);

		return "member/show";
	}

	// 등록화면 이동
	@RequestMapping(value = "/member/create", method = RequestMethod.GET)
	public String create(HttpServletRequest request, HttpServletResponse response, Model model) {
		// "departmentComCdList"-> 부서유형공통코드리스트(본인이정하면된다) selcetCode("department_type") : 공통코드 코드그룹에 입력한이름
		model.addAttribute("departmentComCdList", comCodeService.selcetCode("department_type")); //부서유형 공통코드 
		model.addAttribute("positionComCdList", comCodeService.selcetCode("position_type")); //직책유형 공통코드 
		return "member/create";
	}

	// 수정화면 이동
	@RequestMapping(value = "/member/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO memberDTO) {
		System.out.println("MemberController edit()");

		MemberDTO dto = memberService.getMember(memberDTO.getId());

		model.addAttribute("memberDTO", dto);
		// "departmentComCdList"-> 부서유형공통코드리스트(본인이정하면된다) selcetCode("department_type") : 공통코드 코드그룹에 입력한이름
		model.addAttribute("departmentComCdList", comCodeService.selcetCode("department_type")); //부서유형 공통코드
		model.addAttribute("positionComCdList", comCodeService.selcetCode("position_type")); //직책유형 공통코드
		return "member/edit";
	}

	// 등록처리
	@RequestMapping(value = "/member/insert", method = RequestMethod.POST)
	public String insert(MemberDTO memberDTO) {
		System.out.println("MemberController insert()");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());

		memberService.insertMember(memberDTO);

		return "redirect:/member/list";
	}

	// 수정처리
	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController update()");
		// 디비 수정 처리 => 처리 => 디비 자바 메서드 호출
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());

		memberService.updateMember(memberDTO);

		return "redirect:/member/list";
	}

	// 삭제처리
	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	public String delete(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController delete()");
		// 디비 삭제 처리 => 처리 => 디비 자바 메서드 호출
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());

		// 삭제작업
		memberService.deleteMember(memberDTO);
		// 세션 초기화
		return "redirect:/member/list";
	}

}
