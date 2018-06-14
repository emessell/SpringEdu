package com.kh.myapp.bbs.dao;

import java.util.List;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.PageCriteria;

public interface BbsDAO {
   
	//글쓰기
	public void write(BbsDTO bbsdto);
	//글목록 가져오기
	public List<BbsDTO> list_2();
	//페이징
	public List<BbsDTO> list(PageCriteria pageCriteria);
	//글 보여주기
	public BbsDTO view(int bNum);
	//글 수정하기
	public void modify(BbsDTO bbsdto);
	//글 삭제
	public void delete(int bNum);
	//원글 읽어오기
	public BbsDTO replyView(int bNum);
	//답글 등록하기
	public void reply(BbsDTO bbsdto);
	//원글 읽어오기
	public List<BbsDTO> pagelist();
	//리스트 카운트
	public int totalRec();
	// 검색한 글목록가져오기
	List<BbsDTO> searchList(FindCriteria findCriteria);
	// 검색한 글 전체 수 가져오기
	int getSearchListCount(FindCriteria findCriteria);
}