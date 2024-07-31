<!DOCTYPE html>
<html>
<head>
    <title>Weekly Tasks/Hours Bar Chart</title>
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
        <h2>Weekly Tasks/Hours Bar Chart</h2>
        <canvas id="AllWeeklyChart" width="400" height="400"></canvas>
        <script>
            fetch('AllWeeklyChartServlet')
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('AllWeeklyChart').getContext('2d');

                const labels = [];
                const datasetMap = {};

                data.datasets.forEach(item => {
                    if (!labels.includes(item.day)) {
                        labels.push(item.day);
                    }
                    if (!datasetMap[item.username]) {
                        datasetMap[item.username] = [];
                    }
                    datasetMap[item.username].push({
                        x: item.day,
                        y: item.duration
                    });
                });

                const datasets = Object.keys(datasetMap).map(username => ({
                    label: username,
                    data: datasetMap[username],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }));

                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: datasets
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            });
        </script>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
