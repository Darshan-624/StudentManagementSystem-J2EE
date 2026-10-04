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

@WebServlet("/delete")
public class DeleteStudent extends HttpServlet {

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

        int sid = Integer.parseInt(req.getParameter("sid"));

        Student s = new Student();
        s.setSid(sid);

        StudentDAO st = new StudentDAOImp();

        boolean result = st.deleteStudent(s);

//        if (result) {
//            req.setAttribute("message", "Student Deleted Successfully!");
//        } else {
//            req.setAttribute("message", "Student Could Not Be Deleted!");
//        }
//
//        RequestDispatcher rd = req.getRequestDispatcher("viewstudents");
//        rd.forward(req, resp);
        
        if (result) {
            resp.sendRedirect("viewstudents?success=Student+Deleted+Successfully!");
        } else {
            resp.sendRedirect("viewstudents?success=Student+Could+Not+Be+Deleted!");
        }
    }
}