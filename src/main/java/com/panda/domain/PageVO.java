package com.panda.domain;

public class PageVO {
	
	// 하단부 페이징처리에 필요한 객체 정보
	// startPage, endPage, prev, next
	// totalCount(DB)
	// Cri - [page, perPageNum]
	// displayPageNum (페이지블럭)
	
	private int startPage;
	private int endPage;
	private int totalCount;
	private boolean prev;
	private boolean next;
	private int tmpEndpage;
	
	private Criteria cri;
	
	private int displayPageNum = 10;
	/////////////////////////////////////////////////////////////////////////////
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public void calcData() {
		// 페이징처리 하단부에 필요한 정보를 계산하는 메서드
		System.out.println(" calcData() - 시작");
		
		// endPage 
		endPage
			= (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		// startPage
		startPage
			= (endPage - displayPageNum)+1;
		
		// prev
		prev = (startPage == 1)? false:true;
		
		// totalCount(DB)
		// endPage	(전체 글개수가 endPage만큼 없을경우)
		// 글개수에 맞는 페이지수 계산
		tmpEndpage = (int)Math.ceil((totalCount/(double)cri.getPerPageNum()));
		
		if(endPage > tmpEndpage) {
			endPage = tmpEndpage;
		}
		
		// next
		next = (endPage * cri.getPerPageNum()) >= totalCount? false:true;
		
		
	}// calcData()
	
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

	public int getTotalCount() {
		return totalCount;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getCri() {
		return cri;
	}


	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", totalCount=" + totalCount + ", prev="
				+ prev + ", next=" + next + ", cri=" + cri + ", displayPageNum=" + displayPageNum + "]";
	}
	
	
	
	
}
