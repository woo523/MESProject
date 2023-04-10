package com.itwillbs.work.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.mdm.domain.RequireDTO;
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
	public List<Map<String, Object>> getInstrLiMap(PageDTO pageDTO) { // 실적등록 지시목록
		System.out.println("PerformDAOImpl getInstrLiMap()");
		
		return sqlSession.selectList(namespace+".getInstrLiMap", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getInstrLiMap(Map<String,Object> search) {
		System.out.println("PerformDAOImpl getInstrLiMap(서치용)"); // 실적등록 지시목록

	    return sqlSession.selectList(namespace+".getSearchInstrLiMap",search);

	}
	
	@Override
	public Integer countInstrLi(Map<String,Object> search) { // 실적등록 지시목록 개수(for 페이징)
		System.out.println("PerformDAOImpl countInstrLi()");
		return sqlSession.selectOne(namespace+".countInstrLi", search);
	}
	
	

	@Override
	public List<Map<String, Object>> getPfLiMap(String instrId) { // 지시번호에 해당되는 실적 목록(화면에 출력되는)
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectList(namespace+".getPfLiMap",instrId);
	}

	@Override
	public Map<String, Object> getInstrMap(int instrId) { // 실적등록에 보여지는 지시 목록 하나 불러오기
		System.out.println("PerformDAOImpl getPfLiMap()");
		
		return sqlSession.selectOne(namespace+".getInstrMap",instrId);
	}

	@Override
	public InstructDTO getInstr(int instrId) { // 지시번호에 해당되는 지시목록
		System.out.println("PerformDAOImpl getInstr()");
		return sqlSession.selectOne(namespace+".getInstr",instrId);
	}

	@Override
	public void insertPf(PerformDTO performDTO) { // 실적 등록
		System.out.println("PerformDAOImpl insertPf()");
		sqlSession.insert(namespace+".insertPf", performDTO);
	}

	@Override
	public void delPf(int performId) { // 실적 삭제
		System.out.println("PerformDAOImpl delPf()");
		sqlSession.delete(namespace+".delPf", performId);
	}

	@Override
	public PerformDTO getPf(int performId) { // 실적 정보 1개 가져오기
		System.out.println("PerformDAOImpl getPf()");
		return sqlSession.selectOne(namespace+".getPf",performId);
	}

	@Override
	public void updatePf(PerformDTO performDTO) { // 실적 정보 수정
		System.out.println("PerformDAOImpl updatePf()");
		sqlSession.update(namespace+".updatePf", performDTO);
	}

	@Override
	public List<ItemDTO> getItemlist(Map<String,Object> search) { // 품목리스트 들고오기 (품번, 품명만..)
		System.out.println("PerformDAOImpl getItemlist()");
		System.out.println("itemnum"+search.get("itemNum"));
		System.out.println("itemnm"+search.get("itemNm"));
		if(search.get("itemName")==null) {
			search.put("itemName", "");
		}
		if(search.get("itemNum")==null) {
			search.put("itemNum", "");
		}
		return sqlSession.selectList(namespace+".itemlist", search);
		

	}

	@Override
	public Integer countItemlist(Map<String, Object> search) { // 품목 개수(for 페이징)
		System.out.println("PerformDAOImpl countItemlist()");
		return sqlSession.selectOne(namespace+".countItemlist", search);
		
	}

	@Override
	public List<Map<String, Object>> PerformLiMap(Map<String, Object> search) { // 실적등록 현황 생산실적 목록
		System.out.println("PerformDAOImpl PerformLiMap()");
		return sqlSession.selectList(namespace+".PerformList", search);
	}

	@Override
	public Integer countPerformLi(Map<String, Object> search) { // 실적등록 현황 생산실적 목록 개수(for 페이징)
		System.out.println("PerformDAOImpl countPerformLi()");
		return sqlSession.selectOne(namespace+".countPerformLi", search);
	}

	@Override
	public List<Map<String, Object>> ReqList(String performId) {
		System.out.println("pI : " +performId);
		System.out.println("PerformDAOImpl ReqList()");
		return sqlSession.selectList(namespace+".ReqList", performId);
		
		
	}

	@Override
	public boolean checkY(int instrId) { // 양품이 지시수량보다 큰지
		System.out.println("PerformDAOImpl checkY()");
		return sqlSession.selectOne(namespace+".checkY", instrId);
	}

	@Override
	public void updateClose(int instrId) { // 지시수량 채우면 상태 마감으로 변경
		System.out.println("PerformDAOImpl updateClose()");
		sqlSession.update(namespace+".turnclose", instrId);
		
	}

	@Override
	public void updateStart(int instrId) { // 실적 등록 시작하면 상태 시작으로 변경
		System.out.println("PerformDAOImpl updateStart()");
		sqlSession.update(namespace+".turnstart", instrId);
	}

	@Override
	public void updateInstr(int instrId) { // 실적 다 삭제하면 상태 지시로 변경
		System.out.println("PerformDAOImpl updateInstr()");
		sqlSession.update(namespace+".turninstr", instrId);
	}

	@Override
	public void updateStorage(PerformDTO performDTO) { // 입력한 실적을 창고 item_count 더하기
		System.out.println("PerformDAOImpl updateStorage()");
		sqlSession.update(namespace+".updateStorage", performDTO);
	}
	
	@Override
	public void updateStock(PerformDTO performDTO) { // 입력한 실적을 재고 cur_stock 더하기
		System.out.println("PerformDAOImpl updateStock()");
		sqlSession.update(namespace+".updateStock", performDTO);
	}

	@Override
	public void delStorage(PerformDTO preDTO) { // 실적 수정하면 저번에 입력했던 실적을 창고 item_count에서 뺴기
		System.out.println("PerformDAOImpl delStorage()");
		sqlSession.update(namespace+".delStorage", preDTO);
	}

	@Override
	public void delStock(PerformDTO preDTO) { // 실적 수정하면 저번에 입력했던 실적을 재고 cur_stock에서 뺴기
		System.out.println("PerformDAOImpl delStock()"); 
		sqlSession.update(namespace+".delStock", preDTO);
	}
	
	@Override
	public List<RequireDTO> getReAmnt(int itemId) { // 해당 아이템 소요량 리스트
		System.out.println("PerformDAOImpl getReAmnt()");
		
		return sqlSession.selectList(namespace+".getReAmnt",itemId);
	}

	@Override
	public void updateLineY() { // 지시상태 시작이면 라인 사용
		
		sqlSession.update(namespace + ".updateLineY");
	}

	@Override
	public void updateLineN() { // 지시상태 지시 또는 마감이면 라인 사용 안함
		
		sqlSession.update(namespace + ".updateLineN");
	}
	
	
	
	
	
	
}
