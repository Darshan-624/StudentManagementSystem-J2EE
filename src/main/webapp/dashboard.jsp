<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.studentapp.dto.Student"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard</title>
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
	overflow-x: hidden;
}

body::before {
	content: "";
	position: fixed;
	width: 320px;
	height: 320px;
	border-radius: 50%;
	background: rgba(197, 157, 95, .10);
	top: 100px;
	left: -150px;
	z-index: -1;
	animation: floatOne 8s ease-in-out infinite;
}

body::after {
	content: "";
	position: fixed;
	width: 380px;
	height: 380px;
	border-radius: 50%;
	background: rgba(23, 63, 53, .07);
	bottom: -180px;
	right: -150px;
	z-index: -1;
	animation: floatTwo 10s ease-in-out infinite;
}

@
keyframes floatOne { 0%,100%{
	transform: translateY(0);
}

50
%
{
transform
:
translateY(
-30px
);
}
}
@
keyframes floatTwo { 0%,100%{
	transform: translateY(0);
}

50
%
{
transform
:
translateY(
30px
);
}
}
.navbar {
	height: 72px;
	background: #173f35;
	color: white;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 45px;
	box-shadow: 0 8px 25px rgba(23, 63, 53, .20);
	position: sticky;
	top: 0;
	z-index: 100;
}

.logo {
	font-size: 23px;
	font-weight: bold;
	letter-spacing: .3px;
	white-space: nowrap;
}

.logo span {
	color: #d8b875;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 10px;
}

.nav-links a {
	color: #f8f5ed;
	text-decoration: none;
	font-size: 14px;
	font-weight: bold;
	padding: 10px 15px;
	border-radius: 8px;
	transition: .3s ease;
}

.nav-links a:hover {
	background: rgba(255, 255, 255, .12);
	color: #e0bd82;
	transform: translateY(-2px);
}

.admin-link {
	color: #e0bd82 !important;
	border: 1px solid rgba(224, 189, 130, .35);
}

.logout {
	background: #c59d5f;
	color: #173f35 !important;
}

.logout:hover {
	background: #e0bd82 !important;
	color: #173f35 !important;
}

.dashboard {
	max-width: 1150px;
	margin: 40px auto;
	padding: 0 25px;
	animation: pageLoad .7s ease;
}

@
keyframes pageLoad {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.success-message {
	background: #e8f2ed;
	color: #245c4d;
	padding: 16px 20px;
	border-radius: 12px;
	margin-bottom: 25px;
	font-weight: bold;
	border: 1px solid #c5ddd2;
	box-shadow: 0 5px 18px rgba(23, 63, 53, .08);
	animation: slideDown .6s ease;
}

@
keyframes slideDown {from { opacity:0;
	transform: translateY(-15px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.welcome {
	background: #fffdf8;
	padding: 35px;
	border-radius: 18px;
	margin-bottom: 25px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
	position: relative;
	overflow: hidden;
}

.welcome::after {
	content: "";
	position: absolute;
	width: 180px;
	height: 180px;
	border-radius: 50%;
	background: rgba(197, 157, 95, .10);
	right: -70px;
	top: -70px;
	transition: .5s ease;
}

.welcome:hover::after {
	transform: scale(1.35);
}

.welcome h1 {
	color: #173f35;
	margin-bottom: 10px;
	font-size: 30px;
	position: relative;
	z-index: 1;
}

.welcome h1 span {
	color: #c59d5f;
}

.welcome p {
	color: #6b756f;
	position: relative;
	z-index: 1;
}

.student-card {
	background: #fffdf8;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
	transition: .35s ease;
}

.student-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 15px 35px rgba(50, 45, 35, .12);
}

.student-card h2 {
	color: #173f35;
	margin-bottom: 25px;
	font-size: 22px;
}

.info {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 18px;
}

.info-box {
	background: #f8f5ed;
	padding: 18px;
	border-radius: 12px;
	border: 1px solid #e5dccb;
	transition: .3s ease;
}

.info-box:hover {
	transform: translateY(-4px);
	border-color: #c59d5f;
	box-shadow: 0 8px 20px rgba(197, 157, 95, .12);
	background: #fffdf8;
}

.info-box span {
	display: block;
	color: #7b817d;
	font-size: 13px;
	margin-bottom: 7px;
}

.info-box strong {
	color: #26332f;
	font-size: 16px;
}

.section-title {
	margin-top: 30px;
	margin-bottom: 18px;
	color: #173f35;
	font-size: 22px;
}

.cards {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.card {
	background: #fffdf8;
	padding: 27px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(50, 45, 35, .07);
	border: 1px solid #e8e0d2;
	text-align: center;
	transition: .35s ease;
	position: relative;
	overflow: hidden;
}

.card::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 4px;
	background: linear-gradient(90deg, #173f35, #c59d5f);
	transform: scaleX(0);
	transform-origin: left;
	transition: .35s ease;
}

.card:hover {
	transform: translateY(-8px);
	box-shadow: 0 18px 35px rgba(50, 45, 35, .13);
}

.card:hover::before {
	transform: scaleX(1);
}

.card h3 {
	color: #173f35;
	margin-bottom: 10px;
	font-size: 19px;
}

.card p {
	color: #6b756f;
	font-size: 14px;
	line-height: 1.6;
	margin-bottom: 18px;
}

.card a {
	display: inline-block;
	text-decoration: none;
	background: #173f35;
	color: white;
	padding: 10px 19px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	transition: .3s ease;
}

.card a:hover {
	background: #285c4f;
	transform: scale(1.05);
	box-shadow: 0 6px 15px rgba(23, 63, 53, .20);
}

.admin-section {
	margin-top: 35px;
	padding: 25px;
	background: #173f35;
	border-radius: 20px;
	box-shadow: 0 12px 30px rgba(23, 63, 53, .18);
}

.admin-title {
	color: #e0bd82;
	font-size: 22px;
	margin-bottom: 20px;
}

.admin-cards {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 18px;
}

.admin-card {
	background: rgba(255, 255, 255, .08);
	border: 1px solid rgba(224, 189, 130, .25);
	padding: 24px;
	border-radius: 15px;
	transition: .35s ease;
}

.admin-card:hover {
	background: rgba(255, 255, 255, .14);
	transform: translateY(-6px);
}

.admin-card h3 {
	color: #fff;
	margin-bottom: 10px;
}

.admin-card p {
	color: #d7e2dd;
	font-size: 14px;
	line-height: 1.6;
	margin-bottom: 18px;
}

.admin-card a {
	display: inline-block;
	background: #c59d5f;
	color: #173f35;
	text-decoration: none;
	padding: 9px 17px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	transition: .3s ease;
}

.admin-card a:hover {
	background: #e0bd82;
	transform: scale(1.05);
}

.footer {
	text-align: center;
	padding: 30px 20px;
	color: #7b817d;
	font-size: 13px;
	margin-top: 10px;
}

@media ( max-width :900px) {
	.navbar {
		padding: 0 20px;
	}
	.nav-links {
		gap: 2px;
	}
	.nav-links a {
		padding: 9px 10px;
	}
	.cards, .admin-cards {
		grid-template-columns: 1fr;
	}
}

@media ( max-width :700px) {
	.navbar {
		height: auto;
		min-height: 72px;
		padding: 15px 18px;
		flex-direction: column;
		gap: 12px;
	}
	.nav-links {
		flex-wrap: wrap;
		justify-content: center;
	}
	.dashboard {
		margin-top: 25px;
	}
	.info {
		grid-template-columns: 1fr;
	}
	.welcome h1 {
		font-size: 25px;
	}
}
</style>
</head>
<body>
	<%
	String message = (String) request.getAttribute("message");
	//Student student = (Student) request.getAttribute("student");
	
	
	Student student=(Student)session.getAttribute("student");
	
	if(student == null){
		response.sendRedirect("login.jjsp");
	}
	%>
	<div class="navbar">
		<div class="logo">
			Student<span>Management</span>
		</div>
		<div class="nav-links">
			<a href="viewprofile">View Profile</a> <a href="updateprofile">Update
				Profile</a>
			<%
			if (student.getSid() == 1) {
			%>
			<a href="viewstudents" class="admin-link">View Students</a> <a
				href="searchstudent.jsp" class="admin-link">Search Student</a>
			<%
			}
			%>
			<a href="logout" class="logout">Logout</a>
		</div>
	</div>
	<div class="dashboard">
		
			<% if(message != null) { %>
			<div class="success-message"><%= message %></div>
			<%} %>
		
		<div class="welcome">
			<h1>
				Welcome, <span><%=student.getSname()%></span>
			</h1>
			<p>You have successfully logged into your student account.</p>
		</div>
		<div class="student-card">
			<h2>Student Information</h2>
			<div class="info">
				<div class="info-box">
					<span>Name</span> <strong><%=student.getSname()%></strong>
				</div>
				<div class="info-box">
					<span>Email</span> <strong><%=student.getemail()%></strong>
				</div>
				<div class="info-box">
					<span>Phone</span> <strong><%=student.getPhone()%></strong>
				</div>
				<div class="info-box">
					<span>Branch</span> <strong><%=student.getBranch()%></strong>
				</div>
				<div class="info-box">
					<span>Location</span> <strong><%=student.getLocation()%></strong>
				</div>
			</div>
		</div>
		<h2 class="section-title">Quick Access</h2>
		<div class="cards">
			<div class="card">
				<h3>My Profile</h3>
				<p>View your personal and student information.</p>
				<a href="viewprofile">View Profile</a>
			</div>
			<div class="card">
				<h3>Update Details</h3>
				<p>Update your name, phone, email, branch and location.</p>
				<a href="updateprofile">Update Profile</a>
			</div>
			<div class="card">
				<h3>Account</h3>
				<p>Manage your student account information.</p>
				<a href="viewprofile">Account Details</a>
			</div>
		</div>
		<%if(student.getSid()==1){%>
		<div class="admin-section">
			<h2 class="admin-title">Administrator Panel</h2>
			<div class="admin-cards">
				<div class="admin-card">
					<h3>View Students</h3>
					<p>View the details of all registered students.</p>
					<a href="viewstudents">View Students</a>
				</div>
				<div class="admin-card">
					<h3>Search Student</h3>
					<p>Search for a particular student using their details.</p>
					<a href="searchstudent.jsp">Search Student</a>
				</div>
				<div class="admin-card">
					<h3>Delete Student</h3>
					<p>Remove a student account from the system.</p>
					<a href="deletestudent.jsp">Delete Student</a>
				</div>
			</div>
		</div>
		<%}%>
	</div>
	<div class="footer">© 2026 Student Management System</div>
</body>
</html>