package com.kh.myapp;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.myapp.member.dao.MemberDAOImplXML;
import com.kh.myapp.member.vo.MemberVO;

//@RunWith(SpringJUnit4ClassRunner.class) //junit4 버전 사용
@ExtendWith(SpringExtension.class) //junit5 버전 사용
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

public class MybatisTest {

	private static Logger logger = LoggerFactory.getLogger(DbConnTest.class);
	
	@Autowired
	@Qualifier("memberDAOImplXML")
	MemberDAOImplXML xml;
	
	@Test
	public void test() {
		MemberVO memberVO = xml.getMember("admin@kh.com");
		logger.info(memberVO.toString());
	}
}
