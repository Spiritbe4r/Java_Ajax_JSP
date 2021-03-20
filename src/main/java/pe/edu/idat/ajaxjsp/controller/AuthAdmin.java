/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import pe.edu.idat.ajaxjsp.connection.DbUtil;


/**
 *
 * @author ronal
 */
@WebServlet("/AuthAdmin")
public class AuthAdmin extends HttpServlet {

    private Connection connection;

    private static long serialversionUID = 1L;
    private static final String CONTENT_TYPE = "text/html;charset=UTF-8";
    private String message;

    public AuthAdmin() throws SQLException {
        super();
        connection = DbUtil.getDataSource().getConnection();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        resp.setContentType(CONTENT_TYPE);
        PrintWriter out = resp.getWriter();
        Gson gson = new Gson();
        JSONObject jo = new JSONObject();

        String usr = req.getParameter("username");
        String pass = req.getParameter("password");

        String sql = "SELECT username,password,id_cargo,fullname FROM tbl_user where username='" + usr + "' AND password ='" + pass + "'";
           
        if (usr.equals("") || pass.equals("")) {
            jo.put("status", false);

            message = gson.toJson(jo);
            out.println(message);
        } else {

            Statement st = null;
            ResultSet rs = null;
            try {

                st = connection.createStatement();
                rs = st.executeQuery(sql);
                if (rs.next()) {
                    session.setAttribute("username", rs.getString("fullname"));
                 
                    session.setAttribute("id_cargo", rs.getInt("id_cargo"));
                    
                    

                    jo.put("status", true);
                    jo.put("message", "Login Success");
                    message = gson.toJson(jo);
                    out.println(message);

                } else {
                    jo.put("status", false);
                    jo.put("message", "Por favor Revisa tu Cuenta,Usuario o Contraseña erroneos ");
                    message = gson.toJson(jo);
                    out.println(message);
                }
            } catch (SQLException sqle) {
                sqle.printStackTrace();
             
            } 
            finally {

                try {
                    if (st != null) {
                        st.close();
                    }
                } catch (Exception e) {
                }
                try {
                    if (rs != null) {
                        rs.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();

                }
            }

        }

    }

}
