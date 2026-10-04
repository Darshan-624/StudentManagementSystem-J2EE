<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.studentapp.dto.Student"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile</title>
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

.container {
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
.header {
	background: #fffdf8;
	padding: 35px;
	border-radius: 18px;
	margin-bottom: 25px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
}

.header h1 {
	color: #173f35;
	font-size: 30px;
	margin-bottom: 10px;
}

.header h1 span {
	color: #c59d5f;
}

.header p {
	color: #6b756f;
}

.form-card {
	background: #fffdf8;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
}

.form-card h2 {
	color: #173f35;
	font-size: 22px;
	margin-bottom: 25px;
}

.form-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group label {
	color: #6b756f;
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 8px;
}

.form-group input {
	padding: 14px;
	border: 1px solid #e5dccb;
	border-radius: 10px;
	background: #f8f5ed;
	color: #26332f;
	font-size: 15px;
	outline: none;
	transition: .3s ease;
}

.form-group input:focus {
	border-color: #c59d5f;
	background: #fffdf8;
	box-shadow: 0 0 0 3px rgba(197, 157, 95, .10);
}

.actions {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin-top: 30px;
}

.actions button, .actions a {
	border: none;
	text-decoration: none;
	padding: 12px 24px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: .3s ease;
}

.save-btn {
	background: #173f35;
	color: white;
}

.save-btn:hover {
	background: #285c4f;
	transform: translateY(-2px);
}

.cancel-btn {
	background: #c59d5f;
	color: #173f35;
}

.cancel-btn:hover {
	background: #e0bd82;
	transform: translateY(-2px);
}

.footer {
	text-align: center;
	padding: 30px 20px;
	color: #7b817d;
	font-size: 13px;
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
	.container {
		margin-top: 25px;
	}
	.form-grid {
		grid-template-columns: 1fr;
	}
	.header h1 {
		font-size: 25px;
	}
	.actions {
		flex-direction: column;
	}
	.actions button, .actions a {
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
			<a href="dashboard">Dashboard</a> <a href="viewprofile">View
				Profile</a> <a href="updateprofile" class="active">Update Profile</a> <a
				href="login.jsp" class="logout">Logout</a>
		</div>
	</div>
	<div class="container">
		<div class="header">
			<h1>
				Update, <span><%=student.getSname()%></span>
			</h1>
			<p>Update your student profile information below.</p>
		</div>
		<div class="form-card">
			<h2>Update Student Details</h2>
			<form action="updateprofile" method="post">
				<div class="form-grid">
					<div class="form-group">
						<label>Name</label> <input type="text" name="name"
							value="<%=student.getSname()%>" required>
					</div>
					<div class="form-group">
						<label>Email</label> <input type="email" name="email"
							value="<%=student.getemail()%>" required>
					</div>
					<div class="form-group">
						<label>Phone</label> <input type="text" name="phone"
							value="<%=student.getPhone()%>" required>
					</div>
					<div class="form-group">
						<label>Branch</label> <input type="text" name="branch"
							value="<%=student.getBranch()%>" required>
					</div>
					<div class="form-group">
						<label>Location</label> <input type="text" name="location"
							value="<%=student.getLocation()%>" required>
					</div>
				</div>
				<div class="actions">
					<button type="submit" class="save-btn">Save Changes</button>
					<a href="dashboard.jsp" class="cancel-btn">Cancel</a>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">© 2026 Student Management System</div>
</body>
</html>