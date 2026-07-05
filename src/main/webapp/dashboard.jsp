<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
int total = (request.getAttribute("total") != null) ? (Integer)request.getAttribute("total") : 0;
int high = (request.getAttribute("high") != null) ? (Integer)request.getAttribute("high") : 0;
int moderate = (request.getAttribute("moderate") != null) ? (Integer)request.getAttribute("moderate") : 0;
int normal = (request.getAttribute("normal") != null) ? (Integer)request.getAttribute("normal") : 0;
double avg = (request.getAttribute("avg") != null) ? (Double)request.getAttribute("avg") : 0.0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Centralized Delay Analysis System</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,sans-serif;
}

body{
background:#f4f8fc;
}

.header{
background:#0b3d91;
color:white;
padding:20px;
text-align:center;
font-size:32px;
font-weight:bold;
}

.subheader{
text-align:center;
padding:10px;
font-size:18px;
color:#555;
}

.stats{
width:90%;
margin:20px auto;
display:grid;
grid-template-columns:repeat(4,1fr);
gap:20px;
}

.stat-card{
background:white;
padding:20px;
border-radius:15px;
text-align:center;
box-shadow:0px 5px 15px lightgray;
}

.stat-card h2{
color:#0b3d91;
font-size:35px;
}

.stat-card p{
margin-top:10px;
font-size:18px;
color:#555;
}

.container{
width:90%;
margin:30px auto;
display:grid;
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
gap:25px;
}

.card{
background:white;
padding:30px;
border-radius:15px;
box-shadow:0px 5px 20px lightgray;
text-align:center;
transition:.3s;
}

.card:hover{
transform:translateY(-8px);
}

.card h3{
color:#0b3d91;
margin-bottom:10px;
}

.card p{
color:#666;
margin-bottom:20px;
}

.card a{
background:#1976d2;
padding:12px 25px;
color:white;
text-decoration:none;
border-radius:8px;
}

.card a:hover{
background:#0b3d91;
}

.footer{
margin-top:40px;
text-align:center;
padding:20px;
background:#0b3d91;
color:white;
}

</style>

</head>

<body>

<div class="header">
Centralized Delay Analysis System
</div>

<div class="subheader">
Smart Dashboard for Delay Monitoring
</div>

<div class="stats">

<div class="stat-card">
<h2><%= total %></h2>
<p>Total Delays</p>
</div>

<div class="stat-card">
<h2><%= high %></h2>
<p>High Delays</p>
</div>

<div class="stat-card">
<h2><%= moderate %></h2>
<p>Moderate Delays</p>
</div>

<div class="stat-card">
<h2><%= normal %></h2>
<p>Normal Delays</p>
</div>

<div class="stat-card">
<h2><%= avg %> hrs</h2>
<p>Average Delay</p>
</div>

</div>

<div class="container">

<div class="card">
<h3>Delay Entry</h3>
<p>Add new delay information</p>
<a href="delayEntry.jsp">Open</a>
</div>

<div class="card">
<h3>User Management</h3>
<p>Manage users</p>
<a href="userManagement.jsp">Open</a>
</div>

<div class="card">
<h3>Reports</h3>
<p>Generate delay reports</p>
<a href="ReportsServlet">Open</a>
</div>

<div class="card">
<h3>Analytics</h3>
<p>View graphical reports</p>
<a href="analytics.jsp">Open</a>
</div>

<div class="card">
<h3>AI Prediction</h3>
<p>Predict future delays</p>
<a href="prediction.jsp">Open</a>
</div>

<div class="card">
<h3>Equipment Health</h3>
<p>Monitor machine health status</p>
<a href="HealthServlet">Open</a>
</div>

<div class="card">
<h3>Logout</h3>
<p>Exit from the system</p>
<a href="LogoutServlet">Logout</a>
</div>

</div>

<div class="footer">
Hackathon 2026 | Centralized Delay Analysis System
</div>

</body>
</html>