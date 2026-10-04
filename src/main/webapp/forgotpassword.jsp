
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password</title>

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

.container {
	width: 100%;
	max-width: 450px;
	background: white;
	padding: 35px;
	border-radius: 18px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
}

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

.heading {
	text-align: center;
	margin-bottom: 28px;
}

.heading h1 {
	color: #1e3a8a;
	font-size: 27px;
	margin-bottom: 8px;
}

.heading p {
	color: #64748b;
	font-size: 14px;
}

.form-group {
	margin-bottom: 18px;
}

label {
	display: block;
	margin-bottom: 7px;
	color: #334155;
	font-size: 14px;
	font-weight: bold;
}

.required {
	color: #dc2626;
}

.input-box {
	width: 100%;
	padding: 12px 14px;
	border: 1px solid #cbd5e1;
	border-radius: 8px;
	font-size: 15px;
	outline: none;
	transition: 0.3s;
}

.input-box:focus {
	border-color: #2563eb;
	box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
}

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
	font-weight: bold;
	cursor: pointer;
}

.reset-btn {
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

.reset-btn:hover {
	background: #1d4ed8;
	transform: translateY(-1px);
}

.links {
	text-align: center;
	margin-top: 22px;
	font-size: 14px;
}

.links a {
	color: #2563eb;
	text-decoration: none;
	font-weight: bold;
}

.links a:hover {
	text-decoration: underline;
}

@media ( max-width : 500px) {
	.container {
		padding: 28px 20px;
	}
}
</style>
</head>

<body>

	<div class="container">

		<div class="logo">S</div>
		
		<div class = "java">
		<%
		String message = (String) request.getAttribute("message");

		if (message != null) {
		%>

		<p><%=message%></p>

		<%
		}
		%>
		</div>

		<div class="heading">
			<h1>Reset Password</h1>
			<p>Enter your registered details to create a new password</p>
		</div>

		<form action="forgotpassword" method="post">

			<!-- Email -->
			<div class="form-group">
				<label for="email"> Email <span class="required">*</span>
				</label> <input type="email" id="email" name="email" class="input-box"
					placeholder="Enter your registered email" required>
			</div>

			<!-- Phone -->
			<div class="form-group">
				<label for="phone"> Phone Number <span class="required">*</span>
				</label> <input type="tel" id="phone" name="phone" class="input-box"
					placeholder="Enter your registered phone" maxlength="10"
					pattern="[0-9]{10}" required>
			</div>

			<!-- New Password -->
			<div class="form-group">
				<label for="password"> New Password <span class="required">*</span>
				</label>

				<div class="password-wrapper">
					<input type="password" id="password" name="password"
						class="input-box" placeholder="Enter new password" required>
					<button type="button" class="show-password"
						onclick="togglePassword('password', this)">Show</button>
				</div>
			</div>

			<!-- Confirm Password -->
			<div class="form-group">
				<label for="confirm"> Confirm Password <span
					class="required">*</span>
				</label>

				<div class="password-wrapper">
					<input type="password" id="confirm" name="confirm"
						class="input-box" placeholder="Re-enter new password" required>
					<button type="button" class="show-password"
						onclick="togglePassword('confirm', this)">Show</button>
				</div>
			</div>

			<!-- Submit -->
			<button type="submit" class="reset-btn">Reset Password</button>

		</form>

		<div class="links">
			<a href="login.html">Back to Login</a>
		</div>

	</div>

	<script>
function togglePassword(inputId, button) {
    const input = document.getElementById(inputId);

    if (input.type === "password") {
        input.type = "text";
        button.innerText = "Hide";
    } else {
        input.type = "password";
        button.innerText = "Show";
    }
}
</script>

</body>
</html>

