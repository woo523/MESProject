package com.itwillbs.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.member.domain.MemberDTO;
import com.itwillbs.member.service.MemberService;


@Controller
public class MemberController {

	@Inject
	private MemberService memberService; // 4버전.자동으로 객체생성 한 것.

	// 가상주소 http://localhost:8080/myweb/member/insert
	// 자동으로 가상주소 뽑아옴 /member/insert
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		// 주소변경 없이 이동
		// /WEB-INF/views/member/insertForm.jsp
		return "member/insertForm";
	}

	// 가상주소 http://localhost:8080/myweb/member/insertPro
	// 자동으로 가상주소 뽑아옴 /member/insertPro
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro()");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());


		// 메서드 호출
		memberService.insertMember(memberDTO);

		// 주소 변경되면서 로그인 페이지로 이동
		// response.sendRedirect("/member/login");
		return "redirect:/member/login";
	}

	// 가상주소 http://localhost:8080/myweb/member/login
	// 자동으로 가상주소 뽑아옴 /member/login
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		// 주소변경 없이 이동
		// /WEB-INF/views/member/loginForm.jsp
		return "member/loginForm";
	}

	// 가상주소 http://localhost:8080/myweb/member/loginPro
	// 자동으로 가상주소 뽑아옴 /member/loginPro
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		// 디비 로그인 처리 => 처리 => 디비 자바 메서드 호출
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);

		if (memberDTO2 != null) {
			// 아이디,비밀번호 일치
			System.out.println("memberController.loginPro.아이디 비밀번호 일치");
			session.setAttribute("id", memberDTO.getId());
			// 주소 변경되면서 메인페이지로 이동
			return "redirect:/member/main";
		} else {
			// 아이디,비밀번호 틀림
			System.out.println("memberController.loginPro.아이디 비밀번호 틀림");
			// member/msg.jsp 만들어서 "아이디 비밀번호 틀림" 메시지 출력하고 뒤로이동
			return "member/msg";
		}
		// 주소 변경되면서 로그인 페이지로 이동
		// response.sendRedirect("/member/main");
	}

	// 가상주소 http://localhost:8080/myweb/member/main
	// 자동으로 가상주소 뽑아옴 /member/main
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		// 주소변경 없이 이동
		// /WEB-INF/views/member/main.jsp
		return "member/main";
	}

	// 가상주소 http://localhost:8080/myweb/member/logout
	// 자동으로 가상주소 뽑아옴 /member/logout
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// ↑ 자동으로 http세션 객체 생성.
		System.out.println("MemberController logout()");
		// 세션 초기화
		session.invalidate();
		// 주소 변경되면서 로그인 페이지로 이동
		// response.sendRedirect("/member/main");
		return "redirect:/member/main";
	}

	// 가상주소 http://localhost:8080/myweb/member/info?id=kim
	// 자동으로 가상주소 뽑아옴 /member/info
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) {
		System.out.println("MemberController info()");
		// 세션값 가져오기
		String id = (String) session.getAttribute("id");
		System.out.println("MemberController.info 세션 id : " + id);
		MemberDTO memberDTO = memberService.getMember(id);

		// memberDTO 값을 들고 member/info.jsp로 이동
		// request.setAttribute("memberDTO",memberDTO);
		// -> request 대신에 스프링제공 Model 담아서 이동
		// -> 스프링에서는 이렇게 사용한다 -> model.addAttribute(이름,값)
		model.addAttribute("memberDTO", memberDTO);

		// 주소변경 없이 이동
		// /WEB-INF/views/member/info.jsp
		return "member/info"; // 수정전 나의 정보 조회
	}

	// 가상주소 http://localhost:8080/myweb/member/update
	// 자동으로 가상주소 뽑아옴 /member/update
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) { // 정보를 담아서 가져온게 아니고 세션값을 부른거기때문에 세션을 값으로 준다.
		System.out.println("MemberController update()");
		// 세션값 가져오기
		String id = (String) session.getAttribute("id");
		System.out.println("MemberController.updatePro 세션 id : " + id);

		MemberDTO memberDTO = memberService.getMember(id);

		model.addAttribute("memberDTO", memberDTO);

		// 주소변경 없이 이동
		// /WEB-INF/views/member/updateForm.jsp
		return "member/updateForm";
	}

	// 가상주소 http://localhost:8080/myweb/member/updatePro
	// 자동으로 가상주소 뽑아옴 /member/updatePro
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro()");
		
		// 디비 수정 처리 => 처리 => 디비 자바 메서드 호출
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());
		
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);

		if (memberDTO2 != null) {
			// 아이디,비밀번호 일치
			System.out.println("memberController.updatePro.아이디 비밀번호 일치");

			// 수정작업
			memberService.updateMember(memberDTO);
			// 주소 변경되면서 메인페이지로 이동
			return "redirect:/member/main";
		} else {
			// 아이디,비밀번호 틀림
			System.out.println("memberController.updatePro.아이디 비밀번호 틀림");
			// member/msg.jsp 만들어서 "아이디 비밀번호 틀림" 메시지 출력하고 뒤로이동
			return "member/msg";
		}
		// 주소 변경되면서 메인 페이지로 이동
		// response.sendRedirect("/member/main");
	}

	// 가상주소 http://localhost:8080/myweb/member/delete
	// 자동으로 가상주소 뽑아옴 /member/delete
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model model) {
		System.out.println("MemberController delete()");
		// 세션값 가져오기
		String id = (String) session.getAttribute("id");
		System.out.println("MemberController.delete 세션 id : " + id);

		MemberDTO memberDTO = memberService.getMember(id);

		model.addAttribute("memberDTO", memberDTO);

		// 주소변경 없이 이동
		// /WEB-INF/views/member/deleteForm.jsp
		return "member/deleteForm";
	}

	// 가상주소 http://localhost:8080/myweb/member/deletePro
	// 자동으로 가상주소 뽑아옴 /member/deletePro
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO memberDTO,HttpSession session) {
		System.out.println("MemberController deletePro()");
		// 디비 삭제 처리 => 처리 => 디비 자바 메서드 호출
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		// System.out.println(memberDTO.getName());

		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);

		if (memberDTO2 != null) {
			// 아이디,비밀번호 일치
			System.out.println("memberController.deletePro.아이디 비밀번호 일치");

			// 일치하면 삭제작업
			memberService.deleteMember(memberDTO);
			
			// 세션 초기화
			session.invalidate();
			
			// 주소 변경되면서 메인페이지로 이동
			return "redirect:/member/main";
			
		} else {
			// 아이디,비밀번호 틀림
			System.out.println("memberController.delete.아이디 비밀번호 틀림");
			// member/msg.jsp 만들어서 "아이디 비밀번호 틀림" 메시지 출력하고 뒤로이동
			return "member/msg";
		}
	}

	// 가상주소 http://localhost:8080/myweb/member/list
	// 자동으로 가상주소 뽑아옴 /member/list
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		List<MemberDTO> memberList = memberService.getMemberList();
		
		model.addAttribute("memberList", memberList);
		
		
		// 주소변경 없이 이동
		// /WEB-INF/views/member/list.jsp
		return "member/list";
	}

}
