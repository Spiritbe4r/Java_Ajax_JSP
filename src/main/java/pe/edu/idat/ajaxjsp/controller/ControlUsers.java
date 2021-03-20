/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.controller;

import pe.edu.idat.ajaxjsp.dao.usersDao;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.idat.ajaxjsp.models.Cargo;
import pe.edu.idat.ajaxjsp.models.Users;

/**
 *
 * @author ronal
 */
@WebServlet("/Users")
public class ControlUsers extends HttpServlet {

    private usersDao userdao;

    @Override
    public void init() throws ServletException {

        try {
            userdao = usersDao.getInstance();
        } catch (SQLException ex) {
            Logger.getLogger(ControlUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        configResponse(resp);

        Gson gson = new Gson();
        Map<String, Object> response = new HashMap<>();
        response.put("rpta", 1);
        response.put("msg", "ok");

        try {
            if (req.getParameter("id") != null) {
                int id = Integer.parseInt(req.getParameter("id"));
                Users usuario = userdao.find(id);

                String accion = req.getParameter("accion");
                if (accion == null) {
                    accion = "";

                }

                if (accion.equals("eliminar")) {
                    boolean responseDelete = userdao.delete(usuario);
                    response.put("data", responseDelete);
                    if (responseDelete) {
                        response.put("msg", "Usuario eliminado correctamente");
                    } else {
                        response.put("msg", "No se pudo eliminar el usuario");
                    }
                } else {

                    response.put("data", usuario);
                }

            } else {
                List<Users> usuarios = userdao.list();
                response.put("data", usuarios);
            }
        } catch (SQLException ex) {
            response.put("rpta", -1);
            response.put("msg", ex.getMessage());
        }

        String json = gson.toJson(response);
        PrintWriter pw = resp.getWriter();

        pw.println(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        configResponse(resp);
        Cargo car;
        

        Map<String, Object> response = new HashMap<>();
        response.put("rpta", 1);
        response.put("msg", "ok");
        
       
        

        int id = Integer.parseInt(req.getParameter("id"));
        String userName = req.getParameter("Username");
        String uPassword = req.getParameter("uPassword");
        String usernomCompleto = req.getParameter("uFullname");
        int userestado = Integer.parseInt(req.getParameter("userEstado"));
        car = new Cargo();
        car.setIdCargo(Integer.parseInt(req.getParameter("idcargo")));
           
        

        

        Users user;
        try {
            user = userdao.find(id);
            user.setUsername(userName);
            user.setuPassword(uPassword);
            user.setuFullname(usernomCompleto);
            user.setUserEstado(userestado);
            user.setUserCargo(car);
            
            
           
            user= userdao.save(user);
            response.put("data",user);
        

            
        } catch (SQLException ex) {
            response.put("msg", ex.getMessage());
        }

        Gson gson = new Gson();
        String json = gson.toJson(response);
        PrintWriter pw = resp.getWriter();
        pw.println(json);
    }

    private void configResponse(HttpServletResponse resp) {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.addHeader("Access-Control-Allow-Origin", "*");
        resp.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE, HEAD");
        resp.addHeader("Access-Control-Allow-Headers", "Content-Type");
    }

}
