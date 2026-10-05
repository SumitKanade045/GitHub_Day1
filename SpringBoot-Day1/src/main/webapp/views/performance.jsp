<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.app.model.Student"%>
<%@ page import="com.app.model.Marks"%>
<%@ page import="com.app.model.Attendance"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Performance</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}


/* HEADER */

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


/* CONTAINER */

.container {
    width: 90%;
    margin: 40px auto;
}


/* STUDENT */

.student-box {

    background: white;

    padding: 25px;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

    margin-bottom: 25px;

}

.student-box h1 {
    margin: 0 0 10px;
}

.student-box p {
    color: #777;
}


/* CARDS */

.cards {

    display: grid;

    grid-template-columns: repeat(4, 1fr);

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

    margin: 10px 0;

    color: #444;

}

.card p {

    font-size: 25px;

    font-weight: bold;

    color: #667eea;

}

.icon {
    font-size: 35px;
}


/* SECTION */

.section {

    background: white;

    padding: 30px;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

    margin-bottom: 25px;

}

.section h2 {

    text-align: center;

    margin-top: 0;

    margin-bottom: 25px;

}


/* TABLE */

.table-container {

    overflow-x: auto;

}

table {

    width: 100%;

    border-collapse: collapse;

}

th {

    background: #667eea;

    color: white;

    padding: 14px;

}

td {

    padding: 13px;

    text-align: center;

    border-bottom: 1px solid #ddd;

}


/* PERFORMANCE */

.result {

    text-align: center;

    padding: 25px;

    background: #f4f6f9;

    border-radius: 10px;

}

.result h2 {

    color: #444;

}

.result .performance {

    font-size: 30px;

    font-weight: bold;

    color: #667eea;

}


/* MOBILE */

@media(max-width:800px) {

    .cards {

        grid-template-columns: repeat(2,1fr);

    }

    .container {

        width: 95%;

    }

}

@media(max-width:500px) {

    .cards {

        grid-template-columns: 1fr;

    }

    .header {

        padding: 0 15px;

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


double totalMarks = 0;

int marksCount = 0;

int presentCount = 0;

int attendanceCount = 0;


/* MARKS */

if (marksList != null) {

    for (Marks mark : marksList) {

        if (mark.getRollno() == student.getRollno()) {

            totalMarks += mark.getMarks();

            marksCount++;

        }

    }

}


/* ATTENDANCE */

if (attendanceList != null) {

    for (Attendance att : attendanceList) {

        if (att.getRollno() == student.getRollno()) {

            attendanceCount++;

            if ("Present".equalsIgnoreCase(att.getStatus())) {

                presentCount++;

            }

        }

    }

}


double averageMarks = 0;

if (marksCount > 0) {

    averageMarks = totalMarks / marksCount;

}


double attendancePercentage = 0;

if (attendanceCount > 0) {

    attendancePercentage =
        ((double) presentCount / attendanceCount) * 100;

}


/* OVERALL PERFORMANCE */

String performance;

if (averageMarks >= 80 && attendancePercentage >= 75) {

    performance = "Excellent";

}
else if (averageMarks >= 60 && attendancePercentage >= 60) {

    performance = "Good";

}
else if (averageMarks >= 35 && attendancePercentage >= 50) {

    performance = "Average";

}
else {

    performance = "Needs Improvement";

}

%>


<!-- HEADER -->

<div class="header">

    <h2>Student Portal</h2>

    <a href="logout" class="logout">
        Logout
    </a>

</div>


<div class="container">


<!-- STUDENT -->

<div class="student-box">

    <h1>
        <%= student.getName() %>
    </h1>

    <p>
        Roll Number:
        <%= student.getRollno() %>
    </p>

</div>


<!-- CARDS -->

<div class="cards">


    <div class="card">

        <div class="icon">📚</div>

        <h3>Total Subjects</h3>

        <p>
            <%= marksCount %>
        </p>

    </div>


    <div class="card">

        <div class="icon">🏆</div>

        <h3>Total Marks</h3>

        <p>
            <%= totalMarks %>
        </p>

    </div>


    <div class="card">

        <div class="icon">📊</div>

        <h3>Average Marks</h3>

        <p>
            <%= String.format("%.2f", averageMarks) %>
        </p>

    </div>


    <div class="card">

        <div class="icon">📅</div>

        <h3>Attendance</h3>

        <p>
            <%= String.format("%.2f", attendancePercentage) %>%
        </p>

    </div>


</div>


<!-- MARKS -->

<div class="section">

    <h2>📊 Subject Wise Marks</h2>

    <div class="table-container">

    <table>

        <tr>

            <th>Subject</th>

            <th>Marks</th>

        </tr>


<%

if (marksList != null) {

    for (Marks mark : marksList) {

        if (mark.getRollno() == student.getRollno()) {

%>

        <tr>

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

}

%>

    </table>

    </div>

</div>


<!-- ATTENDANCE -->

<div class="section">

    <h2>📅 Attendance Details</h2>

    <div class="table-container">

    <table>

        <tr>

            <th>Subject</th>

            <th>Date</th>

            <th>Lecture Time</th>

            <th>Status</th>

        </tr>


<%

if (attendanceList != null) {

    for (Attendance att : attendanceList) {

        if (att.getRollno() == student.getRollno()) {

%>

        <tr>

            <td>
                <%= att.getSubject() %>
            </td>

            <td>
                <%= att.getDate() %>
            </td>

            <td>
                <%= att.getLectureTime() %>
            </td>

            <td>
                <%= att.getStatus() %>
            </td>

        </tr>

<%

        }

    }

}

%>

    </table>

    </div>

</div>


<!-- OVERALL PERFORMANCE -->

<div class="section">

    <div class="result">

        <h2>📈 Overall Performance</h2>

        <p>
            Average Marks:
            <b><%= String.format("%.2f", averageMarks) %></b>
        </p>

        <p>
            Attendance:
            <b><%= String.format("%.2f", attendancePercentage) %>%</b>
        </p>

        <p class="performance">
            <%= performance %>
        </p>

    </div>

</div>


</div>

</body>

</html>