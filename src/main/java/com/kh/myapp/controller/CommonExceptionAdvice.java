package com.kh.myapp.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice //현재 클래스가 컨트롤러에서 발생하는 exception을 전문적으로 처리해주는 클래스임을 알려주는 annotation.
public class CommonExceptionAdvice {
	
	@ExceptionHandler(Exception.class)
	private ModelAndView err(Exception e) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("err_exception");
		mav.addObject("exception",e);
		
		return mav;
		
	}
}