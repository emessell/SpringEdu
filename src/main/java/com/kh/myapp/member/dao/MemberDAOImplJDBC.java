package com.kh.myapp.member.dao;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.myapp.member.vo.MemberVO;

@Repository
public class MemberDAOImplJDBC implements MemberDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource (DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	@Override
	public void insert(MemberVO memberVO) {
		StringBuffer str = new StringBuffer();
		str.append("insert into member (id, passwd, name, birth, phone, gender) ");
		str.append("values(?,?,?,?,?,?) ");
		this.jdbcTemplate.update(
				str.toString()
				,memberVO.getId()
				,memberVO.getPasswd()
				,memberVO.getName()
				,memberVO.getBirth()
				,memberVO.getPhone()
				,memberVO.getGender()
				);
	}

	@Override
	public MemberVO getMember(String id) {
		MemberVO memberVO = new MemberVO();
		StringBuffer str = new StringBuffer();
		str.append("select id, passwd from member where id = ?");
		
		memberVO = (MemberVO)this.jdbcTemplate.queryForObject(str.toString(), new Object[] {id}, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
		return memberVO;
	}

	@Override
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select * from member");
		
		list = (ArrayList<MemberVO>) this.jdbcTemplate.query(sql.toString(), new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
		
		return list;
	}

	@Override
	public void update(MemberVO memberVO) {
		StringBuffer sql = new StringBuffer();
		sql.append("update member set ");
		sql.append("passwd = ? , name = ?, birth = ?, phone = ?, gender = ? ");
		sql.append("where id = ?");
		
		this.jdbcTemplate.update(sql.toString(), memberVO.getPasswd(), memberVO.getName(),
				memberVO.getBirth(), memberVO.getPhone(), memberVO.getGender(), memberVO.getId());
	}

	@Override
	public void delete(String id) {
			this.jdbcTemplate.update("delete from member where id = ?", id);
	}

}
