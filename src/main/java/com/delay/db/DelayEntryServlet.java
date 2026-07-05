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


//AI Alert
String alertMessage = "";
String alertClass = "ok";

if (delay_duration >= 5) {
 alertMessage = "⚠ HIGH DELAY! Immediate action required.";
 alertClass = "critical";
} else if (delay_duration >= 2) {
 alertMessage = "⚠ Moderate Delay. Supervisor attention required.";
 alertClass = "warning";
} else {
 alertMessage = "✅ Normal Delay.";
 alertClass = "ok";
}


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
out.println("<title>Entry Saved</title>");
out.println("<link rel='stylesheet' href='assets/css/style.css'>");
out.println("</head>");
out.println("<body style='display:flex; align-items:center; justify-content:center;'>");
out.println("<div class='glass-panel' style='text-align:center; max-width:450px; width:100%;'>");
out.println("<div style='font-size:48px; margin-bottom:15px;'>✅</div>");
out.println("<h2 style='color:var(--success); margin-bottom:10px;'>Data Authenticated</h2>");
out.println("<p style='color:var(--text-muted); margin-bottom:20px; font-size:15px;'>The breakdown entry log vector was processed successfully onto the centralized storage tables.</p>");
out.println("<div style='background:#f8fafc; padding:15px; border-radius:8px; border:1px solid var(--border-color); margin-bottom:25px; font-weight:600;'>");
out.println(alertMessage);
out.println("</div>");
out.println("<a href='DashboardServlet' style='display:block; text-align:center; padding:12px; background:var(--primary); color:white; text-decoration:none; border-radius:8px; font-weight:600;'>Return to Dashboard</a>");
out.println("</div>");
out.println("</body>");
out.println("</html>");



}
catch(Exception e){

e.printStackTrace();

}

}

}
