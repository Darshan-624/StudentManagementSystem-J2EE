package com.studentapp.servlets;

import java.io.IOException;

import com.studentapp.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewprofile")
public class ViewProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        HttpSession session=req.getSession(false);

        if(session==null||session.getAttribute("student")==null){
            resp.sendRedirect("login.jsp");
            return;
        }

        Student student=(Student)session.getAttribute("student");

        req.setAttribute("student",student);

        RequestDispatcher rd=req.getRequestDispatcher("viewprofile.jsp");
        rd.forward(req,resp);
    }
}