<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    } else if (!"Associate".equals(session.getAttribute("role"))) {
        response.sendRedirect("dashboard.jsp");
        return; // Redirect to dashboard if the user is not an associate
    }
-->
<!DOCTYPE html>
<html>
<head>
    <title>Associate Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #ffecb3 0%, #ffd700 100%);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h2 {
            color: maroon;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        li {
            margin: 10px 0;
        }

        a {
            color: maroon;
            text-decoration: none;
            background: linear-gradient(135deg, #ffd700 0%, #ffb300 100%);
            padding: 15px 25px;
            border-radius: 25px;
            border: 2px solid maroon;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        a:hover {
            background: maroon;
            color: yellow;
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .back-to-dashboard {
            margin-top: 30px;
            background: maroon;
            color: yellow;
            padding: 15px 25px;
            text-decoration: none;
            border-radius: 25px;
            border: 2px solid yellow;
            transition: all 0.3s ease;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .back-to-dashboard:hover {
            background: yellow;
            color: maroon;
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <h2>Associate Page</h2>
    <ul>
        <li><a href="viewMyCharts.jsp">View My Charts</a></li>
    </ul>
    <a class="back-to-dashboard" href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
