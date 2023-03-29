package com.itwillbs.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.work.domain.InstructDTO;
import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.work.domain.PageDTO;
import com.itwillbs.work.domain.PerformDTO;



@Repository
public class PerformDAOImpl implements PerformDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.performMapper";

	@Override
	public List<Map<String, Object>> getInstrLiMap(PageDTO pageDTO) { // �ㅼ���깅� 吏���紐⑸�
		System.out.println("PerformDAOImpl getInstrLiMap()");
		
		return sqlSession.selectList(namespace+".getInstrLiMap", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap(Map<String,Object> search) {
		System.out.println("PerformDAOImpl getInstrLiMap(��移���)"); // �ㅼ���깅� 吏���紐⑸�

	    return sqlSession.selectList(namespace+".getSearchInstrLiMap",search);

	}
	
	@Override
	public Integer countInstrLi(Map<String,Object> search) { // �ㅼ���깅� 吏���紐⑸� 媛���(for ���댁�)
		System.out.println("PerformDAOImpl countInstrLi()");
		return sqlSession.selectOne(namespace+".countInstrLi", search);
	}
	
	

	@Override
	public List<Map<String, Object>> getPfLiMap(String instrId) { // 吏���踰��몄�� �대�밸���� �ㅼ�� 紐⑸�(��硫댁�� 異��λ����)
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectList(namespace+".getPfLiMap",instrId);
	}

	@Override
	public Map<String, Object> getInstrMap(int instrId) { // �ㅼ���깅��� 蹂댁�ъ��� 吏��� 紐⑸� ���� 遺��ъ�ㅺ린
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectOne(namespace+".getInstrMap",instrId);
	}

	@Override
	public InstructDTO getInstr(int instrId) { // 吏���踰��몄�� �대�밸���� 吏���紐⑸�
		System.out.println("PerformDAOImpl getInstr()");
		return sqlSession.selectOne(namespace+".getInstr",instrId);
	}

	@Override
	public void insertPf(PerformDTO performDTO) { // �ㅼ�� �깅�
		System.out.println("PerformDAOImpl insertPf()");
		sqlSession.insert(namespace+".insertPf", performDTO);
	}

	@Override
	public void delPf(int performId) { // �ㅼ�� ����
		System.out.println("PerformDAOImpl delPf()");
		sqlSession.delete(namespace+".delPf", performId);
	}

	@Override
	public PerformDTO getPf(int performId) { // �ㅼ�� ��蹂� 1媛� 媛��몄�ㅺ린
		System.out.println("PerformDAOImpl getPf()");
		return sqlSession.selectOne(namespace+".getPf",performId);
	}

	@Override
	public void updatePf(PerformDTO performDTO) { // �ㅼ�� ��蹂� ����
		System.out.println("PerformDAOImpl updatePf()");
		sqlSession.update(namespace+".updatePf", performDTO);
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String,Object> search) { // ��紐⑸━�ㅽ�� �ㅺ��ㅺ린 (��踰�, ��紐�留�..)
		System.out.println("PerformDAOImpl getItemlist()");
		
		return sqlSession.selectList(namespace+".itemlist", search);
	}

	@Override
	public Integer countItemlist(Map<String, Object> search) { // ��紐� 媛���(for ���댁�)
		System.out.println("PerformDAOImpl countItemlist()");
		return sqlSession.selectOne(namespace+".countItemlist", search);
		
	}

	@Override
	public List<Map<String, Object>> PerformLiMap(Map<String, Object> search) { // �ㅼ���깅� ���� ���곗�ㅼ�� 紐⑸�
		System.out.println("PerformDAOImpl PerformLiMap()");
		return sqlSession.selectList(namespace+".PerformList", search);
	}

	@Override
	public Integer countPerformLi(Map<String, Object> search) { // �ㅼ���깅� ���� ���곗�ㅼ�� 紐⑸� 媛���(for ���댁�)
		System.out.println("PerformDAOImpl countPerformLi()");
		return sqlSession.selectOne(namespace+".countPerformLi", search);
	}

	@Override
	public List<Map<String, Object>> ReqList(String performId) {
		System.out.println("pI : " +performId);
		System.out.println("PerformDAOImpl ReqList()");
		return sqlSession.selectList(namespace+".ReqList", performId);
	}


	
	
	
	
}
