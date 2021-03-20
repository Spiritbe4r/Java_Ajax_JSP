/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pe.edu.idat.ajaxjsp.connection.DbUtil;
import pe.edu.idat.ajaxjsp.models.Producciones;

/**
 *
 * @author ronal
 */
public class ModeloProducciones {

    private static Connection connection;
    
    private static ModeloProducciones instance;

    

    public static ModeloProducciones getInstance() {
        if (instance == null) {
            instance = new ModeloProducciones();
        }
        return instance;
    }
    public List<Producciones> list() throws SQLException {
        connection = DbUtil.getDataSource().getConnection();
        List<Producciones> productions = new ArrayList<>();

        String query = "SELECT * FROM tbl_produccion";

        PreparedStatement stm = connection.prepareStatement(query);
        ResultSet rs = stm.executeQuery();

        Producciones production;
        while (rs.next()) {
            production = new Producciones();
            production.setProductionId(rs.getInt("production_id"));
            production.setProductionName(rs.getString("production_name"));
            production.setProductionProv(rs.getString("pro_proveedor"));
            production.setProductionPrice(rs.getDouble("production_price"));
            production.setProductionCant(rs.getInt("production_cant"));
            
            productions.add(production);
       
        }

        return productions;
    }

    /*public static ArrayList<Producciones> selectAll() {
        connection = DbUtil.getConnection();

        Statement st = null;
        ResultSet rs = null;

        Producciones items;
        ArrayList<Producciones> list = new ArrayList<>();
       
        
        try {
            String sql = "SELECT * FROM tbl_produccion";

            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                items = new Producciones();
                items.setProductionId(rs.getInt("production_id"));
                items.setProductionName(rs.getString("production_name"));
                items.setProductionProv(rs.getString("pro_proveedor"));;
                items.setProductionPrice(rs.getDouble("production_price"));

                items.setProductionCant(rs.getInt("production_cant"));
                list.add(items);
            }

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }

        }
        return list;
    }*/
    
    public Producciones save(Producciones production) throws SQLException {
        PreparedStatement stm;
        ResultSet gk;
        
        if (production.getProductionId()== 0) {
            stm = connection.prepareStatement("INSERT INTO tbl_produccion(production_name, pro_proveedor, production_price,production_cant)"
                    + " VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, production.getProductionName());
            stm.setString(2, production.getProductionProv());
            stm.setDouble(3, production.getProductionPrice());
            stm.setInt(4, production.getProductionCant());
            stm.execute();
            
            gk = stm.getGeneratedKeys();
            while (gk.next()) {
                production.setProductionId(gk.getInt(1));
            }
        } else {
            stm = connection.prepareStatement("UPDATE tbl_produccion SET production_name = ?, pro_proveedor = ?,production_price = ?,production_cant =? WHERE production_id = ?");
            stm.setString(1, production.getProductionName());
            stm.setString(2, production.getProductionProv());
            stm.setDouble(3, production.getProductionPrice());
            stm.setInt(4, production.getProductionCant());
            stm.setInt(5, production.getProductionId());
            stm.execute();
        }
        return production;
    }
    
    public Producciones find(int id) throws SQLException {
        Producciones production = new Producciones();

        PreparedStatement stm = connection.prepareStatement("SELECT * FROM tbl_produccion WHERE production_id = ?");
        stm.setInt(1, id);
        
        ResultSet rs = stm.executeQuery();
        while(rs.next()) {
            
            production.setProductionId(rs.getInt("production_id"));
            production.setProductionName(rs.getString("production_name"));
            production.setProductionProv(rs.getString("pro_proveedor"));
            production.setProductionPrice(rs.getDouble("production_price"));
            production.setProductionCant(rs.getInt("production_cant"));
       
        }
        
        return production;
    }
    
     public boolean delete(Producciones production) throws SQLException {
        PreparedStatement stm = connection.prepareStatement("DELETE FROM tbl_produccion WHERE production_id = ?");
        stm.setInt(1, production.getProductionId());
        stm.execute();
        
        
        return true;
    }
     
}
