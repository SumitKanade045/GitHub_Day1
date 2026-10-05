<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Logout</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;

    background: linear-gradient(135deg, #667eea, #764ba2);

    height: 100vh;

    display: flex;
    justify-content: center;
    align-items: center;
}

.logout-box {
    width: 420px;

    background: white;

    padding: 40px;

    text-align: center;

    border-radius: 12px;

    box-shadow: 0 5px 25px rgba(0,0,0,0.2);
}

.logout-box h1 {
    color: #333;

    margin-bottom: 15px;
}

.logout-box p {
    color: #777;

    margin-bottom: 30px;
}

.login-btn {
    display: inline-block;

    padding: 12px 30px;

    background: #667eea;

    color: white;

    text-decoration: none;

    border-radius: 6px;

    font-size: 16px;
}

.login-btn:hover {
    background: #5568d9;
}

</style>

</head>

<body>

<div class="logout-box">

    <h1>Logout Successful</h1>

    <p>
        You have been successfully logged out.
    </p>

    <a href="/" class="login-btn">
        Login Again
    </a>

</div>

</body>

</html>