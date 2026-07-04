<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Delay Entry</title>


<style>


body{

font-family:Arial, sans-serif;

background:linear-gradient(to right,aliceblue,lightgreen);

}



.container{

width:600px;

margin:40px auto;

background:white;

padding:35px;

border-radius:20px;

box-shadow:0px 0px 20px gray;

}



h1{

text-align:center;

color:darkblue;

font-size:28px;

}



h2{

text-align:center;

color:navy;

}



label{

font-weight:bold;

color:darkslategray;

}



input,select{

width:100%;

padding:12px;

margin-top:8px;

margin-bottom:18px;

border:1px solid gray;

border-radius:10px;

font-size:15px;

}



input:focus,select:focus{

outline:none;

border:2px solid blue;

}



button{


width:100%;

background:green;

color:white;

padding:12px;

border:none;

border-radius:10px;

font-size:17px;

cursor:pointer;

}



button:hover{

background:darkgreen;

}



.back{

display:block;

text-align:center;

margin-top:20px;

text-decoration:none;

color:blue;

}



</style>


</head>


<body>


<div class="container">


<h1>Centralized Delay Analysis System</h1>


<h2>Delay Entry</h2>



<form action="${pageContext.request.contextPath}/delayEntry" method="post">






<label>Shop Description</label>

<select name="shop_desc" id="shop_desc" onchange="loadEquipment()">

<option value="">Select Shop</option>

<option value="SMS">SMS</option>

<option value="Blast Furnace">Blast Furnace</option>

<option value="Steel Melt">Steel Melt</option>

</select>



<label>Equipment Name</label>

<select name="eqpt_name" id="eqpt_name" required>

<option>Select Equipment</option>

</select>


<label>Sub Equipment Name</label>

<input type="text"
name="sub_eqpt_name"
placeholder="Enter Sub Equipment Name">



<label>Agency</label>

<select name="agency">

<option>Mechanical</option>

<option>Electrical</option>

<option>Operations</option>

</select>



<label>Delay From</label>

<input type="datetime-local"
name="delay_from"
required>



<label>Delay Upto</label>

<input type="datetime-local"
name="delay_upto"
required>

<label>Delay Description</label>

<input type="text"
name="delay_desc"
placeholder="Enter Delay Description">



<button type="submit">

Submit Delay

</button>


</form>



<a class="back" href="dashboard.jsp">

Back to Dashboard

</a>



</div>

<script>

function loadEquipment(){

var shop=document.getElementById("shop_desc").value;

var eqpt=document.getElementById("eqpt_name");


eqpt.innerHTML="";


if(shop=="SMS"){

eqpt.innerHTML += "<option>MILL</option>";
eqpt.innerHTML += "<option>OT-3</option>";
eqpt.innerHTML += "<option>CONV-2</option>";

}

else if(shop=="Blast Furnace"){

eqpt.innerHTML += "<option>M/C</option>";
eqpt.innerHTML += "<option>CONV-4</option>";

}

else if(shop=="Steel Melt"){

eqpt.innerHTML += "<option>M/C</option>";
eqpt.innerHTML += "<option>CCM</option>";

}

}

</script>
</body>

</html>