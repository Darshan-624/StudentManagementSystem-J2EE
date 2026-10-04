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

@WebServlet("/updateprofile")
public class updateprofile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        HttpSession session=req.getSession(false);

        if(session==null||session.getAttribute("student")==null){
            resp.sendRedirect("login.jsp");
            return;
        }

        Student student=(Student)session.getAttribute("student");

        req.setAttribute("student",student);

        RequestDispatcher rd=req.getRequestDispatcher("updateprofile.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        HttpSession session=req.getSession(false);

        if(session==null||session.getAttribute("student")==null){
            resp.sendRedirect("login.jsp");
            return;
        }

        Student student=(Student)session.getAttribute("student");

        String name=req.getParameter("name");
        String phone=req.getParameter("phone");
        String email=req.getParameter("email");
        String branch=req.getParameter("branch");
        String location=req.getParameter("location");

        student.setSname(name);
        student.setPhone(Long.parseLong(phone));
        student.setemail(email);
        student.setBranch(branch);
        student.setLocation(location);
        
        //student.setSname(req.getParameter("name");

        StudentDAO st=new StudentDAOImp();

        boolean result=st.updateStudent(student);

        if(result){
            session.setAttribute("student",student);
            req.setAttribute("message","Profile Updated Successfully!");
        }else{
            req.setAttribute("message","Profile Update Failed!");
        }

        RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
        rd.forward(req,resp);
    }
}