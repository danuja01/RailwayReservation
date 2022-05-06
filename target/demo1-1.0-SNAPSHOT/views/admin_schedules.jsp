<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Home</title>

    <!-- Bootstrap Style Sheet -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
    />

    <!-- Google fonts -->

    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700;900&family=Ubuntu:wght@300;400;700&display=swap"
            rel="stylesheet"
    />

    <!-- Bootstrap icons -->

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
    />

    <!-- Style Sheet -->

    <!-- Style Sheet -->
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700;900&display=swap");

        /* INDEX PAGE  */

        body {
            background: rgb(0, 29, 110);
            background-image: url("../img/wall.jpg");
            font-family: "Montserrat", sans-serif;
            height: auto;
        }

        .parent {
            background: #fff;
            background-image: url("../img/background.jpg");
            border-radius: 10px;
            width: 90%;
            padding: 10rem 5rem 5rem;
        }

        .header-title {
            font-size: 60px;
            position: relative;
            top: 2rem;
        }

        .header-title span {
            font-size: 50px;
            padding-bottom: 15px;
        }

        .header-btn {
            border-radius: 50px;
            padding: 8px 20px;
            margin-right: 8px;
            position: relative;
            top: 2rem;
        }

        .header-img {
            width: 40rem;
            position: relative;
            bottom: 5rem;
        }

        /* Home Page */

        .parent-home {
            background: #fff;
            background-image: url("../img/background.jpg");
            border-radius: 10px;
            width: 90%;
            padding: 1rem 1rem 1.5rem;
            margin-bottom: 1rem;
        }

        .navbar-brand {
            font-weight: 500;
        }

        .navbar {
            background-color: #035397;
            border-radius: 10px;
        }

        .login-name {
            color: #fff;
            padding: 2rem 0rem;
            position: relative;
        }

        .card {
            border-radius: 10px;
            margin: 1rem 0;
        }

        .form-header {
            background-color: #035397;
            /* background-image: url("../img/blue-texture.jpg"); */
            border-radius: 10px 0 0 10px;
            color: #fff;
            padding: 3rem;
        }

        .form-control {
            margin-bottom: 0.5rem;
        }

        .form-btn {
            padding: 8px 30px;
        }

        .btn-submit {
            margin-right: 10px;
        }

        .table {
            background-color: #efefef;
            border-radius: 10px;
        }

        .admin-tbl {
            margin-top: 1rem;
        }
    </style>
</head>
<body>
<!-- Section: Design Block -->
<section class="">
    <!-- Jumbotron -->

    <h2 class="login-name container">Admin</h2>

    <div class="container parent-home">
        <a href="/insert" class="btn btn-success btn-lg" style="border-radius: 10px; margin-bottom: 1rem">Add New
            Shedules</a>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Sri Lanka Railways - Manage</a>
                <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Trains</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Bookings</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Shedules</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- !nav -->

        <table class="table table-hover admin-tbl">
            <thead>
            <tr>
                <th scope="col">Train</th>
                <th scope="col">From Station</th>
                <th scope="col">To Station</th>
                <th scope="col">Available Seats</th>
                <th scope="col">Date</th>
                <th scope="col">Time</th>
            </tr>
            </thead>
            <tbody>
            <!--   for (Todo todo: todos) {  -->
            <c:forEach var="schedule" items="${shedules}">
                <tr>
                    <td>
                        <c:out value="${schedule.tName}"/>
                    </td>
                    <td>
                        <c:out value="${schedule.fromStation}"/>
                    </td>
                    <td>
                        <c:out value="${schedule.toStation}"/>
                    </td>
                    <td>
                        <c:out value="${schedule.seats}"/>
                    </td>
                    <td>
                        <c:out value="${schedule.date}"/>
                    </td>
                    <td>
                        <c:out value="${schedule.time}"/>
                    </td>
                    <td>
                        <a href="update?tname=<c:out value='${schedule.tName}'/>&tid=<c:out value='${schedule.tid}'/>&fid=<c:out value='${schedule.fromId}'/>&fname=<c:out value='${schedule.fromStation}'/>&toid=<c:out value='${schedule.toId}'/>&toname=<c:out value='${schedule.toStation}'/>&date=<c:out value='${schedule.date}'/>&time=<c:out value='${schedule.time}'/>"
                           class="btn btn-warning w-100">Update</a>
                    </td>
                    <td>
                        <a href="delete?tid=<c:out value='${schedule.tid}'/>&fstation=<c:out value='${schedule.fromId}'/>&tstation=<c:out value='${schedule.toId}'/>&date=<c:out value='${schedule.date}'/>&time=<c:out value='${schedule.time}'/>"
                           class="btn btn-danger w-100">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>
        </table>
    </div>

    <!-- Jumbotron -->
</section>
<!-- Section: Design Block -->
</body>
</html>
