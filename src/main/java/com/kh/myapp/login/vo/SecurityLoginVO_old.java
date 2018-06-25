package com.kh.myapp.login.vo;

import javax.persistence.Entity;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
@Data
public class SecurityLoginVO_old {
	
//	@Pattern(regexp="^[\\w=\\.]+@([\\w-]+\\.)+[\\w-]{2,4}",message="이메일 형식이 아닙니다.")
	private String username;
	
	@Size(min=4,max=30,message="비밀번호는 4-30byte로 입력해주세요.")
	private String password;

}
