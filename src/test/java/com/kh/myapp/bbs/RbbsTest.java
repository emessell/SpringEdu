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

import com.kh.myapp.bbs.dao.RbbsDAO;
import com.kh.myapp.bbs.dto.RbbsDTO;
import com.kh.myapp.util.RecordCriteria;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class RbbsTest {

	private static Logger logger = LoggerFactory.getLogger(RbbsTest.class);
	
	@Autowired
	@Qualifier("rbbsDAOImplXML")
	RbbsDAO rbbsdao;
	
	@Disabled
	@Test
	void write() throws Exception {
		RbbsDTO rbbsdto = new RbbsDTO();
		rbbsdto.setBnum(14674);
		rbbsdto.setRid("아이디3");
		rbbsdto.setRname("댓글러2");
		rbbsdto.setRcontent("댓글2");
		rbbsdto.setRgroup(14674);
		rbbsdto.setRstep(1);
		rbbsdto.setRindent(1);
		rbbsdao.write(rbbsdto);
	}
	
	@Disabled
	@Test
	void listAll() throws Exception {
		List<RbbsDTO> list;
		list = rbbsdao.list(14674);
		logger.info("목록 수 : "+list.size());
	}
	
//	@Disabled
	@Test
	void list() throws Exception {
		RecordCriteria rc = new RecordCriteria(1,10);
		List<RbbsDTO> list = null;
		
		list = rbbsdao.list(14674, rc);
		logger.info(list.toString());
	}
	
	@Disabled
	@Test
	void modify() throws Exception {
		RbbsDTO rbbsDTO = new RbbsDTO();
		rbbsDTO.setRcontent("수정했다.");
		rbbsDTO.setRnum(7853);
		rbbsdao.modify(rbbsDTO);
		logger.info("수정 후 : "+ rbbsDTO);
	}
	
	@Disabled
	@Test
	void delete() throws Exception {
		rbbsdao.delete(7851);
	}
	
	@Disabled
	@Test
	void replyView() throws Exception {
		rbbsdao.replyView(7853);
		logger.info(rbbsdao.replyView(7853).toString());
	}
	
	@Disabled
	@Test
//	#{bnum},#{rid},#{rname},#{rcontent},#{rgroup},#{rstep},#{rindent}
	void reply() throws Exception {
		RbbsDTO rbbsdto = new RbbsDTO();
		
		rbbsdto.setRnum(7855);
		rbbsdto.setRid("admin@kh.com");
		rbbsdto.setRname("5454");
		rbbsdto.setRcontent("답글에 답글달기");
		logger.info(rbbsdto.toString());
		rbbsdao.reply(rbbsdto);
	}
	
	@Disabled
	@Test
	void goodOrBad() throws Exception {
		rbbsdao.goodOrBad(7856,"good");
	}
	
	@Disabled
	@Test
	void replyTotalRec() throws Exception {
		logger.info("댓글 총계 : "+rbbsdao.replyTotalRec(14674));
	}
	
}