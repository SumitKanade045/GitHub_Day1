<%@ page import="com.app.model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Give Marks</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
        }

        .header {
            background: #1f2937;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 450px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #1f2937;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #2563eb;
        }

        .btn {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 18px;
            text-decoration: none;
            color: #2563eb;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>Teacher Dashboard</h1>
</div>

<div class="container">

    <h2>Give Marks</h2>

    <form action="saveMarks" method="post">

        <label>Roll Number</label>
        <input type="number"
               name="rollno"
               value="<%= student.getRollno() %>"
               readonly>

        <label>Student Name</label>
        <input type="text"
               name="studentName"
               value="<%= student.getName() %>"
               readonly>

        <label>Subject</label>
        <select name="subject" required>
            <option value="">-- Select Subject --</option>
            <option value="Java">Java</option>
            <option value="Spring">Spring</option>
            <option value="Database">Database</option>
            <option value="Python">Python</option>
        </select>

        <label>Marks</label>
        <input type="number"
               name="marks"
               min="0"
               max="100"
               placeholder="Enter marks"
               required>

        <button type="submit" class="btn">
            Save Marks
        </button>

    </form>

    <a href="teacherDashboard" class="back">
        ← Back to Teacher Dashboard
    </a>

</div>

</body>
</html>