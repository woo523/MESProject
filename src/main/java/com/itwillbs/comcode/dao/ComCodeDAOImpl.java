package com.itwillbs.comcode.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.comcode.domain.ComCodeDTO;

@Repository
public class ComCodeDAOImpl implements ComCodeDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.comCodeMapper";

	@Override
	public void insertComCode(ComCodeDTO comCodeDTO) {
		// 디비작업
		System.out.println("ComCodeDAOImpl insertComCode()");
	
		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.insert(namespace + ".insertComCode", comCodeDTO);
	}

	@Override
	public List<ComCodeDTO> getComCodeList(ComCodeDTO comCodeDTO) {
		
		System.out.println("ComCodeDAOImpl getMemberList()");
		
		return sqlSession.selectList(namespace + ".getComCodeList", comCodeDTO);
		
	}

	@Override
	public int getComCodeCount() {// 총 개수 조회
		System.out.println("ComCodeDAOImpl getComCodeCount()");
		
		return sqlSession.selectOne(namespace + ".getComCodeCount");
	}

	@Override
	public void updateComCode(ComCodeDTO comCodeDTO) {
		// 디비작업
		System.out.println("ComCodeDAOImpl updateComCode()");

		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.update(namespace + ".updateComCode", comCodeDTO);
		
	}

	@Override
	public void deleteComCode(ComCodeDTO comCodeDTO) {
		// 디비작업
		System.out.println("ComCodeDAOImpl deleteComCode()");

		// sqlSession.insert(sql구문이름, ?에 입력될 값);
		sqlSession.delete(namespace + ".deleteComCode", comCodeDTO);
		
	}

	@Override
	public ComCodeDTO getComCode(ComCodeDTO comCodeDTO) {
		System.out.println("ComCodeDAOImpl getComCode()");
		// selectOne 리턴값이 MemberDTO 하나일때 사용
		return sqlSession.selectOne(namespace + ".getComCode", comCodeDTO);
	}

	
	
	
	//하위코드리스트 팝업에서 뿌려줄 하위코드들 조회 (코드그룹을 where 조건으로 줘서 조회)
	@Override
	public List<ComCodeDTO> getSubComCodeList(String cdGrp) {
		System.out.println("ComCodeDAOImpl getSubComCodeList()");
		return sqlSession.selectList(namespace + ".getSubComCodeList", cdGrp);
	}

	//사용여부가 사용이면서 코드그룹으로 하위코드 리스트들 조회
	@Override
	public List<ComCodeDTO> selcetCode(String cdGrp) {
		System.out.println("ComCodeDAOImpl selcetCode()");
		return sqlSession.selectList(namespace + ".selcetCode", cdGrp);
	}
	
	

	
}
