package com.kh.myapp.bbs;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.myapp.bbs.dao.BbsDAO;
import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.RecordCriteria;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class BbsTest {

	private static Logger logger = LoggerFactory.getLogger(BbsTest.class);
	
	@Autowired
	@Qualifier("bbsDAOImplXML")
	BbsDAO bbsdao;
	
//	@Ignore 4 버전
//	@Disabled 5 버전
	
	@Disabled
	@Test
	void insert() throws Exception {
		BbsDTO bbsdto = new BbsDTO();
		bbsdto.setBtitle("mybatis test222");
		bbsdto.setBname("mybatis2");
		bbsdto.setBhit(1);
		bbsdto.setBcontent("게시글 생성2");
		bbsdto.setBgroup(2000);
		bbsdto.setBstep(1);
		bbsdto.setBindent(1);
		bbsdao.write(bbsdto);
	}
	
	@Disabled
	@Test
	void list() throws Exception {
		List<BbsDTO> list;
		list = bbsdao.listAll();
		logger.info("목록 수 : "+list);
	}

	@Disabled
	@Test
	void view() throws Exception {
		BbsDTO bbsdto = bbsdao.view(1406);
		logger.info("게시글 가져오기: "+bbsdto.toString());
	}
	
	@Disabled
	@Test
	void modify() throws Exception {
		BbsDTO bbsdto = new BbsDTO();
		bbsdto.setBtitle("11바뀐제목");
		bbsdto.setBcontent("11바뀐내용");
		bbsdto.setBnum(1406);
		bbsdao.modify(bbsdto);
	}
	
	@Disabled
	@Test
	void delete() throws Exception {
		bbsdao.delete(1407);
	}
	
	@Disabled
	@Test
	void reply() throws Exception {
		BbsDTO bbsdto = new BbsDTO();
		bbsdto.setBtitle("답글");
		bbsdto.setBname("나나");
		bbsdto.setBhit(87);
		bbsdto.setBcontent("답글");
		bbsdto.setBgroup(14628);
		bbsdto.setBstep(1);
		bbsdto.setBindent(1);
		bbsdao.reply(bbsdto);
	}
	
	@Disabled
	@Test
	void replyView() throws Exception {
		logger.info(bbsdao.replyView(14658).toString());
	}
	
	@Disabled
	@Test
	void totalRec() throws Exception {
		System.out.println("total Record: "+bbsdao.totalRec());
	}
	
	@Disabled
	@Test
	void searchList() throws Exception {
		List<BbsDTO> list = null;
		FindCriteria findCriteria = new FindCriteria(1,"T","제목");
		list = bbsdao.searchList(findCriteria);
		logger.info(list.toString());
	}
	
	@Disabled
	@Test
	void getSearchListCount() throws Exception {
		FindCriteria findCriteria = new FindCriteria();
		findCriteria.setsearchType("TC");
		findCriteria.setkeyword("제목");
		logger.info("검색 건수"+bbsdao.getSearchListCount(findCriteria));
	}
	
	@Disabled
	@Test
	void list_test() throws Exception{
		List<BbsDTO> list;
		RecordCriteria rc = new RecordCriteria(1, 10);
		list = bbsdao.list(rc);
		logger.info("시작 레코드:"+rc.getStartRecord()+", 종료 레코드:"+rc.getEndRecord());
		logger.info("목록 수: "+list.size());
	}
	
}
