package com.kh.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/")
	public String main() {
		return "index";
	}
	
	@RequestMapping(value="/hello")
	public String main2() {
		return "hello";
	}
	
	@RequestMapping(value="/hello2")
	public String main3() {
		return "hello2";
	}
}