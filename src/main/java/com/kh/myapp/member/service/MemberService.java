package com.kh.myapp.member.service;

import java.util.ArrayList;

import com.kh.myapp.member.vo.MemberVO;

public interface MemberService {
	// 회원등록
	public void memberInsert(MemberVO memberVO);
	
	// 회원정보 가져오기
	public MemberVO getByMemberId(String id);
	
	// 회원목록 가져오기
	public ArrayList<MemberVO> getMemberList();
	
	// 회원정보 수정
	public void memberUpdate(MemberVO memberVO);
	
	// 회원정보 삭제
	public void memberDelete(String id);

	public ArrayList<MemberVO> getMemberAll();

}
