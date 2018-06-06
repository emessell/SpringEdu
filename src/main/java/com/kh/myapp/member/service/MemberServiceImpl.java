package com.kh.myapp.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.myapp.member.dao.MemberDAO;
import com.kh.myapp.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired // 이건 타입으로 찾아주는거임. 그래서 컨테이너에 같은 타입의 다른아이..?가 있으면 오류남... 그래서 아이디로 찾아주는걸 덧붙이는게 나음
	@Qualifier("memberDAOImplJDBC")	// 이게 아이디로 찾아주는거... Autowired로 MemberDAO타입을 찾고, Qualifier로 memberDAO아이디를 찾아서 매핑해줌
	MemberDAO memberDAO;
	
	@Override
	public void memberInsert(MemberVO memberVO) {
		memberDAO.insert(memberVO);
	}

	@Override
	public MemberVO getByMemberId(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public void memberUpdate(MemberVO memberVO) {
		memberDAO.update(memberVO);
	}

	@Override
	public void memberDelete(String id) {
		memberDAO.delete(id);
	}

	@Override
	public String findId(String name, String phone) {
		return memberDAO.findId(name, phone);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		return memberDAO.findPw(id, name, phone);
	}

}