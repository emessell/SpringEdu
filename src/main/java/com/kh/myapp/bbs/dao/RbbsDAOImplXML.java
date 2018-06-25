package com.kh.myapp.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.bbs.dto.RbbsDTO;
import com.kh.myapp.util.RecordCriteria;

@Repository
public class RbbsDAOImplXML implements RbbsDAO {
	
	private static Logger logger = LoggerFactory.getLogger(RbbsDAOImplXML.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	// 댓글등록
	@Override
	public void write(RbbsDTO rbbsdto) throws Exception {
		sqlSession.insert("rbbsdao.write", rbbsdto);
	}
	// 전체 댓글 가져오기
	@Override
	public List<RbbsDTO> list(Integer bnum) throws Exception {
		return sqlSession.selectList("rbbsdao.listAll",bnum);
	}
	// 요청한 페이지 댓글 가져오기
	@Override
	public List<RbbsDTO> list(Integer bnum,RecordCriteria recordCriteria) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("bnum", bnum);
		map.put("recordCriteria", recordCriteria);
		return sqlSession.selectList("rbbsdao.list", map);
	}
	// 댓글 수정하기
	@Override
	public void modify(RbbsDTO rbbsDTO) throws Exception {
		sqlSession.update("rbbsdao.update",rbbsDTO);
	}
	// 글삭제하기
	@Override
	public void delete(Integer rnum) throws Exception {
		sqlSession.delete("rbbsdao.delete",rnum);
	}
	// 원글 가져오기
	@Override
	public RbbsDTO replyView(Integer rnum) throws Exception {
		return sqlSession.selectOne("rbbsdao.replyView", rnum);
	}
	// 답글 등록하기
	@Override
	public void reply(RbbsDTO rbbsdto) throws Exception {
		// 댓글의 원글의 정보 가져오기
		RbbsDTO rbbsOrgDTO = replyView(Integer.valueOf(rbbsdto.getRnum()));
		// 이전 댓글 Step up
		updateStep(rbbsOrgDTO.getRgroup(), rbbsOrgDTO.getRstep());
		
		rbbsdto.setBnum(rbbsOrgDTO.getBnum());
		rbbsdto.setRgroup(rbbsOrgDTO.getRgroup());
		rbbsdto.setRstep(rbbsOrgDTO.getRstep()+1);
		rbbsdto.setRindent(rbbsOrgDTO.getRindent()+1);
		
		sqlSession.insert("rbbsdao.reply",rbbsdto);
	}
	// Update Step
	private void updateStep(Integer rgroup, Integer rstep) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rgroup", rgroup);
		map.put("rstep", rstep);
		sqlSession.update("rbbsdao.updateStep", map);
	}
	// 좋아요 나빠요
	@Override
	public void goodOrBad(Integer rnum, String goodOrBad) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rnum", rnum);
		map.put("goodOrBad", goodOrBad);
		sqlSession.update("rbbsdao.goodOrBad", map);
	}
	// 댓글 총계
	@Override
	public Integer replyTotalRec(Integer bnum) throws Exception {
		return sqlSession.selectOne("rbbsdao.replyTotalRec",bnum);
	}
	
}
	

