package com.studentapp.dao;

import java.util.ArrayList;

import com.studentapp.dto.Student;

public interface StudentDAO  {
	
	boolean insertStudent(Student s);
	boolean updateStudent(Student s);
	boolean deleteStudent(Student s);
	Student getStudent(String email, String password);
	Student getStudent(String email, long phone);
	ArrayList<Student> getStudent();
	boolean updatePassword(Student s);

}