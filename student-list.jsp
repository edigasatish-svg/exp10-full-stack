
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Student" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background: #f5f7fa;
        }

        h2 {
            color: #1d3557;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
            background: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }

        th {
            background: #dbeafe;
        }

        input {
            padding: 7px;
        }

        a {
            margin-right: 10px;
        }

        .actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }
    </style>
</head>

<body>

    <h2>Student Management System</h2>

    <!-- Search student -->
    <form action="${pageContext.request.contextPath}/search"
          method="get">
        <label>Search Registration Number:</label>
        <input type="number" name="regno" required>
        <input type="submit" value="Search">
    </form>

    <p>
        <a href="${pageContext.request.contextPath}/students">
            Show All Students
        </a>

        <a href="${pageContext.request.contextPath}/add">
            Add New Student
        </a>
    </p>

    <!-- Student table -->
    <table>
        <thead>
            <tr>
                <th>Regno</th>
                <th>Name</th>
                <th>CGPA</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
        <%
            Object data = request.getAttribute("students");

            if (data instanceof List<?>) {
                List<?> studentList = (List<?>) data;

                for (Object item : studentList) {
                    if (item instanceof Student) {
                        Student s = (Student) item;
        %>
            <tr>
                <td><%= s.getRegno() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getCgpa() %></td>

                <td>
                    <div class="actions">
                        <a href="${pageContext.request.contextPath}/edit/<%= s.getRegno() %>">
                            Edit
                        </a>

                        <form
                            action="${pageContext.request.contextPath}/delete/<%= s.getRegno() %>"
                            method="post"
                            onsubmit="return confirm('Are you sure you want to delete this student?');">

                            <input type="submit" value="Delete">
                        </form>
                    </div>
                </td>
            </tr>
        <%
                    }
                }
            }
        %>
        </tbody>
    </table>

</body>
</html>
