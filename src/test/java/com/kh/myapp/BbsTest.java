package com.kh.myapp;

import java.util.List;

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

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class BbsTest {

	private static Logger logger = LoggerFactory.getLogger(BbsTest.class);
	
	@Autowired
	@Qualifier("bbsDAOImplXML")
	BbsDAO bbsdao;
	
	
	/*@Test
	void insert() {
		BbsDTO bbsdto = new BbsDTO();
		bbsdto.setBTitle("mybatis test2");
		bbsdto.setBName("mybatis2");
		bbsdto.setBHit(1);
		bbsdto.setBContent("게시글 생성2");
		bbsdto.setBGroup(2000);
		bbsdto.setBStep(1);
		bbsdto.setBIndent(1);
		bbsdao.write(bbsdto);
	}*/
	
	
	/*@Test
	void list() {
		List<BbsDTO> list;
		list = bbsdao.list_2();
		logger.info("목록 수 : "+list.size());
	}*/

	
	/*@Test
	void view() {
		BbsDTO bbsdto = bbsdao.view(1406);
		logger.info("게시글 가져오기: "+bbsdto.toString());
	}*/
	
	/*@Test
	void modify() {
		BbsDTO bbsdto = new BbsDTO();
		bbsdto.setBTitle("11바뀐제목");
		bbsdto.setBContent("11바뀐내용");
		bbsdto.setBNum(1406);
		bbsdao.modify(bbsdto);
	}*/
	
	/*@Test
	void delete() {
		bbsdao.delete(1407);
	}*/
	
	/*@Test
	void reply() {
		BbsDTO bbsdto = new BbsDTO();
		bbsdto.setBTitle("답글");
		bbsdto.setBName("나나");
		bbsdto.setBHit(87);
		bbsdto.setBContent("답글");
		bbsdto.setBGroup(0);
		bbsdto.setBStep(0);
		bbsdto.setBIndent(0);
		bbsdao.reply(bbsdto);
	}*/
	
	@Test
	void replyView() {
		logger.info(bbsdao.replyView(14628).toString());
	}
	
}









