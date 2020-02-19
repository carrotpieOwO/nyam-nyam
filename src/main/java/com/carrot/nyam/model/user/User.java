package com.carrot.nyam.model.user;

import java.sql.Timestamp;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User implements UserDetails{
	private int id;
	private String username;
	private String password;
	private String email;
	private String address;
	private String profile;
	private String introduction;
	private String insta;
	private String blog;
	private Timestamp createDate;
	
	@Builder
	public User(String username, String password, String email, String address, String profile,
			String introduction, String insta, String blog, Timestamp createDate) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.address = address;
		this.profile = profile;
		this.introduction = introduction;
		this.insta = insta;
		this.blog = blog;
		this.createDate = createDate;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	

}
