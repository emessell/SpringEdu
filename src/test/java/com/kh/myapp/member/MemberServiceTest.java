package com.kh.myapp.member;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.myapp.DbConnTest;
import com.kh.myapp.member.service.MemberService;
import com.kh.myapp.member.vo.MemberVO;

// 테스트환경
@RunWith(SpringJUnit4ClassRunner.class) //  Runwith : 환경을 가져가겠다 .여기선 스프링프레임워크에서 테스트하는 환경을 가져가겠다는 말임.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })	// 이걸로 인해서 스프링프레임워크를 실행을 안해도 테스트 할 수 있음
// -----------
public class MemberServiceTest {

	private static Logger Logger = LoggerFactory.getLogger(DbConnTest.class);
	
	@Autowired
	@Qualifier("memberServiceImplXML")
	MemberService memberService;	// 컨테이너상에서는 memberSerivceImpl이 올라갔지만 상위타입으로 받을 수 있음ㅎㅎㅎㅎ 
	
	@Test
	public void test() {
		MemberVO memberVO = memberService.getByMemberId("admin111@kh.com");
		Logger.info(memberVO.toString());
	}
}