package com.kh.myapp.bbs.dao;

import java.util.List;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.RecordCriteria;

public interface BbsDAO {
   
	//글쓰기
	public void write(BbsDTO bbsdto) throws Exception;
	//전체 글 목록 가져오기
	public List<BbsDTO> listAll() throws Exception;
	//페이징 한 목록
	public List<BbsDTO> list(RecordCriteria recordCriteria) throws Exception;
	//글 보여주기
	public BbsDTO view(int bnum) throws Exception;
	//글 수정하기
	public void modify(BbsDTO bbsdto) throws Exception;
	//글 삭제
	public void delete(int bnum) throws Exception;
	//원글 읽어오기
	public BbsDTO replyView(int bnum) throws Exception;
	//답글 등록하기
	public void reply(BbsDTO bbsdto) throws Exception;
	//리스트 카운트
	public int totalRec() throws Exception;
	//검색한 글목록가져오기
	List<BbsDTO> searchList(FindCriteria findCriteria) throws Exception;
	//검색한 글 전체 수 가져오기
	int getSearchListCount(FindCriteria findCriteria) throws Exception;
}