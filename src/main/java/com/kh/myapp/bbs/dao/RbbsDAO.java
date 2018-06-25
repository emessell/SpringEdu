package com.kh.myapp.bbs.dao;

import java.util.List;

import com.kh.myapp.bbs.dto.RbbsDTO;
import com.kh.myapp.util.RecordCriteria;

public interface RbbsDAO {
	
		// 댓글등록
		void write(RbbsDTO rbbsdto) throws Exception;
		// 요청한 페이지 댓글 가져오기
		List<RbbsDTO> list(Integer bnum,RecordCriteria recordCriteria) throws Exception;
		// 댓글 수정하기
		void modify(RbbsDTO rbbsDTO) throws Exception;
		// 댓글 삭제하기
		void delete(Integer rnum) throws Exception;
		// 원글 가져오기
		RbbsDTO replyView(Integer rnum) throws Exception;
		// 답글 등록하기
		void reply(RbbsDTO rbbsdto) throws Exception;
		// 전체 댓글 가져오기
		List<RbbsDTO> list(Integer bnum) throws Exception;
		// 좋아요 나빠요
		void goodOrBad(Integer rnum, String goodOrBad) throws Exception;
		// 댓글 총계
		Integer replyTotalRec(Integer bnum) throws Exception;
}
