<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //HttpSession session = request.getSession(false);
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #ffeb3b, #ffd700);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #fff;
            border: 2px solid #800000;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
        }

        h2 {
            color: #800000;
            margin-bottom: 20px;
            font-size: 2em;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        label {
            color: #800000;
            font-weight: bold;
            margin-top: 10px;
            text-align: left;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #800000;
            color: #ffeb3b;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #ffeb3b;
            color: #800000;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            background-color: #800000;
            color: #ffeb3b;
            border: 2px solid #800000;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        .back-link:hover {
            background-color: #ffeb3b;
            color: #800000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="EditTaskServlet" method="post">
            <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
            <label for="project">Project:</label>
            <input type="text" id="project" name="project" value="<%= task.getString("project") %>">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= task.getDate("date") %>">
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>">
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>">
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= task.getString("category") %>">
            <label for="description">Description:</label>
            <textarea id="description" name="description"><%= task.getString("description") %></textarea>
            <input type="submit" value="Update Task">
        </form>
        <a class="back-link" href="taskPage.jsp">Back to Task Management</a>
    </div>
</body>
</html>
<%
    }
%>
