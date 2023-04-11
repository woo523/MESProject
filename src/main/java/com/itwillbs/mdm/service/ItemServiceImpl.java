package com.itwillbs.mdm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.common.PageDTO;
import com.itwillbs.common.PageUtil;
import com.itwillbs.mdm.dao.ItemDAO;

import com.itwillbs.mdm.domain.ItemDTO;



@Service
public class ItemServiceImpl implements ItemService{
	
	@Inject
	private ItemDAO itemDAO;

	@Override
	public List<ItemDTO> itemList() {
		System.out.println("ItemServiceImpl itemList()");
		return itemDAO.itemList();
	}

	@Override
	public void insertItem(ItemDTO itemDTO) {
		System.out.println("ItemServiceImpl insertitem()");
		itemDAO.insertItem(itemDTO);
	}

	@Override
	public List<Map<String, Object>> itemSearch(Map<String, Object> itemSearch, PageDTO pageDTO, Model model) {
		System.out.println("LineServiceImpl itemSearch()");
		int count = itemDAO.searchCount(itemSearch);
		PageUtil.getPaging(pageDTO, model, count);
		return itemDAO.itemSearch(itemSearch, pageDTO);
	}

	@Override
	public List<Map<String, Object>> itemList(PageDTO pageDTO, Model model) {
		int count = itemDAO.itemCount();
		PageUtil.getPaging(pageDTO, model, count);
		return itemDAO.itemList(pageDTO);
	}

	@Override
	public Integer itemCount() {

		return itemDAO.itemCount();
	}

	@Override
	public Integer searchCount(Map<String, Object> itemSearch) {
	
		return itemDAO.searchCount(itemSearch);
	}
	
	@Override
	public void deleteItem(int itemId) {
		itemDAO.deleteItem(itemId);
	}

	@Override
	public Map<String, Object> getitemlist(int itemId) {
		return itemDAO.getitemlist(itemId);
	}

	@Override
	public void updateItem(ItemDTO itemDTO) {
	
		itemDAO.updateItem(itemDTO);
	}


	
	
	

	


	
	


	
	
	
}
