package com.furkan.MVC.demo.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Repository;

import com.furkan.MVC.demo.entity.Authority;
import com.furkan.MVC.demo.entity.Student;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudents() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Student> theQuery = currentSession.createQuery("from Student", Student.class);
		List<Student> students = theQuery.getResultList();

		return students;
	}

	@Override
	public void saveStudent(Student theStudent) {

		Session currentSession = sessionFactory.getCurrentSession();

		theStudent.setEnabled(true);
		String pass = theStudent.getPassword();
		if(!pass.contains("{noop}")) 
		theStudent.setPassword("{noop}" + pass);

		Authority auth = new Authority();
		auth.setAuthority("ROLE_USER");
		auth.setUser(theStudent);
		theStudent.getAuthorities().add(auth);
		
		currentSession.save(theStudent);
		
	}
	
	  
	@Override
	public Student getStudent(String theUsername) {

		Session currentSession = sessionFactory.getCurrentSession();
		Student theStudent = currentSession.get(Student.class, theUsername);
		return theStudent;
	}

	@Override
	public void deleteStudent(Student theStudent) {
		Session currentSession = sessionFactory.getCurrentSession();
		theStudent.getAuthorities().clear();
		currentSession.delete(theStudent);
	}

	@Override
	public void makeAdmin(Student student) {
		// Session currentSession = sessionFactory.getCurrentSession();
		// currentSession.
		// currentSession.saveOrUpdate(student);
	}

	@Override
	public void updateStudent(Student theStudent) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(theStudent);
	}

}
