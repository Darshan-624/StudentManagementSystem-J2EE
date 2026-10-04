<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.studentapp.dto.Student"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Profile</title>
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

.active {
	background: rgba(255, 255, 255, .12);
	color: #e0bd82 !important;
}

.logout {
	background: #c59d5f;
	color: #173f35 !important;
}

.logout:hover {
	background: #e0bd82 !important;
	color: #173f35 !important;
}

.profile-container {
	max-width: 950px;
	margin: 45px auto;
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
.profile-header {
	background: #fffdf8;
	padding: 35px;
	border-radius: 18px;
	margin-bottom: 25px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
	position: relative;
	overflow: hidden;
}

.profile-header::after {
	content: "";
	position: absolute;
	width: 190px;
	height: 190px;
	border-radius: 50%;
	background: rgba(197, 157, 95, .10);
	right: -75px;
	top: -75px;
	transition: .5s ease;
}

.profile-header:hover::after {
	transform: scale(1.3);
}

.profile-header h1 {
	color: #173f35;
	font-size: 30px;
	margin-bottom: 10px;
	position: relative;
	z-index: 1;
}

.profile-header h1 span {
	color: #c59d5f;
}

.profile-header p {
	color: #6b756f;
	position: relative;
	z-index: 1;
}

.profile-card {
	background: #fffdf8;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
}

.profile-card h2 {
	color: #173f35;
	font-size: 22px;
	margin-bottom: 25px;
}

.profile-info {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 18px;
}

.info-box {
	background: #f8f5ed;
	padding: 20px;
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
	margin-bottom: 8px;
}

.info-box strong {
	color: #26332f;
	font-size: 16px;
	word-break: break-word;
}

.profile-actions {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin-top: 30px;
}

.profile-actions a {
	text-decoration: none;
	padding: 12px 22px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	transition: .3s ease;
}

.dashboard-btn {
	background: #173f35;
	color: white;
}

.dashboard-btn:hover {
	background: #285c4f;
	transform: translateY(-2px);
}

.update-btn {
	background: #c59d5f;
	color: #173f35;
}

.update-btn:hover {
	background: #e0bd82;
	transform: translateY(-2px);
}

.footer {
	text-align: center;
	padding: 30px 20px;
	color: #7b817d;
	font-size: 13px;
	margin-top: 10px;
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
	.profile-container {
		margin-top: 25px;
	}
	.profile-info {
		grid-template-columns: 1fr;
	}
	.profile-header h1 {
		font-size: 25px;
	}
	.profile-actions {
		flex-direction: column;
	}
	.profile-actions a {
		text-align: center;
	}
}
</style>
</head>
<body>
	<%
	Student student = (Student) request.getAttribute("student");
	%>
	<div class="navbar">
		<div class="logo">
			Student<span>Management</span>
		</div>
		<div class="nav-links">
			<a href="dashboard.jsp">Dashboard</a> <a href="viewprofile"
				class="active">View Profile</a> <a href="updateprofile">Update
				Profile</a> <a href="login.jsp" class="logout">Logout</a>
		</div>
	</div>
	<div class="profile-container">
		<div class="profile-header">
			<h1>
				Hello, <span><%=student.getSname()%></span>
			</h1>
			<p>Here you can view your complete student profile information.</p>
		</div>
		<div class="profile-card">
			<h2>My Profile</h2>
			<div class="profile-info">
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
			<div class="profile-actions">
				<a href="dashboard.jsp" class="dashboard-btn">Back to Dashboard</a>
				<a href="updateprofile" class="update-btn">Update Profile</a>
			</div>
		</div>
	</div>
	<div class="footer">© 2026 Student Management System</div>
</body>
</html>