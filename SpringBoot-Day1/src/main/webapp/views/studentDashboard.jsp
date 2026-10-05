<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.app.model.Student" %>
<%@ page import="com.app.model.Marks" %>
<%@ page import="com.app.model.Attendance" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Student Dashboard</title>

<style>

* {
    box-sizing: border-box;
}

body {

    margin: 0;

    font-family: Arial, sans-serif;

    background: #f4f6f9;

}

/* Header */

.header {

    height: 70px;

    background: linear-gradient(135deg, #667eea, #764ba2);

    color: white;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 40px;

}

.header h2 {

    margin: 0;

}

.logout {

    background: white;

    color: #667eea;

    padding: 10px 20px;

    text-decoration: none;

    border-radius: 6px;

    font-weight: bold;

}

.logout:hover {

    background: #eeeeee;

}


/* Main Container */

.container {

    width: 90%;

    margin: 40px auto;

}


/* Welcome */

.welcome {

    background: white;

    padding: 25px;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

    margin-bottom: 25px;

}

.welcome h1 {

    margin: 0 0 10px;

    color: #333;

}

.welcome p {

    color: #777;

    margin: 0;

}


/* Cards */

.cards {

    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 20px;

    margin-bottom: 25px;

}

.card {

    background: white;

    padding: 25px;

    text-align: center;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

}

.card h3 {

    color: #444;

    margin: 10px 0;

}

.card p {

    color: #777;

}

.icon {

    font-size: 35px;

}


/* Common Section */

.section {

    background: white;

    padding: 30px;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

    margin-bottom: 25px;

}

.section h2 {

    text-align: center;

    color: #333;

    margin-top: 0;

    margin-bottom: 25px;

}


/* Student Information */

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

    width: 35%;

    font-weight: bold;

    color: #555;

}


/* Data Tables */

.data-table {

    width: 100%;

    border-collapse: collapse;

}

.data-table th {

    background: #667eea;

    color: white;

    padding: 14px;

    text-align: center;

}

.data-table td {

    padding: 13px;

    text-align: center;

    border-bottom: 1px solid #ddd;

}

.data-table tr:hover {

    background: #f5f5f5;

}


/* Performance */

.performance-box {

    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 20px;

}

.performance-card {

    text-align: center;

    padding: 20px;

    border-radius: 10px;

    background: #f4f6f9;

}

.performance-card h3 {

    margin: 5px;

    color: #444;

}

.performance-card p {

    font-size: 25px;

    font-weight: bold;

    color: #667eea;

}


/* Mobile */

@media (max-width: 700px) {

    .container {

        width: 95%;

    }

    .cards {

        grid-template-columns: 1fr;

    }

    .performance-box {

        grid-template-columns: 1fr;

    }

    .header {

        padding: 0 15px;

    }

    .section {

        overflow-x: auto;

    }

}

</style>

</head>


<body>


<%

    Student student =
        (Student) request.getAttribute("student");

    List<Marks> marksList =
        (List<Marks>) request.getAttribute("marksList");

    List<Attendance> attendanceList =
        (List<Attendance>) request.getAttribute("attendanceList");

%>


<!-- Header -->

<div class="header">

    <h2>Student Portal</h2>

    <a href="logout" class="logout">
        Logout
    </a>

</div>


<div class="container">


<!-- Welcome -->

<div class="welcome">

    <h1>
        Welcome, <%= student.getName() %>!
    </h1>

    <p>
        Welcome to your Student Dashboard.
        You can view your marks, attendance and performance here.
    </p>

</div>


<!-- Cards -->

<div class="cards">


    <div class="card">

        <div class="icon">👨‍🎓</div>

        <h3>Roll Number</h3>

        <p>
            <%= student.getRollno() %>
        </p>

    </div>


    <div class="card">

        <div class="icon">📊</div>

        <h3>Marks</h3>

        <p>
            View Your Marks
        </p>

    </div>


    <div class="card">

        <div class="icon">📅</div>

        <h3>Attendance</h3>

        <p>
            View Your Attendance
        </p>

    </div>

</div>


<!-- Student Information -->

<div class="section">

    <h2>Student Information</h2>

    <table class="student-table">


        <tr>

            <td>Roll Number</td>

            <td>
                <%= student.getRollno() %>
            </td>

        </tr>


        <tr>

            <td>Name</td>

            <td>
                <%= student.getName() %>
            </td>

        </tr>


        <tr>

            <td>Mobile Number</td>

            <td>
                <%= student.getMobo() %>
            </td>

        </tr>


        <tr>

            <td>City</td>

            <td>
                <%= student.getCity() %>
            </td>

        </tr>


        <tr>

            <td>Username</td>

            <td>
                <%= student.getUsername() %>
            </td>

        </tr>

    </table>

</div>



<!-- MARKS SECTION -->

<div class="section">

    <h2>📊 My Marks</h2>


    <table class="data-table">

        <tr>

            <th>Roll No</th>

            <th>Subject</th>

            <th>Marks</th>

        </tr>


<%

if (marksList != null) {

    boolean foundMarks = false;

    for (Marks mark : marksList) {

        if (mark.getRollno() == student.getRollno()) {

            foundMarks = true;

%>

        <tr>

            <td>
                <%= mark.getRollno() %>
            </td>

            <td>
                <%= mark.getSubject() %>
            </td>

            <td>
                <%= mark.getMarks() %>
            </td>

        </tr>

<%

        }

    }

    if (!foundMarks) {

%>

        <tr>

            <td colspan="3">
                No marks available
            </td>

        </tr>

<%

    }

}

%>

    </table>

</div>



<!-- ATTENDANCE SECTION -->

<div class="section">

    <h2>📅 My Attendance</h2>


    <table class="data-table">

        <tr>

            <th>Subject</th>

            <th>Date</th>

            <th>Lecture Time</th>

            <th>Status</th>

        </tr>


<%

if (attendanceList != null) {

    boolean foundAttendance = false;

    for (Attendance attendance : attendanceList) {

        if (attendance.getRollno() == student.getRollno()) {

            foundAttendance = true;

%>

        <tr>

            <td>
                <%= attendance.getSubject() %>
            </td>

            <td>
                <%= attendance.getDate() %>
            </td>

            <td>
                <%= attendance.getLectureTime() %>
            </td>

            <td>
                <%= attendance.getStatus() %>
            </td>

        </tr>

<%

        }

    }

    if (!foundAttendance) {

%>

        <tr>

            <td colspan="4">
                No attendance available
            </td>

        </tr>

<%

    }

}

%>

    </table>

</div>



<!-- PERFORMANCE SECTION -->

<div class="section">

    <h2>📈 My Performance</h2>


    <div class="performance-box">


        <div class="performance-card">

            <h3>Total Subjects</h3>

            <p>

<%

int totalSubjects = 0;

if (marksList != null) {

    for (Marks mark : marksList) {

        if (mark.getRollno() == student.getRollno()) {

            totalSubjects++;

        }

    }

}

%>

                <%= totalSubjects %>

            </p>

        </div>


        <div class="performance-card">

            <h3>Total Marks</h3>

            <p>

<%

int totalMarks = 0;

if (marksList != null) {

    for (Marks mark : marksList) {

        if (mark.getRollno() == student.getRollno()) {

            totalMarks += mark.getMarks();

        }

    }

}

%>

                <%= totalMarks %>

            </p>

        </div>


        <div class="performance-card">

            <h3>Average Marks</h3>

            <p>

<%

double average = 0;

if (totalSubjects > 0) {

    average = (double) totalMarks / totalSubjects;

}

%>

                <%= String.format("%.2f", average) %>%

            </p>

        </div>


    </div>

</div>


</div>

</body>

</html>