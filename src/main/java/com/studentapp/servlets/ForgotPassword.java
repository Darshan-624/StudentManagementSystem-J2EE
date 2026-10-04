package com.studentapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.studentapp.dao.StudentDAO;
import com.studentapp.dao.StudentDAOImp;
import com.studentapp.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();

		// Get data from HTML
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String password = req.getParameter("password");
		String confirm = req.getParameter("confirm");

		// Create DAO object
		StudentDAO st = new StudentDAOImp();

		// Find student using email and phone
		Student s = st.getStudent(email, phone);

		if (s != null) {

			// Student exists

			if (password.equals(confirm)) {

				// Password and confirm password match

				if (!(s.getPassword().equals(password))) {

					// New password is different from old password

					s.setPassword(password);

					if (st.updateStudent(s)) {

						req.setAttribute("message", "Password Update Succesfully");

						RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
						rd.forward(req, resp);

//                        out.println("<h2>Password Updated Successfully!</h2>");
//                        out.println("<p>Your password has been changed.</p>");
//                        out.println("<a href='login.html'>Go to Login</a>");

					} else {

						req.setAttribute("message", "Something Went Wrong! Password could not be updated.");

						RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");

						rd.forward(req, resp);

//                        out.println("<h2>Something Went Wrong!</h2>");
//                        out.println("<p>Password could not be updated.</p>");
					}

				} else {

					req.setAttribute("message", "Password Already In Use. Please enter a different password.");

					RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");

					rd.forward(req, resp);

					// New password is same as old password

//                    out.println("<h2>Password Already In Use</h2>");
//                    out.println("<p>Please enter a different password.</p>");
//                    out.println("<a href='forgotpassword.html'>Try Again</a>");
				}

			} else {

				// Password mismatch

				req.setAttribute("message", "Password and Confirm Password must be the same.");
				RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");

				rd.forward(req, resp);

//                out.println("<h2>Password Mismatch</h2>");
//                out.println("<p>Password and Confirm Password must be the same.</p>");
//                out.println("<a href='forgotpassword.html'>Try Again</a>");
			}

		} else {

			req.setAttribute("message", "Student Not Found. Email and phone number do not match.");
			RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");

			rd.forward(req, resp);

			// Student doesn't exist

//            out.println("<h2>Student Not Found</h2>");
//            out.println("<p>Email and phone number do not match any student account.</p>");
//            out.println("<a href='forgotpassword.html'>Try Again</a>");
		}
	}
}

//
//
//
//package com.studentapp.servlets;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import com.studentapp.dao.StudentDao;
//import com.studentapp.dao.StudentDaoImp;
//import com.studentapp.dto.Student;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/resetpassword")
//public class ResetPassword extends HttpServlet{
//	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		StudentDao st= new StudentDaoImp();
//		PrintWriter out= resp.getWriter();
//		
//		String email=req.getParameter("email");
//		Long phone= Long.parseLong(req.getParameter("phone"));
//		
//		Student s= st.getStudent(email, phone);
//		
//		if(s!=null) {
//			if(req.getParameter("password").equals(req.getParameter("confirm"))) {
//				if(!(s.getPassword().equals(req.getParameter("password")))) {
//					s.setPassword(req.getParameter("password"));
//					if(st.updateStudent(s)) {
//						out.println("Password updated....");
//					}
//					else {
//						out.println("Something went wrong !!");
//					}
//				}
//				else {
//					out.println("Password already used  !!");
//				}
//			}
//			else {
//				out.println("Password mishmatch  !!");
//			}
//		}
//		else {
//			out.println("No such student exists  !!");
//		}
//		
//		
//		
//				
//	}
//	
//
//}