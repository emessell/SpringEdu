package com.kh.myapp.member.dao;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.member.vo.MemberVO;

@Repository
public class MemberDAOImplXML implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO memberVO) {
		sqlSession.insert("memberInsert",memberVO);
	}
	
	@Override
	public MemberVO getMember(String id) {
		MemberVO memberVO = sqlSession.selectOne("getByMemberId",id);
		return memberVO;
	}
	
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> list = sqlSession.selectList("getMemberList");
		return list;
	}
	
	@Override
	public void update(MemberVO memberVO) {
		sqlSession.update("memberUpdate",memberVO);
	}
	
	@Override
	public void delete(String id) {
		sqlSession.delete("memberDelete",id);
	}
	
	@Override
	public void setDataSource(DataSource dataSource) {
	}

	@Override
	public String findId(String name, String phone) {
		return sqlSession.getMapper(MemberDAO.class).findId(name, phone);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		return sqlSession.getMapper(MemberDAO.class).findPw(id, name, phone);
	}
}
