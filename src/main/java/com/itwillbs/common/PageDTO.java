package com.itwillbs.common;

public class PageDTO {
	// 한 화면에 보여지는 글 개수
	private int pageSize = 10; 
	
	 // 페이지 번호
	private String pageNum = "1";
	
	// 현재 페이지 번호
	private int currentPage; 
	
	// 시작 페이지 번호
	private int startRow; 
	
	// 끝 페이지 번호
	private int endRow; 
	
	// 하나의 블록에 몇 페이지가 속해있는지 // 즉 5이면 <<1,2,3,4,5>> 페이지가 한블록 <<6,7,8,9,10>> 페이지가 한 블록
	private int pageBlock = 10; 
	
	// 현재 페이지가 속한 페이지블록의 시작 페이지 
	// 3페이지는 1번째 페이지 블록임 <<1,2,3,4,5>>. 이 페이지블록의 시작 페이지는 1이다. 
	// 8페이지는 2번째 페이지 블록임 <<6,7,8,9,10>>. 이 페이지블록의 시작 페이지는 6이다.
	private int startPage; 
	
	// 현재 페이지블록의 마지막 페이지
	private int endPage;
	
	// 총 글 개수 == 총 회원수
	private int count;
	
	// 총 페이지수
	private int pageCount;
	
	
	@Override
	public String toString() {
		return "PageDTO "
				+ "[pageSize=" + pageSize + ", pageNum=" + pageNum + ", currentPage=" + currentPage + ","
				+ " startRow=" + startRow + ", endRow=" + endRow + ", pageBlock=" + pageBlock + ","
				+ " startPage=" + startPage + ", endPage=" + endPage + ", count=" + count + ", pageCount=" + pageCount + "]";
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		// 페이지번호를 => 정수형으로 변경
		return Integer.parseInt(this.pageNum); // == pageNum과 결과가 같음. 타입만 int로 바꾼것.
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() { 
		// return (Integer.parseInt(this.pageNum) - 1) * this.pageSize + 1;
		// this.pageSize + 1; 이렇게 하니까 페이징이 제대로 안된다. 이유는 모르겠다
		return (Integer.parseInt(this.pageNum) - 1) * this.pageSize;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() { 
		return this.startRow + this.pageSize-1; // 시작 페이지 번호 + 한 화면에 보여지는 글 개수-1
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
}
