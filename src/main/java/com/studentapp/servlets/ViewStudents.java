package com.studentapp.servlets;

import java.io.IOException;
import java.util.ArrayList;

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

@WebServlet("/viewstudents")
public class ViewStudents extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("student") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        Student admin = (Student) session.getAttribute("student");

        if (admin.getSid() != 1) {
            resp.sendRedirect("dashboard.jsp");
            return;
        }
        
        String success = req.getParameter("success");

        if (success != null) {
            req.setAttribute("message", success);
        }

        StudentDAO st = new StudentDAOImp();

        ArrayList<Student> students = st.getStudent();

        req.setAttribute("students", students);

        RequestDispatcher rd = req.getRequestDispatcher("viewstudents.jsp");
        rd.forward(req, resp);
    }
}
