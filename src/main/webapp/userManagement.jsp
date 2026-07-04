<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>User Management</title>


<style>


body{

font-family:Arial, sans-serif;

background:linear-gradient(to right,lightblue,whitesmoke);

margin:0;

}



.header{

background:darkblue;

color:white;

padding:20px;

text-align:center;

font-size:28px;

font-weight:bold;

}



.container{

width:500px;

margin:40px auto;

background:white;

padding:35px;

border-radius:20px;

box-shadow:0px 0px 25px gray;

}



.title{

text-align:center;

color:navy;

font-size:24px;

margin-bottom:25px;

}



.form-group{

margin-bottom:18px;

}



label{

font-weight:bold;

color:darkslategray;

display:block;

margin-bottom:8px;

}



input,select{


width:100%;

padding:12px;

border-radius:10px;

border:1px solid gray;

font-size:15px;


}



input:focus,select:focus{


outline:none;

border:2px solid darkblue;


}



.role-box{

background:aliceblue;

padding:15px;

border-radius:12px;

margin-bottom:20px;


}



button{


width:100%;

padding:13px;

background:green;

color:white;

border:none;

border-radius:10px;

font-size:17px;

cursor:pointer;

font-weight:bold;


}



button:hover{

background:darkgreen;

}



.back{

display:block;

text-align:center;

margin-top:20px;

text-decoration:none;

color:darkblue;

font-weight:bold;


}



.footer{

text-align:center;

margin-top:30px;

color:gray;

font-size:14px;

}



</style>


</head>


<body>


<div class="header">

Centralized Delay Analysis System

</div>



<div class="container">


<div class="title">

👤 User Management

</div>



<form action="AddUserServlet" method="post">



<div class="form-group">

<label>Employee Number</label>

<input type="text"
name="emp_no"
placeholder="Enter Employee Number">

</div>



<div class="form-group">

<label>Password</label>

<input type="password"
name="password"
placeholder="Enter Password">

</div>




<div class="form-group">

<label>Employee Name</label>

<input type="text"
name="empname"
placeholder="Enter Employee Name">

</div>





<div class="form-group">

<label>Department</label>

<input type="text"
name="dept"
placeholder="Enter Department">

</div>




<div class="form-group">

<label>Designation</label>

<input type="text"
name="designation"
placeholder="Enter Designation">

</div>




<div class="role-box">


<label>User Role</label>


<select name="role">


<option value="sys_admin">

System Admin

</option>


<option value="dept_user">

Department User

</option>


<option value="dept_admin">

Department Admin

</option>


</select>


<br><br>


<label>Status</label>


<select name="active">


<option value="Y">

Active

</option>


<option value="N">

Inactive

</option>


</select>


</div>




<button type="submit">

Add User

</button>



</form>



<a class="back" href="dashboard.jsp">

← Back to Dashboard

</a>



<div class="footer">

Manage system users securely

</div>



</div>


</body>

</html>