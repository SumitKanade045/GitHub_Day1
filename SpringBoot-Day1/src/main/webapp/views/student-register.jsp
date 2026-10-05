<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Student Registration</title>

<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f4f6f9;
}

.container {
	width: 550px;
	margin: 40px auto;
	background: white;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
}

h1 {
	text-align: center;
	color: #333;
	margin-bottom: 25px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 6px;
}

input {
	width: 100%;
	padding: 11px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 15px;
}

.register-btn {
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	background: #667eea;
	color: white;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
}

.login-link {
	text-align: center;
	margin-top: 20px;
}

.login-link a {
	color: #667eea;
	text-decoration: none;
}
</style>

</head>

<body>

	<div class="container">

		<h1>Student Registration</h1>


		<form action="/registerStudent" method="post">

			<div class="form-group">

				<label>Roll Number</label> <input type="number" name="rollno"
					required>

			</div>


			<div class="form-group">

				<label>Name</label> <input type="text" name="name" required>

			</div>


			<div class="form-group">

				<label>Mobile Number</label> <input type="number" name="mobo"
					required>

			</div>


			<div class="form-group">

				<label>City</label> <input type="text" name="city" required>

			</div>


			<div class="form-group">

				<label>Username</label> <input type="text" name="username" required>

			</div>


			<div class="form-group">

				<label>Password</label> <input type="password" name="password"
					required>

			</div>


			<button type="submit" class="register-btn">Register Student
			</button>

		</form>


		<div class="login-link">

			Already registered? <a href="/"> Login Here </a>

		</div>

	</div>

</body>
</html>