/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.controller;

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
import pe.edu.idat.ajaxjsp.dao.workerDao;
import pe.edu.idat.ajaxjsp.models.Cargo;

import pe.edu.idat.ajaxjsp.models.Worker;

/**
 *
 * @author ronal
 */
@WebServlet("/workers")
public class ControlWorkers extends HttpServlet{
    
    private workerDao workdao;

    @Override
    public void init() throws ServletException {

        try {
            workdao = workerDao.getInstance();
        } catch (SQLException ex) {
            Logger.getLogger(ControlWorkers.class.getName()).log(Level.SEVERE, null, ex);
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
                Worker empleado = workdao.find(id);

                String accion = req.getParameter("accion");
                if (accion == null) {
                    accion = "";

                }

                if (accion.equals("eliminar")) {
                    boolean responseDelete = workdao.delete(empleado);
                    response.put("data", responseDelete);
                    if (responseDelete) {
                        response.put("msg", "Usuario eliminado correctamente");
                    } else {
                        response.put("msg", "No se pudo eliminar el usuario");
                    }
                } else {

                    response.put("data", empleado);
                }

            } else {
                List<Worker> empleados = workdao.list();
                response.put("data", empleados);
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
        Cargo carg;
        

        Map<String, Object> response = new HashMap<>();
        response.put("rpta", 1);
        response.put("msg", "ok");
        
        
        

        int id = Integer.parseInt(req.getParameter("id"));
        String nombres = req.getParameter("eNombres");
        String apellidos = req.getParameter("eApellidos");
        String sexo = req.getParameter("eSexo");
        int telefono=Integer.parseInt(req.getParameter("telefono"));
        
        String dni=req.getParameter("eDni");
        
        
        double sueldo= Double.parseDouble(req.getParameter("sueldo"));
        
        carg = new Cargo();
        carg.setIdCargo(Integer.parseInt(req.getParameter("idCargo")));
           
        

        

        Worker empleado;
        try {
            empleado = workdao.find(id);
            empleado.setNombres(nombres);
            empleado.setApellidos(apellidos);
            empleado.setSexo(sexo);
            empleado.setTelefono(telefono);
            empleado.setDni(dni);
            empleado.setSueldo(sueldo);
            empleado.setCargo(carg);
            

            empleado = workdao.save(empleado);
            response.put("data", empleado);
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
