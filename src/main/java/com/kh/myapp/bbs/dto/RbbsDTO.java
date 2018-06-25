package com.kh.myapp.bbs.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class RbbsDTO {
	private int rnum, bnum, rgood, rbad, rgroup, rstep, rindent;
	private String rid, rname, rcontent;
	//@JsonFormat(pattern="yyyy/MM/dd")
	private Date rcdate, rudate;
}