
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration</title>

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
    padding: 30px 15px;
}

/* Main Card */
.signup-container {
    width: 100%;
    max-width: 520px;
    background: white;
    padding: 35px;
    border-radius: 18px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
}

/* Header */
.header {
    text-align: center;
    margin-bottom: 28px;
}

.logo {
    width: 65px;
    height: 65px;
    margin: 0 auto 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background: #2563eb;
    color: white;
    font-size: 28px;
    font-weight: bold;
}

.header h1 {
    color: #1e3a8a;
    font-size: 28px;
    margin-bottom: 8px;
}

.header p {
    color: #64748b;
    font-size: 14px;
}

/* Form */
.form-group {
    margin-bottom: 18px;
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

/* Inputs */
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

.input-box::placeholder {
    color: #94a3b8;
}

/* Two-column layout */
.row {
    display: flex;
    gap: 15px;
}

.row .form-group {
    flex: 1;
}

/* Select */
select.input-box {
    background: white;
    cursor: pointer;
}

/* Password wrapper */
.password-wrapper {
    position: relative;
}

.password-wrapper .input-box {
    padding-right: 75px;
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

/* Password strength */
.password-strength {
    margin-top: 7px;
    font-size: 12px;
    color: #64748b;
}

.strength-bar {
    height: 5px;
    margin-top: 5px;
    background: #e2e8f0;
    border-radius: 10px;
    overflow: hidden;
}

.strength-fill {
    width: 0%;
    height: 100%;
    transition: 0.3s;
}

/* Password mismatch */
.password-message {
    margin-top: 5px;
    font-size: 12px;
}

/* Terms */
.terms {
    display: flex;
    align-items: flex-start;
    gap: 8px;
    margin: 20px 0;
    font-size: 13px;
    color: #64748b;
}

.terms input {
    margin-top: 2px;
    cursor: pointer;
}

/* Button */
.signup-btn {
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

.signup-btn:hover {
    background: #1d4ed8;
    transform: translateY(-1px);
    box-shadow: 0 5px 15px rgba(37, 99, 235, 0.25);
}

.signup-btn:active {
    transform: translateY(0);
}

/* Login */
.login-section {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
    color: #64748b;
}

.login-section a {
    color: #2563eb;
    text-decoration: none;
    font-weight: bold;
}

.login-section a:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 600px) {
    .signup-container {
        padding: 25px 20px;
    }

    .row {
        flex-direction: column;
        gap: 0;
    }
}
</style>
</head>

<body>

<div class="signup-container">

    <%
    String message = (String) request.getAttribute("message");

    if (message != null) {
    %>

    <p><%= message %></p>

    <%
    }
    %>

    <!-- Header -->
    <div class="header">
        <div class="logo">S</div>
        <h1>Create Account</h1>
        <p>Register your student account</p>
    </div>

    <!-- Signup Form -->
    <form action="signup" method="post" onsubmit="return validateForm()">

        <!-- Name -->
        <div class="form-group">
            <label for="sname">
                Full Name <span class="required">*</span>
            </label>
            <input type="text" id="sname" name="sname" class="input-box"
                placeholder="Enter your full name" required>
        </div>

        <!-- Phone + Email -->
        <div class="row">

            <div class="form-group">
                <label for="phone">
                    Phone Number <span class="required">*</span>
                </label>
                <input type="tel" id="phone" name="phone" class="input-box"
                    placeholder="10-digit number" maxlength="10"
                    pattern="[0-9]{10}" required>
            </div>

            <div class="form-group">
                <label for="email">
                    Email <span class="required">*</span>
                </label>
                <input type="email" id="email" name="email" class="input-box"
                    placeholder="example@gmail.com" required>
            </div>

        </div>

        <!-- Branch -->
        <div class="form-group">
            <label for="branch">
                Branch <span class="required">*</span>
            </label>
            <select id="branch" name="branch" class="input-box" required>
                <option value="">Select your branch</option>
                <option value="CSE">Computer Science Engineering</option>
                <option value="ECE">Electronics and Communication Engineering</option>
                <option value="EEE">Electrical and Electronics Engineering</option>
                <option value="ME">Mechanical Engineering</option>
                <option value="CIVIL">Civil Engineering</option>
            </select>
        </div>

        <!-- Location -->
        <div class="form-group">
            <label for="location">
                Location <span class="required">*</span>
            </label>
            <input type="text" id="location" name="location" class="input-box"
                placeholder="Enter your city/location" required>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="password">
                Password <span class="required">*</span>
            </label>

            <div class="password-wrapper">
                <input type="password" id="password" name="password"
                    class="input-box" placeholder="Create a password" required
                    oninput="checkPasswordStrength()">

                <button type="button" class="show-password"
                    onclick="togglePassword('password', this)">Show</button>
            </div>

            <div class="password-strength">
                <span id="strengthText">Password strength</span>

                <div class="strength-bar">
                    <div id="strengthFill" class="strength-fill"></div>
                </div>
            </div>
        </div>

        <!-- Confirm Password -->
        <div class="form-group">
            <label for="confirmPassword">
                Confirm Password <span class="required">*</span>
            </label>

            <div class="password-wrapper">
                <input type="password" id="confirmPassword"
                    name="confirmPassword" class="input-box"
                    placeholder="Re-enter your password" required
                    oninput="checkPasswordMatch()">

                <button type="button" class="show-password"
                    onclick="togglePassword('confirmPassword', this)">Show</button>
            </div>

            <div id="passwordMessage" class="password-message"></div>
        </div>

        <!-- Terms -->
        <div class="terms">
            <input type="checkbox" id="terms" required>
            <label for="terms">
                I confirm that the information provided by me is correct.
            </label>
        </div>

        <!-- Submit -->
        <button type="submit" class="signup-btn">Create Account</button>

    </form>

    <!-- Login Link -->
    <div class="login-section">
        Already have an account? <a href="login.jsp">Login here</a>
    </div>

</div>

<!-- JavaScript -->
<script>

/* Show / Hide Password */
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

/* Password Strength */
function checkPasswordStrength() {
    const password = document.getElementById("password").value;
    const strengthText = document.getElementById("strengthText");
    const strengthFill = document.getElementById("strengthFill");

    let strength = 0;

    if (password.length >= 6) {
        strength++;
    }

    if (password.match(/[A-Z]/)) {
        strength++;
    }

    if (password.match(/[0-9]/)) {
        strength++;
    }

    if (password.match(/[^A-Za-z0-9]/)) {
        strength++;
    }

    if (password.length === 0) {
        strengthText.innerText = "Password strength";
        strengthFill.style.width = "0%";
    } else if (strength <= 1) {
        strengthText.innerText = "Weak password";
        strengthFill.style.width = "25%";
    } else if (strength === 2) {
        strengthText.innerText = "Medium password";
        strengthFill.style.width = "50%";
    } else if (strength === 3) {
        strengthText.innerText = "Good password";
        strengthFill.style.width = "75%";
    } else {
        strengthText.innerText = "Strong password";
        strengthFill.style.width = "100%";
    }
}

/* Password Match */
function checkPasswordMatch() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value
    const message = document.getElementById("passwordMessage");

    if (confirmPassword.length === 0) {
        message.innerText = "";
        return;
    }

    if (password === confirmPassword) {
        message.innerText = "Passwords match";
        message.style.color = "#16a34a";
    } else {
        message.innerText = "Passwords do not match";
        message.style.color = "#dc2626";
    }
}

/* Final Form Validation */
function validateForm() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }

    return true;
}
</script>

</body>
</html>

