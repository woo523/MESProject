package com.itwillbs.sample.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.sample.domain.SampleDTO;



@Repository
public class SampleDAOImpl implements SampleDAO{
	
	@Inject 
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.sampleMapper";

	@Override
	public List<SampleDTO> searchList() {
		return sqlSession.selectList(namespace+".searchList");
	}

	
	
	

}
