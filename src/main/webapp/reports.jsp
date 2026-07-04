<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Delay Reports</title>


<link rel="stylesheet" 
href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">


<style>

body{
    font-family: Arial, sans-serif;
    background:linear-gradient(to right,#dbeafe,#f0fdf4);
}


.container{

    width:95%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0px 0px 20px #999;

}


h2{

    text-align:center;
    color:#1e3a8a;

}


table{

    width:100%;

}



table.dataTable thead th{

    background:#1e40af;
    color:white;
    padding:12px;

}


table.dataTable tbody td{

    padding:10px;
    text-align:center;

}



table.dataTable tbody tr:hover{

    background:#dbeafe;

}



.backbtn{

    display:inline-block;
    margin-top:20px;
    background:#16a34a;
    color:white;
    padding:10px 20px;
    border-radius:8px;
    text-decoration:none;

}


</style>


</head>


<body>


<div class="container">


<h2>Centralized Delay Analysis System</h2>

<h2>Delay Reports</h2>



<table id="reportTable">


<thead>

<tr>

<th>Shop Code</th>

<th>Shop Description</th>

<th>Equipment Name</th>

<th>Sub Equipment Name</th>

<th>Agency</th>

<th>Delay From</th>

<th>Delay Upto</th>

<th>Duration</th>

<th>Description</th>

<th>User</th>


</tr>

</thead>



<tbody>


<%

ArrayList<HashMap<String,String>> list =
(ArrayList<HashMap<String,String>>)request.getAttribute("reports");


if(list != null)
{

for(HashMap<String,String> r:list)

{


%>


<tr>


<td><%=r.get("shop_code")%></td>

<td><%=r.get("shop_desc")%></td>

<td><%=r.get("eqpt_name")%></td>

<td><%=r.get("sub_eqpt_name")%></td>

<td><%=r.get("agency")%></td>

<td><%=r.get("delay_from")%></td>

<td><%=r.get("delay_upto")%></td>

<td><%=r.get("delay_duration")%></td>

<td><%=r.get("delay_desc")%></td>

<td><%=r.get("user_entered")%></td>


</tr>


<%

}

}

%>


</tbody>


</table>



<a href="dashboard.jsp" class="backbtn">
Back to Dashboard
</a>



</div>




<script src="https://code.jquery.com/jquery-3.7.0.js"></script>


<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>



<script>


$(document).ready(function(){


$('#reportTable').DataTable({

pageLength:5,
lengthMenu:[5,10,25,50],
ordering:true,
searching:true

});


});


</script>



</body>
</html>