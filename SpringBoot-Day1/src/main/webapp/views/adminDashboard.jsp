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

<title>Admin Dashboard</title>

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

.logout:hover {
    background: #eeeeee;
}


/* MAIN CONTAINER */

.container {

    width: 95%;

    margin: 35px auto;

}


/* WELCOME */

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

    margin: 0;

    color: #777;

}


/* CARDS */

.cards {

    display: grid;

    grid-template-columns: repeat(4, 1fr);

    gap: 20px;

    margin-bottom: 30px;

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

    margin: 0;

    font-size: 25px;

    font-weight: bold;

    color: #2a5298;

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

}

.section h2 {

    text-align: center;

    color: #333;

    margin-top: 0;

    margin-bottom: 25px;

}


/* TABLE CONTAINER */

.table-container {

    width: 100%;

    overflow-x: auto;

}


/* TABLE */

.data-table {

    width: 100%;

    min-width: 1400px;

    border-collapse: collapse;

}


/* TABLE HEADER */

.data-table th {

    background: #2a5298;

    color: white;

    padding: 14px;

    text-align: center;

    white-space: nowrap;

}


/* TABLE DATA */

.data-table td {

    padding: 13px;

    text-align: center;

    border-bottom: 1px solid #ddd;

    white-space: nowrap;

}


/* HOVER */

.data-table tr:hover {

    background: #f5f5f5;

}


/* PERFORMANCE */

.performance-excellent {

    font-weight: bold;

    color: green;

}

.performance-good {

    font-weight: bold;

    color: #2196f3;

}

.performance-average {

    font-weight: bold;

    color: orange;

}

.performance-poor {

    font-weight: bold;

    color: red;

}


/* ATTENDANCE */

.present {

    font-weight: bold;

    color: green;

}

.absent {

    font-weight: bold;

    color: red;

}


/* MOBILE */

@media (max-width: 900px) {

    .cards {

        grid-template-columns: repeat(2, 1fr);

    }

    .container {

        width: 95%;

    }

    .header {

        padding: 0 15px;

    }

}


@media (max-width: 600px) {

    .cards {

        grid-template-columns: 1fr;

    }

}

</style>

</head>


<body>


<%

/* GET DATA FROM CONTROLLER */

List<Student> students =
    (List<Student>) request.getAttribute("students");

List<Marks> marksList =
    (List<Marks>) request.getAttribute("marksList");

List<Attendance> attendanceList =
    (List<Attendance>) request.getAttribute("attendanceList");


/* TOTAL STUDENTS */

int studentCount = 0;

if (students != null) {

    studentCount = students.size();

}


/* TOTAL MARKS */

int marksCount = 0;

if (marksList != null) {

    marksCount = marksList.size();

}


/* TOTAL ATTENDANCE */

int attendanceCount = 0;

if (attendanceList != null) {

    attendanceCount = attendanceList.size();

}

%>


<!-- HEADER -->

<div class="header">

    <h2>Admin Dashboard</h2>

    <a href="logout" class="logout">
        Logout
    </a>

</div>


<!-- MAIN CONTAINER -->

<div class="container">


<!-- WELCOME -->

<div class="welcome">

    <h1>Welcome Admin!</h1>

    <p>
        Admin can view complete student information,
        marks, attendance and performance.
    </p>

</div>


<!-- CARDS -->

<div class="cards">


    <!-- STUDENTS -->

    <div class="card">

        <div class="icon">👨‍🎓</div>

        <h3>Total Students</h3>

        <p>
            <%= studentCount %>
        </p>

    </div>


    <!-- MARKS -->

    <div class="card">

        <div class="icon">📊</div>

        <h3>Total Marks</h3>

        <p>
            <%= marksCount %>
        </p>

    </div>


    <!-- ATTENDANCE -->

    <div class="card">

        <div class="icon">📅</div>

        <h3>Attendance Records</h3>

        <p>
            <%= attendanceCount %>
        </p>

    </div>


    <!-- STATUS -->

    <div class="card">

        <div class="icon">✅</div>

        <h3>System Status</h3>

        <p>Active</p>

    </div>


</div>


<!-- ALL STUDENT INFORMATION -->

<div class="section">

    <h2>📋 Complete Student Details</h2>


    <div class="table-container">


        <table class="data-table">


            <!-- TABLE HEADER -->

            <tr>

                <th>Roll No</th>

                <th>Student Name</th>

                <th>Mobile</th>

                <th>City</th>

                <th>Username</th>

                <th>Password</th>

                <th>Subject</th>

                <th>Marks</th>

                <th>Attendance</th>

                <th>Performance</th>

            </tr>


<%

/* STUDENT LOOP */

if (students != null && !students.isEmpty()) {


    for (Student stu : students) {


        String subject = "-";

        double marks = 0;

        String attendance = "-";


        /* FIND MARKS OF STUDENT */

        if (marksList != null) {

            for (Marks mark : marksList) {

                if (mark.getRollno() == stu.getRollno()) {

                    subject = mark.getSubject();

                    marks = mark.getMarks();

                    break;

                }

            }

        }


        /* FIND ATTENDANCE OF STUDENT */

        if (attendanceList != null) {

            for (Attendance att : attendanceList) {

                if (att.getRollno() == stu.getRollno()) {

                    attendance = att.getStatus();

                    break;

                }

            }

        }


        /* PERFORMANCE */

        String performance;

        if (marks >= 80) {

            performance = "Excellent";

        }

        else if (marks >= 60) {

            performance = "Good";

        }

        else if (marks >= 35) {

            performance = "Average";

        }

        else {

            performance = "Poor";

        }


        /* PERFORMANCE CSS CLASS */

        String performanceClass = "";

        if (performance.equals("Excellent")) {

            performanceClass = "performance-excellent";

        }

        else if (performance.equals("Good")) {

            performanceClass = "performance-good";

        }

        else if (performance.equals("Average")) {

            performanceClass = "performance-average";

        }

        else {

            performanceClass = "performance-poor";

        }


        /* ATTENDANCE CSS CLASS */

        String attendanceClass = "";

        if (attendance.equals("Present")) {

            attendanceClass = "present";

        }

        else if (attendance.equals("Absent")) {

            attendanceClass = "absent";

        }

%>


            <!-- STUDENT ONE ROW -->

            <tr>


                <!-- ROLL NO -->

                <td>
                    <%= stu.getRollno() %>
                </td>


                <!-- NAME -->

                <td>
                    <%= stu.getName() %>
                </td>


                <!-- MOBILE -->

                <td>
                    <%= stu.getMobo() %>
                </td>


                <!-- CITY -->

                <td>
                    <%= stu.getCity() %>
                </td>


                <!-- USERNAME -->

                <td>
                    <%= stu.getUsername() %>
                </td>


                <!-- PASSWORD -->

                <td>
                    <%= stu.getPassword() %>
                </td>


                <!-- SUBJECT -->

                <td>
                    <%= subject %>
                </td>


                <!-- MARKS -->

                <td>
                    <%= marks %>
                </td>


                <!-- ATTENDANCE -->

                <td class="<%= attendanceClass %>">
                    <%= attendance %>
                </td>


                <!-- PERFORMANCE -->

                <td class="<%= performanceClass %>">
                    <%= performance %>
                </td>


            </tr>


<%

    }

}

else {

%>


            <!-- NO STUDENT -->

            <tr>

                <td colspan="10">

                    No Student Found

                </td>

            </tr>


<%

}

%>


        </table>


    </div>

</div>


</div>


<div style="text-align:center; margin-top:25px;">

    <a href="viewAllRecords"
       style="
       display:inline-block;
       padding:12px 25px;
       background:#2a5298;
       color:white;
       text-decoration:none;
       border-radius:6px;
       font-weight:bold;
       ">

        View All Student Records

    </a>

</div>

</body>

</html>