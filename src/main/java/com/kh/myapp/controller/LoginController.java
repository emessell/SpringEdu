package com.kh.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.myapp.login.service.LoginService;
import com.kh.myapp.login.vo.LoginVO;
import com.kh.myapp.member.dao.MemberDAO;
import com.kh.myapp.member.vo.MemberVO;

@Controller
@RequestMapping("/login")
@SessionAttributes("login")
public class LoginController {
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	@Qualifier("loginServiceImplXML")
	LoginService loginService;
	
	@Autowired
	@Qualifier("memberDAOImplXML")
	MemberDAO memberDAO;
	
	//로그인 화면 보여주기
	@RequestMapping("/login")
	public String securityLogin(Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!auth.getPrincipal().equals("anonymousUser")) {
			logger.info("인증 : "+auth.getPrincipal());
			return "redirect:/";
		}
		model.addAttribute("findId", new MemberVO());
		model.addAttribute("findPw", new MemberVO());
		return "login/login";
	}
	
	//로그인 처리 부분
	@RequestMapping("/memLoginOK")
	public String memLoginOK(@Valid @ModelAttribute("login") LoginVO login, BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "login/login";
		}
			//회원정보 가져오기
			MemberVO memberVO = loginService.getMember(login);
			if(memberVO != null) {
				//회원정보 세션에 담기
				model.addAttribute("login", memberVO);
				return "redirect:/"; //redirect 방식
			}else {
				return "login/login"; //forward 방식, 아무것도 안써도 됨. "forward:/login/login";로 써도 됨.
			}
	}
	
	//로그아웃 처리 부분
	@RequestMapping(value="/logOut",method=RequestMethod.GET)
	public String logOut(HttpServletRequest request,HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/"; 
	}
	
	//회원가입
	@RequestMapping("/memberJoin")
	public void memberJoin(Model model) {
		model.addAttribute("memberVO", new MemberVO());
	}
}
