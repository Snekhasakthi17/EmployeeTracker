<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            color: #800000;
            margin-bottom: 20px;
        }
        a {
            display: block;
            color: #800000;
            text-decoration: none;
            font-weight: bold;
            margin: 10px 0;
            padding: 10px;
            border: 2px solid #800000;
            border-radius: 5px;
            background-color: #ffeb3b;
        }
        a:hover {
            background-color: #800000;
            color: #ffeb3b;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    
    <%
        if ("Admin".equals(role)) {
    %>
    <a href="adminPage.jsp">Admin Page</a><br>
    <%
        } else {
    %>
    <a href="taskPage.jsp">Task Management</a><br>
    <a href="associaterPage.jsp">View Asscociater</a>
    <%
        }
    %>
    <a href="LogoutServlet">Logout</a>
    </div>
</body>
</html>
<%
    }
%>