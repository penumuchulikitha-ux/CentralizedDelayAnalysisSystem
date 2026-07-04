package com.delay.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String emp_no = request.getParameter("emp_no");
        String password = request.getParameter("password");
        String empname = request.getParameter("empname");
        String dept = request.getParameter("dept");
        String designation = request.getParameter("designation");
        String role = request.getParameter("role");
        String active = request.getParameter("active");

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "insert into user_table(emp_no,password,empname,dept,designation,role,active) values(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, emp_no);
            ps.setString(2, password);
            ps.setString(3, empname);
            ps.setString(4, dept);
            ps.setString(5, designation);
            ps.setString(6, role);
            ps.setString(7, active);

            ps.executeUpdate();
            System.out.println("Inserted");
            response.getWriter().println(
            		"<html><head>"
            		+ "<meta http-equiv='refresh' content='5;URL=dashboard.jsp'>"
            		+ "</head><body style='font-family:Arial; background:#f2f2f2; text-align:center; margin-top:100px;'>"

            		+ "<div style='display:inline-block; padding:20px 40px; background:#d4edda; color:#155724; border-radius:10px; font-size:24px; font-weight:bold;'>"

            		+ "User Added Successfully"

            		+ "<br><br>"

            		+ "<span style='font-size:16px;'>Redirecting to Dashboard...</span>"

            		+ "</div>"

            		+ "</body></html>"
            		);
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}