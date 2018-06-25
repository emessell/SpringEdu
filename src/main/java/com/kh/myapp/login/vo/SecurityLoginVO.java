package com.kh.myapp.login.vo;

import java.sql.Date;
import java.util.Collection;

import javax.persistence.Entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Entity
@Data
public class SecurityLoginVO extends User{
	
	
	private String id;
	private String passwd;
	private Date cdate;
	private Date udate;
	private String name;
	private String birth;
	private String phone;
	private String gender;
	
	private static final long serialVersionUID = 1L;
	
	public SecurityLoginVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}
	
	
	
}
