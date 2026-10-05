<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.app.model.Student"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Teacher Dashboard</title>

<style>

/* ================= GENERAL ================= */

* {
    box-sizing: border-box;
}

body {
    margin: 0;

    font-family: Arial, sans-serif;

    background: #f4f6f9;

    color: #333;
}


/* ================= HEADER ================= */

.header {

    height: 70px;

    background: linear-gradient(135deg, #11998e, #38ef7d);

    color: white;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 35px;

    box-shadow: 0 3px 10px rgba(0,0,0,0.15);
}

.header h2 {

    margin: 0;

    font-size: 24px;
}

.logout {

    background: white;

    color: #11998e;

    text-decoration: none;

    padding: 10px 20px;

    border-radius: 6px;

    font-weight: bold;

    transition: 0.3s;
}

.logout:hover {

    background: #eeeeee;
}


/* ================= CONTAINER ================= */

.container {

    width: 92%;

    margin: 35px auto;
}


/* ================= WELCOME ================= */

.welcome {

    background: white;

    padding: 25px;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

    margin-bottom: 25px;
}

.welcome h1 {

    margin: 0 0 8px;

    color: #333;
}

.welcome p {

    margin: 0;

    color: #777;

    font-size: 15px;
}


/* ================= CARDS ================= */

.cards {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 20px;

    margin-bottom: 30px;
}

.card {

    background: white;

    padding: 25px;

    border-radius: 10px;

    text-align: center;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);
}

.card-icon {

    font-size: 40px;

    margin-bottom: 10px;
}

.card h3 {

    margin: 5px 0 10px;

    color: #555;
}

.card p {

    margin: 0;

    font-size: 30px;

    font-weight: bold;

    color: #11998e;
}


/* ================= TABLE ================= */

.table-container {

    background: white;

    padding: 25px;

    border-radius: 10px;

    box-shadow: 0 3px 12px rgba(0,0,0,0.1);

    overflow-x: auto;
}

.table-container h2 {

    margin-top: 0;

    margin-bottom: 20px;

    color: #333;
}

.student-table {

    width: 100%;

    border-collapse: collapse;

    min-width: 1050px;
}

.student-table th {

    background: #11998e;

    color: white;

    padding: 14px;

    text-align: left;
}

.student-table td {

    padding: 14px;

    border-bottom: 1px solid #ddd;
}

.student-table tr:hover {

    background: #f5f5f5;
}


/* ================= BUTTONS ================= */

.action-buttons {

    display: flex;

    gap: 7px;

    flex-wrap: wrap;
}

.attendance-btn {

    background: #11998e;

    color: white;

    padding: 7px 10px;

    border-radius: 5px;

    text-decoration: none;

    font-size: 13px;
}

.attendance-btn:hover {

    background: #0d7d74;
}


.marks-btn {

    background: #667eea;

    color: white;

    padding: 7px 10px;

    border-radius: 5px;

    text-decoration: none;

    font-size: 13px;
}

.marks-btn:hover {

    background: #5568d9;
}


.performance-btn {

    background: #f39c12;

    color: white;

    padding: 7px 10px;

    border-radius: 5px;

    text-decoration: none;

    font-size: 13px;
}

.performance-btn:hover {

    background: #d68910;
}


/* ================= EMPTY ================= */

.no-data {

    text-align: center;

    padding: 30px;

    color: #777;

    font-size: 16px;
}


/* ================= RESPONSIVE ================= */

@media (max-width: 900px) {

    .cards {

        grid-template-columns: 1fr;

    }

    .container {

        width: 95%;

    }

    .header {

        padding: 0 15px;

    }

}

</style>

</head>


<body>


<!-- ================= HEADER ================= -->

<div class="header">

    <h2>Teacher Dashboard</h2>

    <a href="logout" class="logout">
        Logout
    </a>

</div>


<!-- ================= MAIN ================= -->

<div class="container">


    <!-- ================= WELCOME ================= -->

    <div class="welcome">

        <h1>
            Welcome Teacher!
        </h1>

        <p>
            View students, mark attendance,
            give marks and check performance.
        </p>

    </div>


    <%

        List<Student> students =
            (List<Student>)
            request.getAttribute("students");

        int studentCount = 0;

        if (students != null) {

            studentCount =
                students.size();

        }

    %>


    <!-- ================= CARDS ================= -->

    <div class="cards">


        <div class="card">

            <div class="card-icon">
                👨‍🎓
            </div>

            <h3>
                Total Students
            </h3>

            <p>
                <%= studentCount %>
            </p>

        </div>


        <div class="card">

            <div class="card-icon">
                📝
            </div>

            <h3>
                Attendance
            </h3>

            <p>
                ✓
            </p>

        </div>


        <div class="card">

            <div class="card-icon">
                📊
            </div>

            <h3>
                Performance
            </h3>

            <p>
                ✓
            </p>

        </div>

    </div>


    <!-- ================= STUDENT TABLE ================= -->

    <div class="table-container">

        <h2>
            All Students
        </h2>


        <table class="student-table">


            <tr>

                <th>
                    Roll No
                </th>

                <th>
                    Name
                </th>

                <th>
                    Mobile
                </th>

                <th>
                    City
                </th>

                <th>
                    Username
                </th>

                <th>
                    Action
                </th>

            </tr>


            <%

            if (students != null
                    && !students.isEmpty()) {

                for (Student stu : students) {

            %>


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


                <!-- ACTION -->

                <td>

                    <div class="action-buttons">


                        <!-- ATTENDANCE -->

                        <a href="markAttendance?rollno=<%= stu.getRollno() %>"
                           class="attendance-btn">

                            Attendance

                        </a>


                        <!-- MARKS -->

                        <a href="giveMarks?rollno=<%= stu.getRollno() %>"
                           class="marks-btn">

                            Give Marks

                        </a>


                        <!-- PERFORMANCE -->

                        <a href="performance?rollno=<%= stu.getRollno() %>"
                           class="performance-btn">

                            Performance

                        </a>


                    </div>

                </td>


            </tr>


            <%

                }

            } else {

            %>


            <tr>

                <td colspan="6"
                    class="no-data">

                    No students registered yet.

                </td>

            </tr>


            <%

            }

            %>


        </table>

    </div>


</div>


</body>

</html>