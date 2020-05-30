package com.furkan.MVC.demo.controller;

import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.furkan.MVC.demo.entity.Student;
import com.furkan.MVC.demo.entity.currency.Currency;
import com.furkan.MVC.demo.service.AdminService;

@Controller
public class HomeController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping("/")
	public String showHomePage() {

		return "homepage";
	}

	@RequestMapping("/converter")
	public String converter(Model theModel) {
		ObjectMapper mapper = new ObjectMapper();

		try {
			Currency currency = mapper.readValue(new URL("http://www.floatrates.com/daily/try.json"), Currency.class);
			theModel.addAttribute(currency);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "converter";
	}

	@RequestMapping("/access-denied")
	public String accessDenied() {
		return "access-denied";
	}

	@GetMapping("/showStudentForm")
	public String showStudentForm(Model theModel) {
		Student theStudent = new Student();
		theModel.addAttribute("student", theStudent);

		return "student-form";

	}

	@PostMapping("/saveStudent")
	public String saveStudent(@ModelAttribute("student") Student theStudent) {
		adminService.saveStudent(theStudent);
		return "redirect:/";
	}
}