package com.kh.semiteam3.vo;

public class PageVO {
	private String column, keyword;//검색항목, 키워드
	private int count;//전체 전체 개수(여기서는 글 수인거지)
	private int page = 1;//현재 페이지
	private int size = 10;//한 페이지에 보여줄 게시글 개수
	private int blockSize = 10;//블럭 표시 개수
	
	
	public PageVO() {
		super();
	}
	
	
	public String getColumn() {
		if(column == null) return"";
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getKeyword() {
		if(keyword == null) return"";
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	//계산을 위한 가상의 Getter 메소드 추가
	public boolean isSearch() {
		return column != null && keyword != null;
	}
	public int getBeginRow() {
		//return getEndRow() - (page-1);
		return page * size - (size-1);
	}
	public int getEndRow() {
		return page * size;
	}
	
	public int getTotalPage() {//전체페이지
		return (count-1)/size+1;
	}
	public int getBeginBlock() {
		
		return (page-1) / blockSize * blockSize + 1;
		
	}
	public int getEndBlock() {
		int number = (page-1) / blockSize * blockSize + blockSize;
		return Math.min(getTotalPage(), number);//맥스 아녀?
	}
	//*논리 반환값을 가지는 Getter메소드는 get이 아니라 is로 시작한다
	public boolean isFirstBlock() {//첫번째 블록이냐
		return getBeginBlock() == 1;
	}
	public boolean isLastBlock() {
		return getEndBlock() == getTotalPage();
	}
	
	//물으표 뒤에 붙는 데이터 중 공통된 부분 (size, column, keyword)에 대한 문자열/페이지는 바뀌는거니깐 여기서 고정해줄수는 없어
	public String getQueryString() {
		return "size="+size+"&column="+getColumn()+"&keyword="+getKeyword();
	}
	public int getPrevBlock() {
		return getBeginBlock()-1;
	}
	public int getNextBlock() {
		return getEndBlock() +1;
	}
	
	public boolean isCurrentPage(int i) {
		return page == i;
	}
	
	
}
