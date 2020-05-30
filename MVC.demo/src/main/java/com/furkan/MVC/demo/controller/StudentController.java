package com.furkan.MVC.demo.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.furkan.MVC.demo.entity.Student;
import com.furkan.MVC.demo.service.StudentService;


@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;

	
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentID") int theId, Model theModel){
		
		Student theStudent = studentService.getStudent(theId);
		theModel.addAttribute(theStudent);
		
		return "student-form";
	}
	
	
	
}
