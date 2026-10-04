<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Login</title>


<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #dbeafe, #eff6ff, #e0f2fe);
	padding: 20px;
}

/* Login Card */
.login-container {
	width: 100%;
	max-width: 420px;
	background: white;
	padding: 40px 35px;
	border-radius: 18px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
}

/* Logo */
.logo {
	width: 65px;
	height: 65px;
	margin: 0 auto 18px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	background: #2563eb;
	color: white;
	font-size: 28px;
	font-weight: bold;
}

/* Heading */
.heading {
	text-align: center;
	margin-bottom: 30px;
}

.heading h1 {
	color: #1e3a8a;
	font-size: 28px;
	margin-bottom: 8px;
}

.heading p {
	color: #64748b;
	font-size: 14px;
}

/* Form */
.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 7px;
	color: #334155;
	font-size: 14px;
	font-weight: bold;
}

.required {
	color: #dc2626;
}

/* Input */
.input-box {
	width: 100%;
	padding: 13px 14px;
	border: 1px solid #cbd5e1;
	border-radius: 8px;
	outline: none;
	font-size: 15px;
	transition: 0.3s;
}

.input-box:focus {
	border-color: #2563eb;
	box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
}

.input-box::placeholder {
	color: #94a3b8;
}

/* Password */
.password-wrapper {
	position: relative;
}

.password-wrapper .input-box {
	padding-right: 65px;
}

.show-password {
	position: absolute;
	right: 12px;
	top: 50%;
	transform: translateY(-50%);
	border: none;
	background: transparent;
	color: #2563eb;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
}

/* Forgot Password */
.forgot {
	text-align: right;
	margin-top: 7px;
}

.forgot a {
	color: #2563eb;
	font-size: 13px;
	text-decoration: none;
}

/* Login Button */
.login-btn {
	width: 100%;
	padding: 13px;
	border: none;
	border-radius: 8px;
	background: #2563eb;
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
}

.login-btn:hover {
	background: #1d4ed8;
	transform: translateY(-1px);
	box-shadow: 0 5px 15px rgba(37, 99, 235, 0.25);
}

/* Signup Link */
.signup-section {
	text-align: center;
	margin-top: 25px;
	color: #64748b;
	font-size: 14px;
}

.signup-section a {
	color: #2563eb;
	text-decoration: none;
	font-weight: bold;
}

.signup-section a:hover {
	text-decoration: underline;
}

/* Mobile */
@media ( max-width : 500px) {
	.login-container {
		padding: 30px 22px;
	}
}
</style>

</head>


<body>


	<div class="login-container">


		<!-- Logo -->

		<div class="logo">S</div>


		<!-- Heading -->

		<div class="heading">

			<h1>Welcome Back</h1>

			<p>Login to your student account</p>

		</div>

		

		<%
            String message = (String)request.getAttribute("message");

            if (message != null) {
        %>

		<p><%= message %></p>

		<%
            }
        %>


		<!-- Login Form -->

		<form action="login" method="post">

			<!-- Email -->

			<div class="form-group">

				<label for="email"> Email <span class="required">*</span>

				</label> <input type="email" id="email" name="email" class="input-box"
					placeholder="Enter your email" required>

			</div>


			<!-- Password -->

			<div class="form-group">

				<label for="password"> Password <span class="required">*</span>

				</label>


				<div class="password-wrapper">

					<input type="password" id="password" name="password"
						class="input-box" placeholder="Enter your password" required>


					<button type="button" class="show-password"
						onclick="togglePassword()">Show</button>

				</div>


				<div class="forgot">

					<a href="forgotpassword.jsp"> Forgot Password? </a>

				</div>

			</div>


			<!-- Login Button -->

			<button type="submit" class="login-btn">Login</button>


		</form>


		<!-- Signup -->

		<div class="signup-section">

			Don't have an account? <a href="signup.jsp"> Create Account </a>

		</div>


	</div>


	<script>

        function togglePassword() {

            const password = document.getElementById("password");

            const button = document.querySelector(".show-password");
				
            if (password.type === "password") {

                password.type = "text";

                button.innerText = "Hide";

            } else {

                password.type = "password";

                button.innerText = "Show";

            }

        }

    </script>


</body>

</html>