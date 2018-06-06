package com.kh.myapp;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.myapp.login.service.LoginService;
import com.kh.myapp.login.vo.LoginVO;
import com.kh.myapp.member.vo.MemberVO;

@ExtendWith(SpringExtension.class) //junit5 버전 사용
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

public class LoginTest {
	
	private static Logger logger = LoggerFactory.getLogger(LoginTest.class);
	
	@Autowired
	@Qualifier("loginServiceImplXML")
	LoginService loginService;
	
	
	@Test
	public void member() {
		LoginVO loginVO = new LoginVO();
		loginVO.setId("admin@kh.com");
		loginVO.setPasswd("1234");
		MemberVO memVO = loginService.getMember(loginVO);
		logger.info(memVO.toString());
	}
	
	//빈 등록정보 확인
	@Autowired
	DefaultListableBeanFactory df;
	
	@Test
	public void beans() {
		for(String name: df.getBeanDefinitionNames()) {
			logger.info(name + "\t" + df.getBean(name).getClass().getName());
		}
	}

}
