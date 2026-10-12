
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.studentapp.dto.Student" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Student</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    min-height: 100vh;
    background: #f4f1ea;
    color: #26332f;
}

.navbar {
    min-height: 72px;
    background: #173f35;
    color: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    padding: 15px 35px;
    flex-wrap: wrap;
}

.logo {
    font-size: 23px;
    font-weight: bold;
}

.logo span {
    color: #d8b875;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 10px;
    flex-wrap: wrap;
}

.nav-links a {
    color: #f8f5ed;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
    padding: 10px 14px;
    border-radius: 8px;
    transition: .3s ease;
}

.nav-links a:hover,
.nav-links .active {
    background: rgba(255,255,255,.12);
    color: #e0bd82;
}

.nav-links .logout {
    background: #c59d5f;
    color: #173f35;
}

.container {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 22px;
}

.header,
.card {
    background: #fffdf8;
    padding: 28px;
    border-radius: 18px;
    border: 1px solid #e8e0d2;
    box-shadow: 0 8px 30px rgba(50,45,35,.08);
    margin-bottom: 24px;
}

.header h1,
.card h2 {
    color: #173f35;
    margin-bottom: 12px;
}

.header h1 span {
    color: #c59d5f;
}

.header p {
    color: #6b756f;
    line-height: 1.6;
}

form {
    display: grid;
    gap: 18px;
    max-width: 600px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
    color: #173f35;
}

input {
    width: 100%;
    padding: 13px;
    border: 1px solid #d8d1c5;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
}

input:focus {
    border-color: #173f35;
    box-shadow: 0 0 0 3px rgba(23,63,53,.1);
}

button {
    background: #173f35;
    color: white;
    padding: 13px 20px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    transition: .3s ease;
}

button:hover {
    background: #285c4f;
}

.message {
    padding: 15px 18px;
    border-radius: 10px;
    margin-bottom: 22px;
    font-weight: bold;
    background: #e8f5e9;
    color: #173f35;
    border: 1px solid #b7d8bd;
    overflow-wrap: anywhere;
}

.result-table {
    overflow-x: auto;
}

table {
    width: 100%;
    min-width: 800px;
    border-collapse: collapse;
    margin-top: 18px;
}

th,
td {
    text-align: left;
    padding: 13px 10px;
    border-bottom: 1px solid #e5dccb;
    font-size: 14px;
    overflow-wrap: anywhere;
}

th {
    background: #173f35;
    color: white;
}

.sid {
    color: #c59d5f;
    font-weight: bold;
}

.delete-btn {
    display: inline-block;
    background: #a63d40;
    color: white;
    padding: 9px 14px;
    border-radius: 7px;
    text-decoration: none;
    font-weight: bold;
    font-size: 13px;
}

.delete-btn:hover {
    background: #812d30;
}

.back {
    display: inline-block;
    margin-top: 22px;
    text-decoration: none;
    background: #173f35;
    color: white;
    padding: 11px 18px;
    border-radius: 8px;
    font-weight: bold;
}

.footer {
    text-align: center;
    padding: 25px;
    color: #7b817d;
    font-size: 13px;
}

@media(max-width: 650px) {
    .navbar {
        justify-content: center;
    }

    .logo {
        width: 100%;
        text-align: center;
    }

    .nav-links {
        justify-content: center;
    }

    .container {
        margin-top: 24px;
    }

    .header,
    .card {
        padding: 20px;
    }
}
</style>
</head>

<body>

<%
    String message = (String) request.getAttribute("message");
    Student foundStudent =
            (Student) request.getAttribute("foundStudent");

    String emailValue = request.getParameter("email") == null
            ? "" : request.getParameter("email");

    String phoneValue = request.getParameter("phone") == null
            ? "" : request.getParameter("phone");
%>

<div class="navbar">
    <div class="logo">Student<span>Management</span></div>

    <div class="nav-links">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="viewprofile.jsp">View Profile</a>
        <a href="updateprofile">Update Profile</a>
        <a href="viewstudents">View Students</a>
        <a href="searchstudent" class="active">Search Student</a>
        <a href="logout" class="logout">Logout</a>
    </div>
</div>

<div class="container">

    <div class="header">
        <h1>Search <span>Student</span></h1>
        <p>Enter the student's email and phone number to find their details.</p>
    </div>

    <% if (message != null) { %>
        <div class="message"><%= message %></div>
    <% } %>

    <div class="card">
        <h2>Search Student Details</h2>

        <form action="searchstudent" method="post">

            <div>
                <label for="email">Student Email</label>
                <input type="email" id="email" name="email"
                    placeholder="Enter student email"
                    value="<%= emailValue %>" required>
            </div>

            <div>
                <label for="phone">Student Phone</label>
                <input type="tel" id="phone" name="phone"
                    placeholder="Enter student phone number"
                    value="<%= phoneValue %>" required>
            </div>

            <button type="submit">Search Student</button>
        </form>
    </div>

    <% if (foundStudent != null) { %>

    <div class="card">
        <h2>Student Details</h2>

        <div class="result-table">
            <table>
                <thead>
                    <tr>
                        <th>SID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Branch</th>
                        <th>Location</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td class="sid"><%= foundStudent.getSid() %></td>
                        <td><%= foundStudent.getSname() %></td>
                        <td><%= foundStudent.getPhone() %></td>
                        <td><%= foundStudent.getemail() %></td>
                        <td><%= foundStudent.getBranch() %></td>
                        <td><%= foundStudent.getLocation() %></td>

                        <td>
                            <% if (foundStudent.getSid() != 1) { %>
                                <a class="delete-btn"
                                   href="delete?sid=<%= foundStudent.getSid() %>"
                                   onclick="return confirm('Are you sure you want to delete this student?');">
                                    Delete
                                </a>
                            <% } else { %>
                                Admin
                            <% } %>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <% } %>

    <a href="viewstudents" class="back">Back to View Students</a>

</div>

<div class="footer">
    © 2026 Student Management System
</div>

</body>
</html>
