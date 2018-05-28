package com.kh.myapp;

import java.util.ArrayList;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.myapp.member.service.MemberService;
import com.kh.myapp.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
@SessionAttributes("memberVO")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;

	@RequestMapping("/memberJoin")
	public void memberJoin(Model model) {
		model.addAttribute("memberVO", new MemberVO());
	}

	@RequestMapping(value = "/memberJoinOK", method = RequestMethod.POST)
	public String memberJoinOK(@Valid MemberVO memberVO, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("회원가입시 오류 발생");
			return "/member/memberJoin";
		} else {
			memberService.memberInsert(memberVO);
			logger.info("회원가입 완료");
		}
		return "redirect:/member/memberList";
	}

	@RequestMapping(value="/memberModify/{id:.+}")
	public String membermodify(@PathVariable String id, Model model) {
		System.out.println("아이디"+id);
		logger.info("아이디"+id);
	    model.addAttribute("memberVO",memberService.getByMemberId(id));
	   return "/member/memberModify";
	}
	
	@RequestMapping(value="memberModifyOK")
		public String memberModifyOK(@Valid MemberVO memberVO, BindingResult result) {
			if(result.hasErrors()) {
				return "/member/memberModify";
			}else {
				memberService.memberUpdate(memberVO);
				return "redirect:/member/memberList";
			}
		}
	
	@RequestMapping(value="/memberDelete/{id:.+}")
		public String memberDelete(@PathVariable String id, Model model) {
			if(memberService.getByMemberId(id) != null) {
				memberService.memberDelete(id);
			}else {
				
			}
			return "redirect:/member/memberList";
	}
	
	@RequestMapping(value = "/memberList")
	public String memberList(Model model) {
		ArrayList<MemberVO> alist = memberService.getMemberAll();
		model.addAttribute("memberVOS",alist);
		logger.info("memberList?id");
		return "/member/memberList";
	}

}
