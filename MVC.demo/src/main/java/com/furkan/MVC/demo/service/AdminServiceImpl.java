package com.furkan.MVC.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.furkan.MVC.demo.dao.AdminDao;
import com.furkan.MVC.demo.entity.Student;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	@Transactional
	public List<Student> getStudents() {
		return adminDao.getStudents();
	}


	@Override
	@Transactional
	public void saveStudent(Student theStudent) {
		adminDao.saveStudent(theStudent);
	}


	@Override
	@Transactional
	public Student getStudent(String theUsername) {
		return adminDao.getStudent(theUsername);
	}


	@Override
	@Transactional
	public void deleteStudent(String theUsername) {
		adminDao.deleteStudent(adminDao.getStudent(theUsername));		
	}


	@Override
	@Transactional
	public void makeAdmin(String theUsername) {
		adminDao.makeAdmin(adminDao.getStudent(theUsername));
	}


	@Override
	@Transactional
	public void updateStudent(Student theStudent) {
		adminDao.updateStudent(theStudent);
	}
}
