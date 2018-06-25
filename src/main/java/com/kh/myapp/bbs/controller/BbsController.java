package com.kh.myapp.bbs.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.bbs.service.BbsService;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.PageCriteria;
import com.kh.myapp.util.RecordCriteria;

@Controller
@RequestMapping("/bbs")
public class BbsController {

	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@Autowired
	@Qualifier("bbsServiceImplXML")
	private BbsService bs;
	
	//글쓰기 페이지 이동
	@RequestMapping(value="/write",method=GET)
	public void writeGet(BbsDTO bbsdto, Model model) throws Exception {
		logger.info("write GeT...");
	}
	
	//게시글 등록
	@RequestMapping(value="/write",method=POST)
	public String writePost(BbsDTO bbsdto, Model model) throws Exception{
		logger.info("write POST...");
		logger.info(bbsdto.toString());
		bs.write(bbsdto);
		return "redirect:/bbs/list";
	}
	
	//전체 게시글 목록
	@RequestMapping(value="/listAll",method=GET)
	public void listAll(Model model) throws Exception{
		model.addAttribute("listAll", bs.listAll());
	}
	
	//글 보기
	@RequestMapping(value="/view",method=GET)
	public void view(@RequestParam int bnum,Model model) throws Exception {
		model.addAttribute("view", bs.view(bnum));
	}
	
	//게시글 수정 form 이동
	@RequestMapping(value="/modify_form",method=GET)
	public void modify_form(@RequestParam int bnum,Model model) throws Exception {
		model.addAttribute("modify_form", bs.view(bnum));
	}
	
	//게시글 수정
	@RequestMapping(value="/modify",method=POST)
	public String modify(@RequestParam ("bnum") int bnum, BbsDTO bbsdto, Model model) throws Exception {
		logger.info("게시글 수정 : "+bnum);
		bs.modify(bbsdto);
		model.addAttribute("view", bbsdto);
		return "redirect:/bbs/view?bnum="+bnum;
	}
	
	//답글 양식 페이지 이동
	@RequestMapping(value="/replyView",method=GET)
	public void replyform(@RequestParam ("bnum") int bnum, BbsDTO bbsdto, Model model) throws Exception {
		logger.info("답글 양식 페이지 이동, ");
		model.addAttribute("replyView", bs.replyView(bnum));
	}
	
	//답글 등록
	@RequestMapping(value="/reply",method=POST)
	public String reply(BbsDTO bbsdto) throws Exception {
		logger.info("답글 등록, "+bbsdto);
		bs.reply(bbsdto);
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="/delete",method=POST)
	public String delete(@RequestParam ("bnum") int bnum) throws Exception {
		logger.info("게시글 삭제 번호 : "+bnum);
		bs.delete(bnum);
		return "redirect:/bbs/list";
	}
	
	//요청 페이지 보기
	@RequestMapping(value="/list",method = GET)
	   public void list(HttpServletRequest request, Model model) throws Exception {
	      bs.list(request);
	   }
	
	//댓글 처리
	@RequestMapping(value="/rereply",method=GET)
	public String rereply() {
		
		return "/bbs/reply";
	}
	
	
	
}

