package com.kh.myapp;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DbConnTest {
	
	private static final Logger logger = LoggerFactory.getLogger(DbConnTest.class);
	
	@Autowired
	private DataSource ds;

	@Test
	public void test() throws SQLException {
		try(Connection con = ds.getConnection()) {
			logger.info("연결 성공");
			logger.trace("연결 성공");
			logger.debug("연결 성공");
			logger.warn("연결 성공");
			logger.error("연결 성공");
		} catch(Exception e) {
			logger.info("연결 오류");
			e.printStackTrace();
		}
	}
	
	@Autowired
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testSqlSessionFactory() { //SqlSessionFactory 접속여부 테스트
		logger.info(sqlFactory.toString());
	}
	
	@Test
	public void testSqlSessionTemplate() {
		try(SqlSession session = sqlFactory.openSession()){
			logger.info("SqlSession"+session.toString());
		}catch(Exception e) {
			logger.info("SqlSession 가져오기 실패.");
			e.printStackTrace();
		}
	}

}
