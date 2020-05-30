package com.furkan.MVC.demo.dao;

import java.util.List;

import com.furkan.MVC.demo.entity.Student;

public interface AdminDao {
	
	public List<Student> getStudents();

	public void saveStudent(Student theStudent);

	public Student getStudent(String theUsername);


	public void deleteStudent(Student theStudent);

	public void makeAdmin(Student student);

	public void updateStudent(Student theStudent);
}
