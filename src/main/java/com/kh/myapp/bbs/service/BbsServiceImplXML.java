package com.kh.myapp.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.myapp.bbs.dao.BbsDAO;
import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.util.FindCriteria;
import com.kh.myapp.util.PageCriteria;
import com.kh.myapp.util.RecordCriteria;

@Service
public class BbsServiceImplXML implements BbsService{
	
	private static Logger logger = LoggerFactory.getLogger(BbsServiceImplXML.class);

	@Autowired
	@Qualifier("bbsDAOImplXML")
	private BbsDAO bbsdao;

	@Override
	public void write(BbsDTO bbsdto) throws Exception {
		bbsdao.write(bbsdto);
	}

	@Override
	public List<BbsDTO> listAll() throws Exception {
		return bbsdao.listAll();
	}

	@Override
	public List<BbsDTO> list(RecordCriteria recordCriteria) throws Exception {
		return bbsdao.list(recordCriteria);
	}

	@Override
	public BbsDTO view(int bnum) throws Exception {
		return bbsdao.view(bnum);
	}

	@Override
	public void modify(BbsDTO bbsdto) throws Exception {
		bbsdao.modify(bbsdto);
	}

	@Override
	public void delete(int bnum) throws Exception {
		bbsdao.delete(bnum);
	}

	@Override
	public BbsDTO replyView(int bnum) throws Exception {
		return bbsdao.replyView(bnum);
	}

	@Override
	public void reply(BbsDTO bbsdto) throws Exception {
		bbsdao.reply(bbsdto);
	}

	@Override
	public int totalRec() throws Exception {
		return bbsdao.totalRec();
	}

	@Override
	public List<BbsDTO> searchList(FindCriteria findCriteria) throws Exception {
		return bbsdao.searchList(findCriteria);
	}

	@Override
	public int getSearchListCount(FindCriteria findCriteria) throws Exception {
		return bbsdao.getSearchListCount(findCriteria);
	}

	@Override
	public void list(HttpServletRequest request) throws Exception {
		
		int reqPage = 0;
		if (request.getParameter("reqPage") == null || request.getParameter("reqPage") == "") {
			reqPage = 1;
		} else {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}

		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");

		List<BbsDTO> list = null;
		PageCriteria pc = null;
		RecordCriteria rc = null;

		if (keyword == null || keyword.trim().equals("")) {
			rc = new RecordCriteria(reqPage);
			list = list(rc);
			int totalRec = totalRec();
			pc = new PageCriteria(rc, totalRec);

		} else {
			rc = new FindCriteria(reqPage, searchType, keyword);
			list = searchList((FindCriteria) rc);
			int totalRec = getSearchListCount((FindCriteria) rc);
			pc = new PageCriteria(rc, totalRec);

			request.setAttribute("findCriteria", (FindCriteria) rc);
		}
		logger.info("rc"+rc.toString());
		logger.info("pc"+pc.toString());
		request.setAttribute("list", list);
		request.setAttribute("page", pc);
	}
}
