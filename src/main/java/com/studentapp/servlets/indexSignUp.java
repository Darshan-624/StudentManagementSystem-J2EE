package com.studentapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.studentapp.dao.StudentDAO;
import com.studentapp.dao.StudentDAOImp;
import com.studentapp.dto.Student;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;


//@WebServlet("/signup")

public class indexSignUp extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		
		Student s = new Student();
		StudentDAO st = new StudentDAOImp();
		
		PrintWriter out = resp.getWriter();
		
		s.setSname(req.getParameter("name"));
		s.setPhone(Long.parseLong(req.getParameter("phone")));
		s.setemail(req.getParameter("email"));
		s.setLocation(req.getParameter("loc"));
		s.setBranch(req.getParameter("branch"));
		String password = req.getParameter("password");
		String confirm = req.getParameter("confirm");
		
		//System.out.println(req);
		
		if(password.equals(confirm)) {
		 	s.setPassword(password);
			
			if(st.insertStudent(s)) {
				out.println("Sign Up successfully!!");
			} else {
				out.println("SignUp failed...");
			}
		}else {
			out.println("Password Missmatchh");
		}
		
		
	}

}
