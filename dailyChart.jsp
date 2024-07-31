<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Tasks/Hours Pie Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            flex-direction: column;
            height: 100vh;
            text-align: center;
        }

        .container {
            text-align: center;
            background-color: #fff;
            border: 2px solid #800000;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 400px;
            margin-top: 20px;
        }

        h2 {
            color: #800000;
            margin-bottom: 20px;
            font-size: 1.5em;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
        }

        canvas {
            margin: 20px 0;
        }

        a {
            display: inline-block;
            padding: 12px 20px;
            background-color: #800000;
            color: #ffeb3b;
            border: 2px solid #800000;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #ffeb3b;
            color: #800000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Daily Tasks/Hours Pie Chart for <%= username %></h2>
        <canvas id="dailyChart" width="400" height="400"></canvas>
        <script>
            fetch('DailyChartServlet')
            .then(response => response.json())
            .then(data => {
                console.log('Data received:', data);
                const labels = Object.keys(data);
                const values = Object.values(data);
                if (labels.length === 0 || values.length === 0) {
                    console.warn('No data available for the chart.');
                    return;
                }
                const ctx = document.getElementById('dailyChart').getContext('2d');
                new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Tasks/Hours',
                            data: values,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    }
                });
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
        </script>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
