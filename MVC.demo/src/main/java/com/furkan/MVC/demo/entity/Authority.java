
package com.furkan.MVC.demo.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="authorities")
public class Authority implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 390205528677848930L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name ="user_role_id",unique=true)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "username")
	private Student user;
	
	@Column(name = "role")
	private String authority;

	public Student getUser() {
		return user;
	}

	public String getAuthority() {
		return authority;
	}

	public void setUser(Student user) {
		this.user = user;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	
	
	
}
