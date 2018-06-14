package com.kh.myapp;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.myapp.member.dao.MemberDAO;
import com.kh.myapp.member.vo.MemberVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class JdbcTemplateTest {

	private static final Logger logger = LoggerFactory.getLogger(DbConnTest.class);
	
	@Autowired
	@Qualifier("memberDAOImplXML")
	private MemberDAO memberDAO;
	
	@Test @Ignore
	public void test() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("admin119@kh.com");
		memberVO.setPasswd("1234");
		memberVO.setName("admin");
		memberVO.setBirth("930425");
		memberVO.setPhone("01012345678");
		memberVO.setGender("M");
		memberDAO.insert(memberVO);
		
	}
	
	@Autowired
	DefaultListableBeanFactory df;
	@Test
	public void beans() {
		for(String name : df.getBeanDefinitionNames()) {
			logger.info(name+"\t"+df.getBean(name).getClass().getName());
		}
	}
}
