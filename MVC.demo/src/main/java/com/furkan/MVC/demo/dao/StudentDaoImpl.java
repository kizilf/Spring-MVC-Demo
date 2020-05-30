package com.furkan.MVC.demo.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.furkan.MVC.demo.entity.Authority;
import com.furkan.MVC.demo.entity.Student;


@Repository
public class StudentDaoImpl  implements StudentDao {

	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public Student getStudent(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();
		Student theStudent = currentSession.get(Student.class, theId);
		return theStudent;
	}


	
}
