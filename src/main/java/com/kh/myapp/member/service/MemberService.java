package com.kh.myapp.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.myapp.member.vo.MemberVO;

public interface MemberService {
	// 회원등록
	public void memberInsert(MemberVO memberVO);
	
	// 회원정보 가져오기
	public MemberVO getByMemberId(String id);
	
	// 회원목록 가져오기
	public List<MemberVO> getMemberList();
	
	// 회원정보 수정
	public void memberUpdate(MemberVO memberVO);
	
	// 회원정보 삭제
	public void memberDelete(String id);
	
	// 아이디 찾기
	public String findId(String name, String phone);
		
	// 비밀번호 찾기
	public String findPw(String id, String name, String phone);

}
