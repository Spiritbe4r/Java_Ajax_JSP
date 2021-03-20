/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pe.edu.idat.ajaxjsp.connection.DbUtil;
import pe.edu.idat.ajaxjsp.models.Cargo;

/**
 *
 * @author ronal
 */
public class cargoDao {
    
    private Connection cnx;
    private static cargoDao instance;

    private cargoDao() throws SQLException {
        cnx = DbUtil.getDataSource().getConnection();
    }

    public static cargoDao getInstance() throws SQLException {
        if (instance == null) {
            instance = new cargoDao();
        }
        return instance;

    }
    public List<Cargo> list() throws SQLException {
        List<Cargo> cargos = new ArrayList<>();

        String query = "SELECT c.id_cargo,c.nombre_cargo,c.estado_cargo "
                + "FROM tbl_cargo c ORDER BY c.nombre_cargo";

        PreparedStatement stm = cnx.prepareStatement(query);
        ResultSet rs = stm.executeQuery();

        Cargo ucargo;
        while (rs.next()) {
            ucargo = new Cargo();
            ucargo.setIdCargo(rs.getInt("id_cargo"));
            ucargo.setNombreCargo(rs.getString("nombre_cargo"));
            ucargo.setEstadoCargo(rs.getInt("estado_cargo"));
           

            
            cargos.add(ucargo);
        }

        return cargos;
    }
    
    public Cargo save(Cargo cargo) throws SQLException {
        PreparedStatement stm;
        ResultSet gk;
        
        if (cargo.getIdCargo()== 0) {
            stm = cnx.prepareStatement("INSERT INTO tbl_cargo(nombre_cargo, estado_cargo)"
                    + " VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, cargo.getNombreCargo());
            stm.setInt(2, cargo.getEstadoCargo());
            
            stm.execute();
            
            gk = stm.getGeneratedKeys();
            while (gk.next()) {
                cargo.setIdCargo(gk.getInt(1));
            }
        } else {
            stm = cnx.prepareStatement("UPDATE tbl_cargo SET nombre_cargo = ?, estado_cargo = ? WHERE id_cargo = ?");
            stm.setString(1, cargo.getNombreCargo());
            stm.setInt(2, cargo.getEstadoCargo());
            stm.setInt(3, cargo.getIdCargo());
            
            stm.execute();
        }
        return cargo;
    }
    
    public Cargo find(int id) throws SQLException {
        Cargo cargo = new Cargo();

        PreparedStatement stm = cnx.prepareStatement("SELECT * FROM tbl_cargo WHERE id_cargo = ?");
        stm.setInt(1, id);
        
        ResultSet rs = stm.executeQuery();
        while(rs.next()) {
            
            cargo.setIdCargo(rs.getInt("id_cargo"));
            cargo.setNombreCargo(rs.getString("nombre_cargo"));
            cargo.setEstadoCargo(rs.getInt("estado_cargo"));
            
       
        }
        
        return cargo;
    }
    
     public boolean delete(Cargo cargo) throws SQLException {
        PreparedStatement stm = cnx.prepareStatement("DELETE FROM tbl_cargo WHERE id_cargo = ?");
        stm.setInt(1, cargo.getIdCargo());
        stm.execute();
        
        
        return true;
    }
    
}
