<!DOCTYPE html>
<html>
<head>
    <title>Monthly Tasks/Hours Bar Chart</title>
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
            width: 600px;
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
        <h2>Monthly Tasks/Hours Bar Chart</h2>
        <canvas id="ALLMonthlyChart" width="400" height="400"></canvas>
        <script>
            fetch('AllMonthlyChartServlet')
            .then(response => response.json())
            .then(data => {
                console.log("Data received from servlet:", data); // Debugging log

                const ctx = document.getElementById('ALLMonthlyChart').getContext('2d');

                const labels = new Set();
                const datasetMap = {};

                // Process userTasks to get labels and datasetMap
                for (const [username, userData] of Object.entries(data.userTasks)) {
                    datasetMap[username] = [];
                    userData.labels.forEach((day, index) => {
                        labels.add(day);
                        datasetMap[username].push({
                            x: day,
                            y: userData.data[index]
                        });
                    });
                }

                // Convert labels Set to an array and sort it
                const sortedLabels = Array.from(labels).sort();

                // Prepare datasets
                const datasets = Object.keys(datasetMap).map(username => ({
                    label: username,
                    data: datasetMap[username].map(point => point.y),
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }));

                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: sortedLabels,
                        datasets: datasets
                    },
                    options: {
                        scales: {
                            x: {
                                type: 'category'
                            },
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error("Error fetching data:", error); // Debugging log
            });
        </script>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
