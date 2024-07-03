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
                <a href="#">Courses</a>
                <c:if test="${sessionScope['account']!=null}">
                    <c:if test="${sessionScope['account'].roleId == 3}">
                        <a href="studentgrade">Grade</a>
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
            <form action="submit_grades.php" method="post">
            <div class="scrollable-table">
                <table>
                    <thead>
                        <tr>
                            <th>Roll</th>
                            <th>Name</th>
                            <th>Final Project Presentation Rest</th>
                            <th>Implementation (Report 7)</th>
                            <th>Project Introduction</th>
                            <th>Project Management Plan</th>
                            <th>Software Design (Report 4)</th>
                            <th>Software Requirement</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>HE161216</td>
                            <td class="name">Trịnh Anh Đức</td>
                            <td><input type="number" name="grades[HE161216][final_project]" required></td>
                            <td><input type="number" name="grades[HE161216][implementation]" required></td>
                            <td><input type="number" name="grades[HE161216][project_intro]" required></td>
                            <td><input type="number" name="grades[HE161216][project_management]" required></td>
                            <td><input type="number" name="grades[HE161216][software_design]" required></td>
                            <td><input type="number" name="grades[HE161216][software_requirement]" required></td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            <div class="form-container">
                <input type="submit" value="Submit Grades">
            </div>
        </form>
        </div>
    </body>
</html>
<style>
    table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            table-layout: fixed;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: white;
            position: sticky;
            top: 0;
            z-index: 1;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 20px;
        }
        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .scrollable-table {
            max-height: 400px;
            overflow-y: auto;
        }
        th, td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        td.name {
            max-width: 200px;
        }
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
        max-width: 1600px;
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