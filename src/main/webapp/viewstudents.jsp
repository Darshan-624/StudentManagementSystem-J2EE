<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.studentapp.dto.Student"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Students</title>
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
	max-width: 1200px;
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
.header {
	background: #fffdf8;
	padding: 30px;
	border-radius: 18px;
	margin-bottom: 25px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
	position: relative;
	overflow: hidden;
}

.header::after {
	content: "";
	position: absolute;
	width: 180px;
	height: 180px;
	border-radius: 50%;
	background: rgba(197, 157, 95, .10);
	right: -70px;
	top: -70px;
}

.header h1 {
	color: #173f35;
	font-size: 30px;
	margin-bottom: 10px;
	position: relative;
	z-index: 1;
}

.header h1 span {
	color: #c59d5f;
}

.header p {
	color: #6b756f;
	position: relative;
	z-index: 1;
}

.student-card {
	background: #fffdf8;
	padding: 25px;
	border-radius: 18px;
	box-shadow: 0 8px 30px rgba(50, 45, 35, .08);
	border: 1px solid #e8e0d2;
	overflow-x: auto;
}

.student-card h2 {
	color: #173f35;
	font-size: 22px;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	min-width: 850px;
}

thead {
	background: #173f35;
	color: white;
}

th {
	padding: 16px 14px;
	text-align: left;
	font-size: 14px;
}

td {
	padding: 16px 14px;
	border-bottom: 1px solid #e5dccb;
	color: #26332f;
	font-size: 14px;
}

tbody tr {
	background: #fffdf8;
	transition: .3s ease;
}

tbody tr:hover {
	background: #f8f5ed;
	transform: scale(1.005);
}

.sid {
	font-weight: bold;
	color: #c59d5f;
}

.back {
	display: inline-block;
	margin-top: 25px;
	text-decoration: none;
	background: #173f35;
	color: white;
	padding: 11px 20px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	transition: .3s ease;
}

.back:hover {
	background: #285c4f;
	transform: translateY(-2px);
}

.footer {
	text-align: center;
	padding: 30px 20px;
	color: #7b817d;
	font-size: 13px;
}

.message {
    background: #e8f5e9;
    color: #173f35;
    padding: 15px 20px;
    border-radius: 10px;
    margin-bottom: 20px;
    font-weight: bold;
    border: 1px solid #b7d8bd;
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
	.header h1 {
		font-size: 25px;
	}
	.student-card {
		padding: 18px;
	}
}


</style>
</head>
<body>

	<%
	ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("students");
	String message = (String) request.getAttribute("message");
	%>

	<div class="navbar">
		<div class="logo">
			Student<span>Management</span>
		</div>
		<div class="nav-links">
			<a href="dashboard.jsp">Dashboard</a> <a href="viewprofile.jsp">View
				Profile</a> <a href="updateprofile">Update Profile</a> <a
				href="viewstudents" class="active">View Students</a> <a
				href="searchstudent.jsp">Search Student</a> <a href="login.jsp"
				class="logout">Logout</a>
		</div>
	</div>

	<div class="container">

		<div class="header">
			<h1>
				Welcome, <span>Administrator</span>
			</h1>
			<p>View all registered student details from the system.</p>
		</div>
		
		<% if(message != null) { %>

    <div class="message">
        <%=message%>
    </div>

<% } %>

		<div class="student-card">
			<h2>All Student Details</h2>

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
					<%
for(Student s:students){
%>
					<tr>
						<td class="sid"><%=s.getSid()%></td>
						<td><%=s.getSname()%></td>
						<td><%=s.getPhone()%></td>
						<td><%=s.getemail()%></td>
						<td><%=s.getBranch()%></td>
						<td><%=s.getLocation()%></td>
						<td>
							<%if(s.getSid() != 1) { %>
							<a href="delete?sid=<%=s.getSid()%>"
							onclick="return confirm('Are you sure you want to delete this student?');"> Delete  </a>
							
							<%} else { %>
							
								Admin
							<%} %>
						</td>
					</tr>
					<%
}
%>
				</tbody>
			</table>

			<a href="dashboard.jsp" class="back">Back to Dashboard</a>

		</div>
	</div>

	<div class="footer">© 2026 Student Management System</div>

</body>
</html>