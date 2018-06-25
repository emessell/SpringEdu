package com.kh.myapp.login;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.myapp.member.vo.MemberVO;

@ExtendWith(SpringExtension.class) //junit5 버전 사용
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/test.xml" })

public class LoginTest2 {
	
	private static Logger logger = LoggerFactory.getLogger(LoginTest2.class);
	
	@Autowired
	@Qualifier("setterMethod")
	MemberVO setterMethod;
	
	@Test
	public void setter(){
		logger.info(setterMethod.toString());
	}
	
	@Autowired
	@Qualifier("Contructor")
	MemberVO asdf;
	
	@Test
	public void setter2(){
		logger.info(asdf.toString());
	}
	

}
