package com.kh.myapp.login.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.myapp.member.vo.MemberVO;

@Repository
public class LoginDAOImplJDBC implements LoginDAO {

	
	private JdbcTemplate jdbcTemplate;
	
//	JdbcTemplate 객체가 root-context.xml에 빈으로 등록되어 주석처리됨
//	@Autowired
//	public void setDataSource (DataSource dataSource) {
//		this.jdbcTemplate = new JdbcTemplate(dataSource);
//	}
	
	@Override
	public MemberVO getMember(MemberVO memberVO) {
		
		MemberVO memVO;
			StringBuffer str = new StringBuffer();
			str.append("select id, passwd, name, birth, phone, gender, cdate, udate from member ");
			str.append("where id = ?, and passwd = ? ");
			
			memVO = (MemberVO) this.jdbcTemplate.queryForObject(str.toString(),
					 new Object[] {memberVO.getId(), memberVO.getPasswd()},
					 new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
		
		return memVO;
	}

}
