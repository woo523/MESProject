package com.itwillbs.ship.domain;

public class ItemDTO {
	private String itemId;
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}


	private String itemNum;		// 품번
	private String itemNm;	// 품명
	private String invntUnit;	// 재고단위
	
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemNm;
	}
	public void setItemName(String itemName) {
		this.itemNm = itemName;
	}
	public String getInvntUnit() {
		return invntUnit;
	}
	public void setInvntUnit(String invntUnit) {
		this.invntUnit = invntUnit;
	}
	@Override
	public String toString() {
		return "ItemDTO [itemId=" + itemId + ", itemNum=" + itemNum + ", itemNm=" + itemNm + ", invntUnit="
				+ invntUnit + "]";
	}
	
	

	
}
