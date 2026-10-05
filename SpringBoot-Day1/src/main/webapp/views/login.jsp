<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Login</title>

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);

    height: 100vh;

    display: flex;
    justify-content: center;
    align-items: center;
}

.login-box {
    width: 400px;

    background: white;

    padding: 35px;

    border-radius: 12px;

    box-shadow: 0 5px 25px rgba(0,0,0,0.2);
}

h1 {
    text-align: center;
    color: #333;
}

.subtitle {
    text-align: center;
    color: #777;
    margin-bottom: 25px;
}

.form-group {
    margin-bottom: 18px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 7px;
}

input,
select {
    width: 100%;
    padding: 12px;

    border: 1px solid #ccc;
    border-radius: 6px;

    font-size: 15px;
}

.login-btn {
    width: 100%;

    padding: 12px;

    border: none;
    border-radius: 6px;

    background: #667eea;

    color: white;

    font-size: 16px;

    cursor: pointer;
}

.login-btn:hover {
    background: #5568d9;
}

.register {
    text-align: center;
    margin-top: 20px;
}

.register a {
    color: #667eea;
    text-decoration: none;
}

.error {
    color: red;
    text-align: center;
    margin-bottom: 15px;
}

</style>

</head>

<body>

<div class="login-box">

    <h1>Login</h1>

    <div class="subtitle">
        Student Management System
    </div>

    <% if (request.getAttribute("error") != null) { %>

        <div class="error">
            <%= request.getAttribute("error") %>
        </div>

    <% } %>


    <form action="login" method="post">

        <div class="form-group">

            <label>Username</label>

            <input type="text"
                   name="username"
                   placeholder="Enter username"
                   required>

        </div>


        <div class="form-group">

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter password"
                   required>

        </div>


        <div class="form-group">

            <label>Select Role</label>

            <select name="role" required>

                <option value="">
                    -- Select Role --
                </option>

                <option value="admin">
                    Admin
                </option>

                <option value="teacher">
                    Teacher
                </option>

                <option value="student">
                    Student
                </option>

            </select>

        </div>


        <button type="submit" class="login-btn">
            Login
        </button>

    </form>


    <div class="register">

        New Student?

        <a href="student-register">
            Register Here
        </a>

    </div>

</div>

</body>
</html>