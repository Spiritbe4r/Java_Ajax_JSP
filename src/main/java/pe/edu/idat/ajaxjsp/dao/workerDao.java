package pe.edu.idat.ajaxjsp.dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pe.edu.idat.ajaxjsp.connection.DbUtil;
import pe.edu.idat.ajaxjsp.models.Cargo;
import pe.edu.idat.ajaxjsp.models.Worker;

/**
 *
 * @author ronal
 */
public class workerDao {
    private Connection cnx;
    private static workerDao instance;

    private workerDao() throws SQLException {
        cnx = DbUtil.getDataSource().getConnection();
    }

    public static workerDao getInstance() throws SQLException {
        if (instance == null) {
            instance = new workerDao();
        }
        return instance;

    }
    
    public List<Worker> list() throws SQLException {
        List<Worker> empleados = new ArrayList<>();

        String query = "SELECT * from tbl_empleados ";

        PreparedStatement stm = cnx.prepareStatement(query);
        ResultSet rs = stm.executeQuery();

        Worker empleado;
        while (rs.next()) {
            empleado = new Worker();
            empleado.setId_worker(rs.getInt("id_empleado"));
            empleado.setNombres(rs.getString("nombres"));
            empleado.setApellidos(rs.getString("apellidos"));
            empleado.setSexo(rs.getString("sexo"));
            empleado.setTelefono(rs.getInt("telefono"));
            empleado.setDni(rs.getString("dni"));
            empleado.setSueldo(rs.getDouble("sueldo"));
            empleado.setCargo(new Cargo());
            empleado.getCargo().setIdCargo(rs.getInt("id_cargo"));
            
            
           
            empleados.add(empleado);
        }

        return empleados;
    }
    
    
    public Worker save(Worker empleado) throws SQLException {
        PreparedStatement stm;
        ResultSet gk;

        if (empleado.getId_worker()== 0) {
            stm = cnx.prepareStatement(
                    "INSERT INTO tbl_empleados (nombres,apellidos, sexo,telefono,dni,sueldo,id_cargo)"
                    + " VALUES (?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, empleado.getNombres());
            stm.setString(2, empleado.getApellidos());
            stm.setString(3, empleado.getSexo()); 
            stm.setInt(4, empleado.getTelefono());
            
            stm.setString(5, empleado.getDni());
            stm.setDouble(6, empleado.getSueldo());
            stm.setInt(7, empleado.getCargo().getIdCargo()); 
 

            stm.execute();
  

            gk = stm.getGeneratedKeys();
            while (gk.next()) {
                empleado.setId_worker(gk.getInt(1));
            }
        } else {
            stm = cnx.prepareStatement("UPDATE tbl_empleados SET nombres = ?,apellidos = ?,sexo = ?, telefono = ? , "
                    + "dni = ?, sueldo = ?, id_cargo = ? WHERE id_empleado= ?");
            stm.setString(1, empleado.getNombres());
            stm.setString(2, empleado.getApellidos());
            stm.setString(3, empleado.getSexo()); 
            stm.setInt(4, empleado.getTelefono());
            stm.setString(5, empleado.getDni());
            stm.setDouble(6, empleado.getSueldo());
            stm.setInt(7, empleado.getCargo().getIdCargo()); 
            stm.setInt(8, empleado.getId_worker());
  
            stm.execute();

        }

        return empleado;
    }
    
    public Worker find(int id) throws SQLException {
        Worker empleado = new Worker();

        PreparedStatement stm = cnx.prepareStatement("SELECT * FROM tbl_empleados WHERE id_empleado = ?");
        stm.setInt(1, id);

        ResultSet rs = stm.executeQuery();
        while (rs.next()) {

            empleado.setId_worker(rs.getInt("id_empleado"));
            empleado.setNombres(rs.getString("nombres"));
            empleado.setApellidos(rs.getString("apellidos"));
            empleado.setSexo(rs.getString("sexo"));
            empleado.setTelefono(rs.getInt("telefono"));
            empleado.setDni(rs.getString("dni"));
            empleado.setSueldo(rs.getDouble("sueldo"));
            empleado.setCargo(new Cargo());
            empleado.getCargo().setIdCargo(rs.getInt("id_cargo"));
            


        }

        return empleado;
    }

    
   

    public boolean delete(Worker empleado) throws SQLException {
        PreparedStatement stm = cnx.prepareStatement("DELETE FROM tbl_empleados WHERE id_empleado = ?");
        stm.setInt(1, empleado.getId_worker());
        stm.execute();
       

        return true;

    }
    
}
