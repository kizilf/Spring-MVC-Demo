package com.furkan.MVC.demo.service;

import java.util.List;

import com.furkan.MVC.demo.entity.Student;

public interface AdminService {
	
	public List<Student> getStudents();

	public void saveStudent(Student theStudent);

	public Student getStudent(String theUsername);

	public void deleteStudent(String theUsername);

	public void makeAdmin(String theUsername);

	public void updateStudent(Student theStudent);

}
