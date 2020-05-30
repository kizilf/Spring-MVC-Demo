package com.furkan.MVC.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.furkan.MVC.demo.entity.Student;
import com.furkan.MVC.demo.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/list")

	public String listStudents(Model theModel) {
		List<Student> allStudents = adminService.getStudents();

		theModel.addAttribute("students", allStudents);

		return "list-student";
	}

	@GetMapping("/showStudentForm")
	public String showStudentForm(Model theModel) {
		Student theStudent = new Student();
		theModel.addAttribute("student",theStudent);
		
		return "student-form";

	}
	
	@PostMapping("/saveStudent")
	public String saveStudent(@ModelAttribute("student") Student theStudent) {
		adminService.saveStudent(theStudent);
		return "redirect:/";
	}
	

	@PostMapping("/updateStudent")
	public String updateStudent(@RequestParam("studentID") String theUsername ,@ModelAttribute("student") Student theStudent) {
		Student temp = adminService.getStudent(theUsername);
		temp.setFirstName(theStudent.getFirstName());
		temp.setLastName(theStudent.getLastName());
		temp.setPassword(theStudent.getPassword());
		adminService.updateStudent(temp);
		return "redirect:/admin/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentID") String theUsername, Model theModel){
		
		Student theStudent = adminService.getStudent(theUsername);
		theModel.addAttribute(theStudent);
		
		return "student-update-form";
	}
	
	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("studentID") String theUsername) {
		adminService.deleteStudent(theUsername);
		return "redirect:/admin/list";
	}
	
	@GetMapping("/makeAdmin")
	public String makeAdmin(@RequestParam("studentID") String theUsername) {
		adminService.makeAdmin(theUsername);
		return "redirect:/admin/list";
	}
}
