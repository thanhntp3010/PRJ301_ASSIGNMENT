<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home - Course List</title>
        <link rel="stylesheet" href="styles.css">

    </head>
    <body>
        <header>
            <h1>Assignment</h1>
            <nav>
                <a href="#">Home</a>
                <a href="courses">Courses</a>
                <c:if test="${sessionScope['account']!=null}">
                    <c:if test="${sessionScope['account'].roleId == 3}">
                        <a href="studentgrade">Grade</a>
                    </c:if>
                    <c:if test="${sessionScope['account'].roleId == 2}">
                        <a href="addgrade">Add Grade</a>
                    </c:if>
                    <a href="#">Welcome, ${sessionScope['account'].fullName}</a>
                    <a href="logout">Logout</a>
                </c:if>
                <c:if test="${sessionScope['account']==null}">
                    <a href="login.jsp">Login</a>
                </c:if>
            </nav>
        </header>
        <div class="table-container">
            <form action="courses">
                <div class="search-container">
                    <input type="text" id="search" name="code" placeholder="Tìm kiếm môn học...">
                    <button type="submit">Search</button>
                </div>
            </form>

            <p>Total: ${total}</p>
            <table id="courseTable">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Code</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="o" items="${courses}">
                        <tr>
                            <td>${o.courseId}</td>
                            <td>${o.courseCode}</td>
                            <td><a href="detail?id=${o.courseId}">${o.courseName}</a></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </body>
</html>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-size: 15px;
    }
    .search-container {
        margin-top: 10px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .search-container input[type="text"] {
        padding: 8px;
        width: 80%;
        max-width: 400px;
        border: none;
        border-radius: 4px;
    }

    .search-container button {
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }

    .search-container button:hover {
        background-color: #45a049;
    }


    header {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 10px 0;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    header h1 {
        margin: 0;
        font-size: 24px;
    }

    header nav {
        margin-top: 10px;
    }

    header nav a {
        color: white;
        text-decoration: none;
        margin: 0 10px;
        font-size: 16px;
    }

    header nav a:hover {
        text-decoration: underline;
    }

    header input {
        margin-top: 10px;
        padding: 8px;
        width: 80%;
        max-width: 400px;
        border: none;
        border-radius: 4px;
    }

    .table-container {
        width: 90%;
        max-width: 1200px;
        margin-top: 20px;
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table thead {
        background-color: #f2f2f2;
    }

    table th, table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    table th {
        background-color: #4CAF50;
        color: white;
    }

    table tr:hover {
        background-color: #f1f1f1;
    }
</style>