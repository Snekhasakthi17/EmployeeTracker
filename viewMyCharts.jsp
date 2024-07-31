<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View My Charts</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
             background: linear-gradient(135deg, #ffecb3 0%, #ffd700 100%);
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
            padding: 40px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #800000;
            margin-bottom: 30px;
            font-size: 2em;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 10px 0;
        }

        a {
            display: block;
            color: #800000;
            text-decoration: none;
            font-weight: bold;
            margin: 15px 0;
            padding: 12px;
            border: 2px solid #800000;
            border-radius: 8px;
            background-color: #ffeb3b;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #800000;
            color: #ffeb3b;
        }

        .back-link {
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
        <h2>My Charts</h2>
        <ul>
            <li><a href="dailyChart.jsp">View Daily Chart</a></li>
            <li><a href="weeklyChart.jsp">View Weekly Chart</a></li>
            <li><a href="monthlyChart.jsp">View Monthly Chart</a></li>
        </ul>
        <a class="back-link" href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>