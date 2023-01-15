package com.panda.domain;

public class Criteria {
	// 페이징처리에 필요한 정보를 저장 (페이지 시작정보, 사이즈)
	
	private int page; // 시작페이지 정보
	private int perPageNum;	// 페이지 개수
	private String p_category = ""; // 페이징+카테고리 정
	
	// 페이징처리 정보가 없을경우 - 기본값[기본생성자 =>> 전달인자가 없으면 기본값으로 세팅됨.]
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	// 페이징 정보 (음수일때 1페이지 정보)
	public void setPage(int page) {
		if(page<=0) {
			this.page = 1;
			return; // else없이 리턴하면 뒤에는 검사 안해도되서 괜찮은듯?
		}
		this.page = page;
	}
	
	// 페이지 사이즈 (음수, 페이지수가 100이상 -> 기본값 10)
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum >= 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	// #{pageStart} 안에 정보 전달
	public int getPageStart() {
		
		// page = (page-1)*10 같은거
		return (this.page-1)*perPageNum;
	}
	
	// #{perPageNum} 안에 정보전달
	public int getPerPageNum() {
		return perPageNum;
		
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", p_category=" + p_category + "]";
	}
	
	
}
