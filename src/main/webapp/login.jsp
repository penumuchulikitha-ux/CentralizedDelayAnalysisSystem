<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login - Centralized Delay Analysis System</title>


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}


body{

    height:100vh;

    background:linear-gradient(135deg,darkblue,royalblue,skyblue);

    display:flex;

    justify-content:center;

    align-items:center;

}



.login-box{

    width:380px;

    background:white;

    padding:35px;

    border-radius:20px;

    box-shadow:0px 15px 30px gray;

}



h2{

    text-align:center;

    color:darkblue;

    margin-bottom:25px;

}



.logo{

    text-align:center;

    font-size:45px;

    margin-bottom:10px;

}



input{

    width:100%;

    padding:12px;

    margin:12px 0;

    border:1px solid gray;

    border-radius:8px;

}



button{

    width:100%;

    padding:12px;

    margin-top:20px;

    background:royalblue;

    color:white;

    border:none;

    border-radius:8px;

    font-size:16px;

    cursor:pointer;

}



button:hover{

    background:blue;

}


</style>


</head>


<body>


<div class="login-box">


<div class="logo">
⚙
</div>


<h2>
Centralized Delay Analysis System
</h2>


<form action="LoginServlet" method="post">


<input type="text"
name="empNo"
placeholder="Enter Username"
required>


<input type="password"
name="password"
placeholder="Enter Password"
required>


<button type="submit">
Login
</button>


</form>


</div>


</body>

</html>