<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    String username = (String) session.getAttribute("username");
    int userId = 0;
    String dbUrl = "jdbc:mysql://localhost:3306/employeetasktracker";
    String dbUser = "root";
    String dbPass = "Snekha@17";

    // Query to get user_id from username
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = con.prepareStatement("SELECT user_id FROM Users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View My Tasks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0e5d8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border: 2px solid #800000;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 800px;
            overflow-x: auto;
        }
        h2 {
            color: #800000;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #800000;
            text-align: left;
        }
        th {
            background-color: #800000;
            color: #ffeb3b;
        }
        td a {
            color: #800000;
            text-decoration: none;
            font-weight: bold;
            padding: 5px 10px;
            border: 2px solid #800000;
            border-radius: 5px;
            background-color: #ffeb3b;
            margin: 2px;
            display: inline-block;
        }
        td a:hover {
            background-color: #800000;
            color: #ffeb3b;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #800000;
            text-decoration: none;
            font-weight: bold;
            padding: 10px;
            border: 2px solid #800000;
            border-radius: 5px;
            background-color: #ffeb3b;
        }
        .back-link:hover {
            background-color: #800000;
            color: #ffeb3b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Tasks</h2>
        <table>
            <tr>
                <th>Project</th>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Category</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE employee_id=?");
                    ps.setInt(1, userId);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("project") %></td>
                <td><%= rs.getDate("date") %></td>
                <td><%= rs.getTime("start_time") %></td>
                <td><%= rs.getTime("end_time") %></td>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getString("description") %></td>
                <td>
                    <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>">Edit</a>
                    <a href="DeleteTaskServlet?taskId=<%= rs.getInt("task_id") %>">Delete</a>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <a class="back-link" href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
