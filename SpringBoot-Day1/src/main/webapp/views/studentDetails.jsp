<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.app.model.Student"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Registration Successful</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f4f6f9;
}

.container {
	width: 600px;
	margin: 50px auto;
	background: white;
	padding: 35px;
	border-radius: 12px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
}

.success {
	text-align: center;
	color: #27ae60;
	font-size: 25px;
	margin-bottom: 10px;
}

.message {
	text-align: center;
	color: #777;
	margin-bottom: 30px;
}

.student-table {
	width: 100%;
	border-collapse: collapse;
}

.student-table tr {
	border-bottom: 1px solid #ddd;
}

.student-table td {
	padding: 15px;
}

.student-table td:first-child {
	width: 40%;
	font-weight: bold;
	color: #444;
}

.student-table td:last-child {
	color: #333;
}

.buttons {
	display: flex;
	gap: 15px;
	margin-top: 30px;
}

.btn {
	flex: 1;
	padding: 12px;
	text-align: center;
	text-decoration: none;
	border-radius: 6px;
	color: white;
	font-size: 16px;
}

.login-btn {
	background: #667eea;
}

.home-btn {
	background: #777;
}
</style>

</head>

<body>

	<%
	Student student = (Student) request.getAttribute("student");
	%>


	<div class="container">

		<div class="success">Registration Successful!</div>

		<div class="message">Your student account has been created
			successfully.</div>


		<table class="student-table">

			<tr>

				<td>Roll Number</td>

				<td><%=student.getRollno()%></td>

			</tr>


			<tr>

				<td>Name</td>

				<td><%=student.getName()%></td>

			</tr>


			<tr>

				<td>Mobile Number</td>

				<td><%=student.getMobo()%></td>

			</tr>


			<tr>

				<td>City</td>

				<td><%=student.getCity()%></td>

			</tr>


			<tr>

				<td>Username</td>

				<td><%=student.getUsername()%></td>

			</tr>


			<tr>

				<td>Password</td>

				<td><%=student.getPassword()%></td>

			</tr>

		</table>


		<div class="buttons">

			<a href="/" class="btn login-btn"> Go To Login </a> <a href="/"
				class="btn home-btn"> Home </a>

		</div>

	</div>

</body>

</html>