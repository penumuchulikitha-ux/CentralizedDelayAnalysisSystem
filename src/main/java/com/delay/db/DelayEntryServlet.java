package com.delay.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.Duration;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/delayEntry")
public class DelayEntryServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {


try {


String shop_code = request.getParameter("shop_code");

String shop_desc = request.getParameter("shop_desc");

String eqpt_name = request.getParameter("eqpt_name");

String sub_eqpt_name = request.getParameter("sub_eqpt_name");

String agency = request.getParameter("agency");

String delay_from = request.getParameter("delay_from");

String delay_upto = request.getParameter("delay_upto");

String delay_desc = request.getParameter("delay_desc");



// calculating delay duration automatically

LocalDateTime from = LocalDateTime.parse(delay_from);

LocalDateTime upto = LocalDateTime.parse(delay_upto);


Duration diff = Duration.between(from, upto);


double delay_duration = diff.toMinutes() / 60.0;



// getting logged in user

HttpSession session = request.getSession();

String user_entered = 
(String)session.getAttribute("username");



Connection con = DBConnection.getConnection();



String sql =
"insert into delays_data(shop_code,shop_desc,eqpt_name,"
+"sub_eqpt_name,agency,delay_from,delay_upto,"
+"delay_duration,delay_desc,user_entered)"
+" values(?,?,?,?,?,?,?,?,?,?)";



PreparedStatement ps = con.prepareStatement(sql);



ps.setString(1, shop_code);

ps.setString(2, shop_desc);

ps.setString(3, eqpt_name);

ps.setString(4, sub_eqpt_name);

ps.setString(5, agency);

ps.setString(6, delay_from);

ps.setString(7, delay_upto);

ps.setDouble(8, delay_duration);

ps.setString(9, delay_desc);

ps.setString(10, user_entered);



ps.executeUpdate();



response.setContentType("text/html");

PrintWriter out = response.getWriter();


out.println("<html>");
out.println("<head>");
out.println("<style>");

out.println("body{font-family:Arial;background:linear-gradient(to right,aliceblue,lightgreen);height:100vh;display:flex;justify-content:center;align-items:center;}");

out.println(".box{background:white;padding:40px;border-radius:20px;text-align:center;box-shadow:0px 0px 20px gray;width:450px;}");

out.println("h2{color:green;}");

out.println("p{color:darkblue;font-size:18px;}");

out.println("button{background:blue;color:white;padding:12px 25px;border:none;border-radius:10px;font-size:16px;}");

out.println("</style>");

out.println("</head>");

out.println("<body>");

out.println("<div class='box'>");

out.println("<h2>Data Inserted Successfully</h2>");

out.println("<p>Delay entry has been recorded successfully</p>");

out.println("<a href='dashboard.jsp'>");

out.println("<button type='button'>Back to Dashboard</button>");

out.println("</a>");

out.println("</div>");

out.println("</body>");

out.println("</html>");



}
catch(Exception e){

e.printStackTrace();

}

}

}