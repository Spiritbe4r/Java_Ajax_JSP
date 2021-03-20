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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import pe.edu.idat.ajaxjsp.dao.Prod_Diaria_Dao;
import pe.edu.idat.ajaxjsp.models.Cargo;
import pe.edu.idat.ajaxjsp.models.Produc_Diaria;
import pe.edu.idat.ajaxjsp.models.Producciones;
import pe.edu.idat.ajaxjsp.models.Worker;

/**
 *
 * @author ronal
 */
@WebServlet("/prod_diaria")
public class Prod_Dia_Control extends HttpServlet {
    private Prod_Diaria_Dao prod_diaDao;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           
        }
    }

    @Override
    public void init() throws ServletException {
        try {
            prod_diaDao = Prod_Diaria_Dao.getInstance();
        } catch (SQLException ex) {
            Logger.getLogger(Prod_Dia_Control.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        configResponse(resp);
        
        Cargo carg;
        Producciones prudcs;
        Worker empleado;
        

        Map<String, Object> response = new HashMap<>();
        response.put("rpta", 1);
        response.put("msg", "ok");
        
        
        

        int id = Integer.parseInt(req.getParameter("id"));
        empleado=new Worker();
        empleado.setId_worker(Integer.parseInt(req.getParameter("empleadoId")));
        carg = new Cargo();
        carg.setIdCargo(Integer.parseInt(req.getParameter("idCargo")));
        prudcs=new Producciones();
        prudcs.setProductionId(Integer.parseInt(req.getParameter("productionId")));
        
       /* SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");

        Date Fecha = null;

        try {
            Fecha = formatoFecha.parse(req.getParameter("fecha_trab"));

        } catch (ParseException pe) {
            pe.printStackTrace();
        }*/
        int cantidad=Integer.parseInt(req.getParameter("cantidad"));
        
 

        Produc_Diaria produc_diaria;
        try {
            produc_diaria = prod_diaDao.find(id);
            produc_diaria.setId_empleado(empleado);
            produc_diaria.setId_cargo(carg);
            produc_diaria.setProduction_id(prudcs);
           // produc_diaria.setFecha_trabaj(Fecha);
            produc_diaria.setCantidad_diaria(cantidad);
            
            

            produc_diaria = prod_diaDao.save(produc_diaria);
            response.put("data", produc_diaria);
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
        Map<String, Object> response = new HashMap<>();
        response.put("rpta", 1);
        response.put("msg", "ok");

        try {
            if (req.getParameter("id") != null) {
                int id = Integer.parseInt(req.getParameter("id"));
                Produc_Diaria produc_diaria = prod_diaDao.find(id);

                String accion = req.getParameter("accion");
                if (accion == null) {
                    accion = "";

                }

                if (accion.equals("eliminar")) {
                    boolean responseDelete = prod_diaDao.delete(produc_diaria);
                    response.put("data", responseDelete);
                    if (responseDelete) {
                        response.put("msg", "Usuario eliminado correctamente");
                    } else {
                        response.put("msg", "No se pudo eliminar el usuario");
                    }
                }
                else if (accion.equals("show")) {
                    List<Produc_Diaria> producs_diarias = prod_diaDao.list();
                response.put("data", producs_diarias);
                }
                else {

                    response.put("data", produc_diaria);
                }

            } else {
                List<Produc_Diaria> producs_diarias = prod_diaDao.list();
                response.put("data", producs_diarias);
            }
        } catch (SQLException ex) {
            response.put("rpta", -1);
            response.put("msg", ex.getMessage());
        }

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


    


