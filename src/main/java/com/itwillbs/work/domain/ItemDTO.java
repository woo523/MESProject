package com.itwillbs.work.domain;

public class ItemDTO {
	private int itemId;			// 품목 기본키
	private String itemNum;		// 품번
	private String itemName;	// 품명
	private String invntUnit;	// 재고단위
	
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getInvntUnit() {
		return invntUnit;
	}
	public void setInvntUnit(String invntUnit) {
		this.invntUnit = invntUnit;
	}
	
	
	@Override
	public String toString() {
		return "ItemDTO [itemId=" + itemId + ", itemNum=" + itemNum + ", itemName=" + itemName + ", invntUnit="
				+ invntUnit + "]";
	}

	
}
