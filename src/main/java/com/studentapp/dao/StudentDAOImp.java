package com.studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.studentapp.conn.Connect;
import com.studentapp.dto.Student;

public class StudentDAOImp implements StudentDAO{
	
	
	Connection con = null;
	
	public StudentDAOImp() {
		con = Connect.getConn();
	}
	
	

	@Override
	public boolean insertStudent(Student s) {
		
		String query = "Insert into student values(0,?,?,?,?,?,?,SYSDATE())";
		PreparedStatement ps = null;
		int res = 0;
		//Connection logic is already written in the different class and initializing  it in the constructor 
		
		 try {
			ps = con.prepareStatement(query);
//			String name=s.getSname();
//			ps.setString(1, s.getSname());
			
			
			ps.setString(1, s.getSname());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getemail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setString(6, s.getPassword());
			
			 res = ps.executeUpdate();
			
			
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		 
		 if(res > 0) {
			 return true;
		 }else
		
		return false;
	}

	@Override
	public boolean updateStudent(Student s) {
		String query = "UPDATE STUDENT SET sname=?, phone=?, email=?, brannch=?, location=?,password = ? WHERE sid=?";

		PreparedStatement ps = null;
		int res = 0;

		try {

			ps = con.prepareStatement(query);

			ps.setString(1, s.getSname());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getemail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setString(6, s.getPassword());
			
			ps.setInt(7, s.getSid());

			res = ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteStudent(Student s) {
		
		String query = "DELETE FROM STUDENT WHERE sid=? AND sid != 1";

		PreparedStatement ps = null;
		int res = 0;

		try {

			ps = con.prepareStatement(query);

			ps.setInt(1, s.getSid());

			res = ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Student getStudent(String email, String password) {
		Student s = null;

		String query = "SELECT * FROM STUDENT WHERE email=? AND password=?";

		try {

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				s = new Student();
				int id = rs.getInt("sid");
				s.setSid(id);

				s.setSid(rs.getInt("sid"));
				s.setSname(rs.getString("sname"));
				s.setPhone(rs.getLong("phone"));
				s.setemail(rs.getString("email"));
				s.setBranch(rs.getString("brannch"));
				s.setLocation(rs.getString("location"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("Date"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return s;
	}
	

	@Override
	public Student getStudent(String email, long phone) {
		Student s = null;

		String query = "SELECT * FROM STUDENT WHERE email=? AND phone=?";

		try {

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, email);
			ps.setLong(2, phone);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				s = new Student();

				s.setSid(rs.getInt("sid"));
				s.setSname(rs.getString("sname"));
				s.setPhone(rs.getLong("phone"));
				s.setemail(email);
				s.setBranch(rs.getString("brannch"));
				s.setLocation(rs.getString("location"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("Date"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return s;
	}


	@Override
	public ArrayList<Student> getStudent() {
		ArrayList<Student> list = new ArrayList<Student>();

		String query = "SELECT * FROM STUDENT";

		try {

			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Student s = new Student();

				s.setSid(rs.getInt("sid"));
				s.setSname(rs.getString("sname"));
				s.setPhone(rs.getLong("phone"));
				s.setemail(rs.getString("email"));
				s.setBranch(rs.getString("brannch"));
				s.setLocation(rs.getString("location"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("Date"));

				list.add(s);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}



	@Override
	public boolean updatePassword(Student s) {
		 String query = "UPDATE STUDENT SET password=? WHERE sid=?";

		    PreparedStatement ps = null;

		    int res = 0;

		    try {

		        ps = con.prepareStatement(query);

		        ps.setString(1, s.getPassword());

		        ps.setInt(2, s.getSid());

		        res = ps.executeUpdate();

		    } catch (SQLException e) {

		        e.printStackTrace();

		    }

		    if (res > 0) {

		        return true;

		    } else {

		        return false;
	}

}
	}