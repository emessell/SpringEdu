package com.kh.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.myapp.member.dao.MemberDAO;
import com.kh.myapp.member.service.MemberService;
import com.kh.myapp.member.vo.MemberVO;

@RestController // 리소스(데이터) 자체를 반환하는데 사용(Json, XML, 문자열)
@Controller
@RequestMapping("/rest")
public class RestfullController {
	
	@Autowired
	@Qualifier("memberServiceImplXML")
	MemberService ms;
	
	@Autowired
	@Qualifier("memberDAOImplXML")
	MemberDAO memberDAO;
	
	@RequestMapping("/hello")
	public String Hello() {
		return "hleo";
	}
	
	@RequestMapping("/member")
	public MemberVO member(@RequestParam String id) {
		MemberVO memberVO = null;
		memberVO = ms.getByMemberId(id);
		return memberVO;
	}
	
//	@RequestMapping(value="/member1",method=RequestMethod.GET,produces = "application/json")
//	public MemberVO member2(@RequestParam String id) {
//		MemberVO memberVO = null;
//		memberVO = ms.getByMemberId(id);
//		return memberVO;
//	}
	
	@RequestMapping(value="/member2",method=RequestMethod.GET,produces = "application/json")
	public MemberVO member2(@RequestParam String id) {
		MemberVO memberVO = null;
		memberVO = ms.getByMemberId(id);
		System.out.println(memberVO.toString());
		return memberVO;
	}
	
	@RequestMapping(value ="/member/{id:.+}", method = RequestMethod.GET)
	   public MemberVO member(HttpServletRequest request) {
	      
		String id = request.getParameter("id");
	      MemberVO memberVO = null;
	      memberVO = ms.getByMemberId(id);
	      
	      return memberVO;
	   }
	
	   @RequestMapping(value="/memberList", method=RequestMethod.GET)
	   public List<MemberVO> memberList() {
	      List<MemberVO> list = new ArrayList<>();
	      MemberVO memberVO = new MemberVO();
	      memberVO.setId("admin@kh.com");
	      memberVO.setPasswd("1234");
	      memberVO.setName("홍길동");
	      memberVO.setPhone("01012345678");
	      list.add(memberVO);
	      
	      return list;
	   }
	   
	   @RequestMapping("/memberMap")
	   public Map<Integer, MemberVO> memberMap(){
		   Map<Integer, MemberVO> map = new HashMap<>();
		   
		   for(int i=0; i<10; i++) {
			   MemberVO mvo = new MemberVO();
			   mvo.setId("admin"+i+"@kh.com");
			   mvo.setPasswd(i+"234");
			   mvo.setName("홍길동"+i);
			   mvo.setPhone(i+"123456789");
			   map.put(i+1, mvo);
		   }
		   return map;
	   }
	   
	   @RequestMapping("/array")
	   public String[] array() {
		   
		   String[] str = new String[] {"홍길동","홍길동","홍길동","홍길동","홍길동","홍길동",};
		   
		return str;
	   }
	   
	   
	 //아이디 찾기
	 		@RequestMapping("/findIdOK")
	 		public String findId(@ModelAttribute("find") MemberVO member,BindingResult result,Model model) {
	 			String name = member.getName();
	 			String phone = member.getPhone();
	 			
	 			String id = memberDAO.findId(name, phone);
	 			model.addAttribute("findId",id);
	 			System.out.println("아이디 : "+id);
	 			return id;
	 			
	 		}
	 	
	 	//비밀번호 찾기
	 	@RequestMapping("/findPwOK")
	 	public String findPw(@ModelAttribute("find") MemberVO member,BindingResult result,Model model) {
	 		String id = member.getId();
	 		String name = member.getName();
	 		String phone = member.getPhone();
	 		System.out.println(id+name+phone);
	 		String pw = memberDAO.findPw(id,name, phone);
	 		model.addAttribute("findPw",pw);
	 		System.out.println("비밀번호 : "+pw);
	 		return pw;
	 		
	 	}
}

