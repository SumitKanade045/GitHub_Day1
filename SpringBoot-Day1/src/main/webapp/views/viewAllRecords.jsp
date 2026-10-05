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

<title>All Student Records</title>

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

    background: linear-gradient(135deg, #1e3c72, #2a5298);

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

    color: #1e3c72;

    padding: 10px 20px;

    text-decoration: none;

    border-radius: 6px;

    font-weight: bold;

}


/* CONTAINER */

.container {

    width: 95%;

    margin: 35px auto;

}


/* SECTION */

.section {

    background: white;

    padding: 25px;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

    margin-bottom: 30px;

}

.section h2 {

    text-align: center;

    color: #333;

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

    min-width: 800px;

}

th {

    background: #2a5298;

    color: white;

    padding: 14px;

    text-align: center;

}

td {

    padding: 13px;

    text-align: center;

    border-bottom: 1px solid #ddd;

}

tr:hover {

    background: #f5f5f5;

}


/* BACK BUTTON */

.back {

    display: inline-block;

    padding: 12px 25px;

    background: #555;

    color: white;

    text-decoration: none;

    border-radius: 6px;

    margin-bottom: 25px;

}

.back:hover {

    background: #333;

}


/* PRESENT */

.present {

    color: green;

    font-weight: bold;

}


/* ABSENT */

.absent {

    color: red;

    font-weight: bold;

}

</style>

</head>


<body>


<%

List<Student> students =
    (List<Student>) request.getAttribute("students");

List<Marks> marksList =
    (List<Marks>) request.getAttribute("marksList");

List<Attendance> attendanceList =
    (List<Attendance>) request.getAttribute("attendanceList");

%>


<!-- HEADER -->

<div class="header">

    <h2>Admin Dashboard</h2>

    <a href="logout" class="logout">
        Logout
    </a>

</div>


<div class="container">


<a href="adminDashboard" class="back">
    ← Back to Dashboard
</a>


<!-- STUDENT DETAILS -->

<div class="section">

    <h2>👨‍🎓 All Student Details</h2>

    <div class="table-container">

        <table>

            <tr>

                <th>Roll No</th>

                <th>Name</th>

                <th>Mobile</th>

                <th>City</th>

                <th>Username</th>

                <th>Password</th>

            </tr>


<%

if (students != null) {

    for (Student stu : students) {

%>

            <tr>

                <td>
                    <%= stu.getRollno() %>
                </td>

                <td>
                    <%= stu.getName() %>
                </td>

                <td>
                    <%= stu.getMobo() %>
                </td>

                <td>
                    <%= stu.getCity() %>
                </td>

                <td>
                    <%= stu.getUsername() %>
                </td>

                <td>
                    <%= stu.getPassword() %>
                </td>

            </tr>

<%

    }

}

%>

        </table>

    </div>

</div>



<!-- ALL MARKS -->

<div class="section">

    <h2>📊 All Student Marks</h2>

    <div class="table-container">

        <table>

            <tr>

                <th>Roll No</th>

                <th>Student Name</th>

                <th>Subject</th>

                <th>Marks</th>

            </tr>


<%

if (marksList != null && !marksList.isEmpty()) {

    for (Marks mark : marksList) {

%>

            <tr>

                <td>
                    <%= mark.getRollno() %>
                </td>

                <td>
                    <%= mark.getStudentName() %>
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

} else {

%>

            <tr>

                <td colspan="4">
                    No Marks Available
                </td>

            </tr>

<%

}

%>

        </table>

    </div>

</div>



<!-- ALL ATTENDANCE -->

<div class="section">

    <h2>📅 All Student Attendance</h2>

    <div class="table-container">

        <table>

            <tr>

                <th>Roll No</th>

                <th>Student Name</th>

                <th>Subject</th>

                <th>Date</th>

                <th>Lecture Time</th>

                <th>Status</th>

            </tr>


<%

if (attendanceList != null && !attendanceList.isEmpty()) {

    for (Attendance att : attendanceList) {

%>

            <tr>

                <td>
                    <%= att.getRollno() %>
                </td>

                <td>
                    <%= att.getStudentName() %>
                </td>

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

<%

if ("Present".equalsIgnoreCase(att.getStatus())) {

%>

                    <span class="present">
                        Present
                    </span>

<%

} else {

%>

                    <span class="absent">
                        Absent
                    </span>

<%

}

%>

                </td>

            </tr>

<%

    }

} else {

%>

            <tr>

                <td colspan="6">
                    No Attendance Available
                </td>

            </tr>

<%

}

%>

        </table>

    </div>

</div>


</div>

</body>

</html>