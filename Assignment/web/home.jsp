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
        <h1>Course List</h1>
        <nav>
            <a href="#">Home</a>
            <a href="#">Courses</a>
            <a href="#">Logout</a>
        </nav>
        <input type="text" id="search" placeholder="Tìm kiếm khóa học..." onkeyup="searchCourses()" style="margin-top: 10px; padding: 8px; width: 80%; max-width: 400px; border: none; border-radius: 4px;">
    </header>
    <div class="table-container">
        <table id="courseTable">
            <thead>
                <tr>
                    <th>Mã khóa học</th>
                    <th>Tên khóa học</th>
                    <th>Mô tả</th>
                    <th>Thời lượng</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>CSE101</td>
                    <td>Giới thiệu về Khoa học máy tính</td>
                    <td>Môn học giới thiệu về các khái niệm và lập trình máy tính.</td>
                    <td>10 tuần</td>
                </tr>
                <tr>
                    <td>MAT201</td>
                    <td>Tích phân I</td>
                    <td>Các nguyên lý cơ bản về tích phân, bao gồm đạo hàm và tích phân.</td>
                    <td>12 tuần</td>
                </tr>
                <tr>
                    <td>PHY301</td>
                    <td>Vật lý tổng quát</td>
                    <td>Các nguyên lý vật lý bao gồm cơ học, sóng và nhiệt động học.</td>
                    <td>14 tuần</td>
                </tr>
                <!-- Thêm các khóa học khác nếu cần -->
            </tbody>
        </table>
    </div>
    <script src="scripts.js"></script>
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