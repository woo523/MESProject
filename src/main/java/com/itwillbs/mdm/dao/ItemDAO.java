package com.itwillbs.mdm.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.common.PageDTO;
import com.itwillbs.mdm.domain.ItemDTO;


public interface ItemDAO {
	public List<ItemDTO> itemList();
	
	public void insertItem(ItemDTO itemDTO);
	
	public List<Map<String, Object>> itemSearch(Map<String, Object> itemSearch, PageDTO pageDTO);

	public List<Map<String, Object>> itemList(PageDTO pageDTO);
	
	public Integer itemCount();
	
	public Integer searchCount(Map<String, Object> lineSearch);
	
	public void deleteItem(int itemId);

	public ItemDTO getitemlist(int itemId);
	
	public void updateItem(ItemDTO itemDTO);
}
