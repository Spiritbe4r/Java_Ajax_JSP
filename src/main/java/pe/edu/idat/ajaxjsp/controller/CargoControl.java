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
import pe.edu.idat.ajaxjsp.dao.cargoDao;
import pe.edu.idat.ajaxjsp.models.Cargo;


/**
 *
 * @author ronal
 */
@WebServlet("/cargo")
public class CargoControl extends HttpServlet {

    private cargoDao cargodao;

    @Override
    public void init() throws ServletException {

        try {
            cargodao = cargoDao.getInstance();
        } catch (SQLException ex) {
            Logger.getLogger(CargoControl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        configResponse(resp);

        Map<String, Object> response = new HashMap<>();
        response.put("rpta", 1);
        response.put("msg", "ok");

        int id = Integer.parseInt(req.getParameter("id"));
        String cargoName = req.getParameter("nombreCargo");
        int cargoEstado = Integer.parseInt(req.getParameter("estadoCargo"));
        

        Cargo cargo;
        try {
            cargo = cargodao.find(id);
            cargo.setNombreCargo(cargoName);
            cargo.setEstadoCargo(cargoEstado);
            

            cargo = cargodao.save(cargo);
            response.put("data", cargo);
        } catch (SQLException ex) {
            response.put("msg", ex.getMessage());
        }

        Gson gson = new Gson();
        String json = gson.toJson(response);
        PrintWriter pw = resp.getWriter();
        pw.println(json);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        configResponse(resp);

        Gson gson = new Gson();
        Map<String, Object> risponse = new HashMap<>();
        risponse.put("rpta", 1);
        risponse.put("msg", "ok");
        try {
            if (req.getParameter("id") != null) {
                int id = Integer.parseInt(req.getParameter("id"));
                Cargo cargo = cargodao.find(id);

                String accion = req.getParameter("accion");
                if (accion == null) {
                    accion = "";

                }

                if (accion.equals("eliminar")) {
                    boolean responseDelete = cargodao.delete(cargo);
                    risponse.put("data", responseDelete);
                    if (responseDelete) {
                        risponse.put("msg", "Usuario eliminado correctamente");
                    } else {
                        risponse.put("msg", "No se pudo eliminar el usuario");
                    }
                } else {

                    risponse.put("data", cargo);
                }

            } else {
                List<Cargo> cargos = cargodao.list();
                risponse.put("data", cargos);
            }
        } catch (SQLException ex) {
            risponse.put("rpta", -1);
            risponse.put("msg", ex.getMessage());
        }

        String json = gson.toJson(risponse);
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
