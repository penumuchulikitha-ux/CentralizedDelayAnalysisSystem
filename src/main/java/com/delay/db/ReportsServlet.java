package com.delay.db;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            ArrayList<HashMap<String,String>> list = new ArrayList<>();

            Connection con = DBConnection.getConnection();


            String query = "select * from delays_data";


            PreparedStatement ps = con.prepareStatement(query);


            ResultSet rs = ps.executeQuery();



            while(rs.next()) {


                HashMap<String,String> row = new HashMap<>();


                row.put("shop_code",
                        rs.getString("shop_code"));


                row.put("shop_desc",
                        rs.getString("shop_desc"));


                row.put("eqpt_name",
                        rs.getString("eqpt_name"));


                row.put("sub_eqpt_name",
                        rs.getString("sub_eqpt_name"));


                row.put("agency",
                        rs.getString("agency"));


                row.put("delay_from",
                        rs.getString("delay_from"));


                row.put("delay_upto",
                        rs.getString("delay_upto"));


                row.put("delay_duration",
                        rs.getString("delay_duration"));


                row.put("delay_desc",
                        rs.getString("delay_desc"));


                row.put("user_entered",
                        rs.getString("user_entered"));


                list.add(row);

            }



            request.setAttribute("reports", list);



            RequestDispatcher rd =
                    request.getRequestDispatcher("reports.jsp");


            rd.forward(request,response);



        }
        catch(Exception e){

            e.printStackTrace();

        }

    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        doGet(request,response);

    }

}