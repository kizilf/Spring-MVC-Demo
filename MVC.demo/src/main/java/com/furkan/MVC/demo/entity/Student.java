package com.furkan.MVC.demo.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class Student  {
	
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "first_name")
	private String firstName;

	@Id
	@Column(name = "username",unique=true, nullable = false)
	private String username;
	
	@Column(name = "password", nullable = false)
	private String password;
	
	@Column(name = "enabled", nullable = false)
	private boolean enabled;
	
	@OneToMany(cascade=CascadeType.ALL,orphanRemoval = true, mappedBy = "user")
	private List<Authority> authorities;
	
	
	public Student() {
		if(authorities == null) {
		authorities = new ArrayList<Authority>();
		}
	}
	


	public String getLastName() {
		return lastName;
	}


	public String getFirstName() {
		return firstName;
	}


	public String getUsername() {
		return username;
	}


	public String getPassword() {
		return password;
	}


	public boolean getEnabled() {
		return enabled;
	}


	public List<Authority> getAuthorities() {
		return authorities;
	}




	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}



	
 
	
	
	
}
