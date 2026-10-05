<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.app.model.Student"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Give Marks</title>

<style>

body {
    margin: 0;
    font-family: Arial;
    background: #f4f6f9;
}

.container {
    width: 500px;
    margin: 50px auto;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.15);
}

h1 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 18px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 7px;
}

input, select {
    width: 100%;
    padding: 11px;
    border: 1px solid #ccc;
    border-radius: 6px;
}

button {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 6px;
    background: #667eea;
    color: white;
    font-size: 16px;
}

</style>

</head>

<body>

<%
    Student student =
        (Student) request.getAttribute("student");
%>

<div class="container">

    <h1>Give Student Marks</h1>

    <form action="saveMarks" method="post">

        <div class="form-group">

            <label>Roll Number</label>

            <input type="number"
                   name="rollno"
                   value="<%= student.getRollno() %>"
                   readonly>

        </div>

        <div class="form-group">

            <label>Student Name</label>

            <input type="text"
                   value="<%= student.getName() %>"
                   readonly>

            <input type="hidden"
                   name="studentName"
                   value="<%= student.getName() %>">

        </div>

        <div class="form-group">

            <label>Subject</label>

            <select name="subject" required>

                <option value="">Select Subject</option>

                <option value="Java">
                    Java
                </option>

                <option value="Spring">
                    Spring
                </option>

                <option value="Database">
                    Database
                </option>

                <option value="Python">
                    Python
                </option>

            </select>

        </div>

        <div class="form-group">

            <label>Marks</label>

            <input type="number"
                   name="marks"
                   min="0"
                   max="100"
                   step="0.01"
                   placeholder="Enter marks"
                   required>

        </div>

        <button type="submit">
            Save Marks
        </button>

    </form>

</div>

</body>

</html>