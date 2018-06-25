package com.kh.myapp.member.vo;

import java.sql.Date;

import javax.persistence.Entity;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
@Data
public class MemberVO {
	
	@Pattern(regexp="^[\\w=\\.]+@([\\w-]+\\.)+[\\w-]{2,4}",message="이메일 형식이 아닙니다.")
	private String id;
	@Size(min=4,max=30,message="비밀번호는 4-30byte로 입력해주세요.")
	private String passwd;
	@Size(min=4,max=20,message="이름은 4-20byte로 입력해주세요.")
	private String name;	
	private String birth;
	private String phone;
	private String gender;
	private Date cdate;
	private Date udate;
	
	public MemberVO() {}
	
	public MemberVO(MemberVO memberVO) {
		this.id = memberVO.getId();
		this.passwd = memberVO.getPasswd();
	}
	
	public MemberVO(String id, String passwd, String name, String birth, String phone, String gender, Date cdate,
			Date udate) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
		this.cdate = cdate;
		this.udate = udate;
	}
}
