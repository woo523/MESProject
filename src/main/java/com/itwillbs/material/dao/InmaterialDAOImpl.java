package com.itwillbs.material.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.material.domain.InmaterialDTO;
import com.itwillbs.material.domain.PageDTO;

@Repository
public class InmaterialDAOImpl implements InmaterialDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.materialMapper";
	
	@Override
	public List<InmaterialDTO> inmaterList() {
		System.out.println("InstructDAOImpl inmaterList()");
		
		return sqlSession.selectList(namespace + ".inmaterList");
	}

	@Override
	public List<InmaterialDTO> getInmaterList(PageDTO pageDTO) {
		System.out.println("InstructDAOImpl getInmaterList()");
		
		// limit #{startRow-1} , #{pageSize}
		// (1을 포함하지 않고 10개) 1-1,10 =>  1~10
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getInmaterList", pageDTO);
	}

	@Override
	public int getInmaterCount() {
		System.out.println("InstructDAOImpl getInmaterCount()");
		
		return sqlSession.selectOne(namespace+".getInmaterCount");
	}

}