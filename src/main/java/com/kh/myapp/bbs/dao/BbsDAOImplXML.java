package com.kh.myapp.bbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.RecordCriteria;

@Repository
public class BbsDAOImplXML implements BbsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(BbsDTO bbsdto)  throws Exception {
		sqlSession.insert("bbsdao.insert", bbsdto);
	}

	@Override
	public List<BbsDTO> listAll()  throws Exception {
		return sqlSession.selectList("bbsdao.list");
	}

	@Override
	public List<BbsDTO> list(RecordCriteria recordCriteria)  throws Exception {
		return sqlSession.selectList("bbsdao.listPageCri", recordCriteria);
	}

	@Override
	public BbsDTO view(int bnum)  throws Exception {
		updateHit(bnum);
		System.out.println("view: ");
		return sqlSession.selectOne("bbsdao.view", bnum);
	}

	@Override
	public void modify(BbsDTO bbsdto)  throws Exception {
		sqlSession.update("bbsdao.modify", bbsdto);
	}

	@Override
	public void delete(int bnum)  throws Exception {
		sqlSession.delete("bbsdao.delete",bnum);
	}

	@Override
	public BbsDTO replyView(int bnum)  throws Exception {
		return sqlSession.selectOne("bbsdao.replyView", bnum);
	}

	@Override
	public void reply(BbsDTO bbsdto)  throws Exception {
		
		updateStep(bbsdto);
		bbsdto.setBhit(0);
		bbsdto.setBstep(bbsdto.getBstep()+1);
		bbsdto.setBindent(bbsdto.getBindent()+1);
		sqlSession.insert("bbsdao.reply", bbsdto);
	}
	
	private void updateStep(BbsDTO bbsdto) {
		sqlSession.update("bbsdao.updateStep",bbsdto);
	}
	
	@Override
	public int totalRec() throws Exception{
		return sqlSession.selectOne("bbsdao.totalRec");
	}
	
	//검색한 글 목록 가져오기
	@Override
	public List<BbsDTO> searchList(FindCriteria findCriteria)  throws Exception {
		return sqlSession.selectList("listFindCri", findCriteria);
	}

	@Override
	public int getSearchListCount(FindCriteria findCriteria)  throws Exception {
		return sqlSession.selectOne("searchTotalRec", findCriteria);
	}
	
	//update hit
	private void updateHit(int bnum) throws Exception{
		sqlSession.update("bbsdao.hit", bnum);
		System.out.println("조회수: ");
	}
	

}
