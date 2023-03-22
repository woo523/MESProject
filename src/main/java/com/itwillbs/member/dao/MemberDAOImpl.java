package com.itwillbs.member.dao;

import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itwillbs.member.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.memberMapper";

	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 디비작업
		System.out.println("MemberDAOImpl insertMember()");

		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.insert(namespace + ".insertMember", memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl userCheck()");

		// selectOne = 리턴값이 MemberDTO 하나일 때 사용
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
		// (이름+".전체이름",변수);

	}

	@Override
	public MemberDTO getMember(String id) {
		System.out.println("MemberDAOImpl getMember()");
		// selectOne 리턴값이 MemberDTO 하나일때 사용
		return sqlSession.selectOne(namespace + ".getMember", id);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		// 디비작업
		System.out.println("MemberDAOImpl updateMember()");

		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.insert(namespace + ".updateMember", memberDTO);

	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		// 디비작업
		System.out.println("MemberDAOImpl deleteMember()");

		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.insert(namespace + ".deleteMember", memberDTO);

	}

	@Override
	public List<MemberDTO> getMemberList() {
		System.out.println("MemberDAOImpl getMemberList()");

		return sqlSession.selectList(namespace + ".getMemberList");
	}

}
