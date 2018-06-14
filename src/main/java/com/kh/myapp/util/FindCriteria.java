package com.kh.myapp.util;

public class FindCriteria extends RecordCriteria {
	private String searchType;	// 검색타입
	private String keyword;	// 검색단어
	
	public FindCriteria() {	//
	}
	

	public FindCriteria(int reqPage, String searchType, String keyword) {
		super(reqPage);
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	public String getsearchType() {
		return searchType;
	}

	public void setsearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getkeyword() {
		return keyword;
	}

	public void setkeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "FindCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}