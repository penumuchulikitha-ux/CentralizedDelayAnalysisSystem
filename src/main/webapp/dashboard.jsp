<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Dashboard</title>


<style>


*{

margin:0;

padding:0;

box-sizing:border-box;

font-family:Arial,sans-serif;

}



body{


background:aliceblue;


}



.header{


background:darkblue;

color:white;

padding:25px;

text-align:center;

font-size:30px;

font-weight:bold;


}




.container{


width:90%;

margin:50px auto;


display:grid;

grid-template-columns:repeat(auto-fit,minmax(250px,1fr));

gap:30px;


}




.card{


background:white;

padding:35px;

border-radius:18px;

text-align:center;

box-shadow:0px 10px 25px gray;


transition:0.3s;


}



.card:hover{


transform:translateY(-8px);


}



.card h3{


color:navy;

margin-bottom:15px;


}



.card p{


color:gray;

}



.card a{


display:inline-block;

background:royalblue;

color:white;

padding:12px 25px;

border-radius:8px;

text-decoration:none;

margin-top:15px;


}



.card a:hover{


background:blue;


}



.logout a{


background:red;


}



.logout a:hover{


background:darkred;


}



</style>


</head>



<body>



<div class="header">

Centralized Delay Analysis System

</div>




<div class="container">



<div class="card">

<h3>Delay Entry</h3>

<p>Add new delay information</p>

<a href="delayEntry.jsp">
Open
</a>

</div>




<div class="card">

<h3>User Management</h3>

<p>Manage system users</p>

<a href="userManagement.jsp">
Open
</a>

</div>




<div class="card">

<h3>Delay Reports</h3>

<p>View delay analysis reports</p>

<a href="ReportsServlet">
Open
</a>

</div>




<div class="card logout">

<h3>Logout</h3>

<p>Exit from system</p>

<a href="LogoutServlet">
Logout
</a>

</div>



</div>


</body>

</html>