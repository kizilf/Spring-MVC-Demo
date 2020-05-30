package com.furkan.MVC.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.furkan.MVC.demo.dao.StudentDao;
import com.furkan.MVC.demo.entity.Student;


@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentDao;
	
	



	@Override
	@Transactional
	public Student getStudent(int theId) {
		return studentDao.getStudent(theId);
	}


	

}
