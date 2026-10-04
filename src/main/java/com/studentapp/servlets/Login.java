package com.studentapp.servlets;

import java.io.IOException;
import com.studentapp.dao.StudentDAO;
import com.studentapp.dao.StudentDAOImp;
import com.studentapp.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")

public class Login extends HttpServlet { // 1. Changed to HttpServlet
	
	
	@Override
	protected void doGet(HttpServletRequest req,
	                     HttpServletResponse resp)
	        throws ServletException, IOException {

	    RequestDispatcher rd =
	            req.getRequestDispatcher("login.jsp");

	    rd.forward(req, resp);
	}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) // 2. Changed to doPost for security
            throws ServletException, IOException {

        // Get login details from HTML
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Create DAO object
        StudentDAO st = new StudentDAOImp();

        // Authenticate user
        Student s = st.getStudent(email, password);

        // Check result
        if (s != null) {
        	
//        	out.println("Logged in ");
//          Old method: Printing HTML directly from Servlet
//          out.println("<html>");
//          out.println("<head>");
//          out.println("<title>Login Successful</title>");
//          out.println("</head>");
//          out.println("<body>");
//          out.println("<h1>Login Successful!</h1>");
//          out.println("<h2>Welcome " + s.getSname() + "!</h2>");
//          out.println("<p>You have successfully logged in.</p>");
//          out.println("</body>");
//          out.println("</html>");
          

         // Login successful
         // req.setAttribute("message", "Login Successful!");
         // RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
         // rd.forward(req, resp);
//
            
            HttpSession session = req.getSession(true);
            session.setAttribute("student", s); 

            req.setAttribute("message", "User Logged In Successfully!");
            req.setAttribute("student", s);
            
            RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
            rd.forward(req, resp);
        } else {
            // Login failed
            req.setAttribute("message", "Invalid Email or Password!");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
        }
    }
}
