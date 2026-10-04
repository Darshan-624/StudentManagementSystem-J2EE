
package com.studentapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.studentapp.dao.StudentDAOImp;
import com.studentapp.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Set response type
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

        // Get data from HTML form
        String name = req.getParameter("sname");
        String phoneString = req.getParameter("phone");
        String email = req.getParameter("email");
        String branch = req.getParameter("branch");
        String location = req.getParameter("location");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // Check password confirmation
        if (!password.equals(confirmPassword)) {
            pw.println("<h2>Password Mismatch!</h2>");
            pw.println("<p>Password and Confirm Password " + "must be the same.</p>");
            pw.println("<a href='signup.html'>" + "Go Back" + "</a>");
            return;
        }

        // Convert phone String to long
        long phone;

        try {
            phone = Long.parseLong(phoneString);
        } catch (NumberFormatException e) {
            pw.println("<h2>Invalid Phone Number</h2>");
            pw.println("<a href='signup.html'>" + "Go Back" + "</a>");
            return;
        }

        // Create Student object
        Student s = new Student();

        // Store form data inside Student object
        s.setSname(name);
        s.setPhone(phone);
        s.setemail(email);
        s.setBranch(branch);
        s.setLocation(location);
        s.setPassword(password);

        // Create DAO object
        StudentDAOImp st = new StudentDAOImp();

        // Insert Student into database
        boolean result = st.insertStudent(s);

        // Check result
        if (result) {

            // Signup successful
            req.setAttribute("message", "Signup Successful! Please Login.");

            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, res);

            // pw.println("<html>");
            // pw.println("<head>");
            // pw.println("<title>Signup Success</title>");
            // pw.println("</head>");
            // pw.println("<body>");
            // pw.println("<h1>Signup Successful!</h1>");
            // pw.println("<p>Welcome, " + name + "!</p>");
            // pw.println("<p>Your account has been created successfully.</p>");
            // pw.println("<a href='login.html'>" + "Go to Login" + "</a>");
            // pw.println("</body>");
            // pw.println("</html>");

        } else {

            // Signup failed
            req.setAttribute("message", "Signup Failed! Please try again.");

            RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
            rd.forward(req, res);
        }
    }
}

