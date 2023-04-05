package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ItemDTO;


public interface ItemService {
	//추상메서드
	public List<ItemDTO> itemList();
	
	public void insertItem(ItemDTO itemDTO);
	
	public List<Map<String, Object>> itemSearch(Map<String, Object> itemSearch, PageDTO pageDTO, Model model);
	
	public List<Map<String, Object>> itemList(PageDTO pageDTO, Model model);
	
	public Integer itemCount();
	
	public Integer searchCount(Map<String, Object> itemSearch);
	
	public void deleteItem(int itemId);
	
	public ItemDTO getitemlist(int itemId);

	public void updateItem(ItemDTO itemDTO);
	
}
