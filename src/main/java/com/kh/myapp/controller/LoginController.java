package com.kh.myapp.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.myapp.login.service.LoginService;
import com.kh.myapp.member.vo.MemberVO;

@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	@Qualifier("loginServiceImplXML")
	LoginService loginService;
	
	
	
	@RequestMapping("/loginIn")
	public String logIn(Model model) {
		model.addAttribute("user",new MemberVO());
		return "login/login";
	}
	
	@RequestMapping("/memLoginOK")
	public String memLoginOK(@Valid @ModelAttribute("user") MemberVO user, BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "login/login";
		}
			//회원정보 가져오기
			MemberVO memberVO = loginService.getMember(user);
			if(memberVO != null) {
				//회원정보 세션에 담기
				model.addAttribute("user", memberVO);
				return "redirect:/";
			}else {
				return "login/login";
			}
	}
	
	//로그아웃 처리 부분
	@RequestMapping("/logOut")
	public String logOut(@ModelAttribute("user") MemberVO user, SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/"; 
	}
}
