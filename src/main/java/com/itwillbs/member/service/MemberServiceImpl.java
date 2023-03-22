package com.itwillbs.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.member.dao.MemberDAO;
import com.itwillbs.member.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	// 처리작업
	@Inject
	private MemberDAO memberDAO;

	// 멤버변수 값을 전달 생성자, set메서드 통해서 전달
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl insertMember()");
		// 메서드 호출
		memberDAO.insertMember(memberDTO);
	}

	
	@Override
	public MemberDTO getMember(String id) {
		System.out.println("MemberServiceImpl getMember()");

		return memberDAO.getMember(id);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl updateMember()");
		// 메서드 호출
		memberDAO.updateMember(memberDTO);

	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl deleteMember()");

		memberDAO.deleteMember(memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		System.out.println("MemberServiceImpl getMemberList()");

		return memberDAO.getMemberList();
	}

}
