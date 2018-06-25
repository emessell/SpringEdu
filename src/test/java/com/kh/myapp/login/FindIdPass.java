package com.kh.myapp.login;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.myapp.member.dao.MemberDAO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class FindIdPass {

	private static Logger logger = LoggerFactory.getLogger(FindIdPass.class);
	
	/*@Autowired
	@Qualifier("loginDAOImplXML")
	LoginDAO loginDAO;
	
	@Test
	void test() {
		LoginVO loginVO = new LoginVO();
		loginVO.setId("admin@kh.com");
		loginVO.setPasswd("1234");
		logger.info("넣은것 : "+loginVO.toString());
		logger.info("나와야할것 : "+loginDAO.getMember(loginVO));
	}*/

	@Autowired
	@Qualifier("memberDAOImplJDBC")
	MemberDAO memberDAO;
	
	@Test
	void ID() {
		String id = memberDAO.findId("1234", "1234");
		logger.info("id = "+id);
		String passwd = memberDAO.findPw("kh@kh.com", "1234", "1234");
		logger.info("passwd = "+passwd);
	}
	
	@Autowired
	@Qualifier("memberDAOImplXML")
	MemberDAO memberDAOXML;
	
	@Test
	void ID2() {
		String id = memberDAOXML.findId("1234", "1234");
		logger.info("id = "+id);
		String passwd = memberDAOXML.findPw("kh@kh.com", "1234", "1234");
		logger.info("passwd = "+passwd);
	}
	
}
