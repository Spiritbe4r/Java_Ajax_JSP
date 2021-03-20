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
import pe.edu.idat.ajaxjsp.models.Produc_Diaria;
import pe.edu.idat.ajaxjsp.models.Producciones;
import pe.edu.idat.ajaxjsp.models.Worker;

/**
 *
 * @author ronal
 */
public class Prod_Diaria_Dao {

    private Connection cnx;
    private static Prod_Diaria_Dao instance;

    private Prod_Diaria_Dao() throws SQLException {
        cnx = DbUtil.getDataSource().getConnection();
    }

    public static Prod_Diaria_Dao getInstance() throws SQLException {
        if (instance == null) {
            instance = new Prod_Diaria_Dao();
        }
        return instance;
    }

    public List<Produc_Diaria> list() throws SQLException {
        List<Produc_Diaria> producs_diarias = new ArrayList<>();

        String query = "SELECT p.id_prod_trab,e.id_empleado,e.nombres,e.apellidos,tp.production_id,tp.production_price,"
                + "p.cantidad_diaria,c.id_cargo,c.nombre_cargo, fecha_trab FROM `tbl_prod_diaria`p inner join tbl_cargo "
                + "c on p.id_Cargo=c.id_cargo INNER join tbl_empleados e on p.id_prod_trab=e.id_empleado inner join "
                + "tbl_produccion tp on tp.production_id=p.id_prod_trab";

        PreparedStatement stm = cnx.prepareStatement(query);
        ResultSet rs = stm.executeQuery();

        Produc_Diaria produc_diaria;
        while (rs.next()) {
            produc_diaria = new Produc_Diaria();

            produc_diaria.setId_prod_trab(rs.getInt("id_prod_trab"));
            produc_diaria.setId_empleado(new Worker());
            produc_diaria.getId_empleado().setId_worker(rs.getInt("id_empleado"));
            produc_diaria.getId_empleado().setNombres(rs.getString("nombres"));
            produc_diaria.getId_empleado().setApellidos(rs.getString("apellidos"));
            produc_diaria.setProduction_id(new Producciones());
            produc_diaria.getProduction_id().setProductionId(rs.getInt("production_id"));
            // produc_diaria.setProduction_price(new Producciones());
            produc_diaria.getProduction_id().setProductionPrice(rs.getDouble("production_price"));

            produc_diaria.setCantidad_diaria(rs.getInt("cantidad_diaria"));
            produc_diaria.setId_cargo(new Cargo());
            produc_diaria.getId_cargo().setIdCargo(rs.getInt("id_cargo"));

            produc_diaria.getId_cargo().setNombreCargo(rs.getString("nombre_cargo"));
            produc_diaria.setFecha_trabaj(rs.getDate("fecha_trab"));

            producs_diarias.add(produc_diaria);
        }

        return producs_diarias;
    }

    public Produc_Diaria save(Produc_Diaria produc_diaria) throws SQLException {

        PreparedStatement stm;
        ResultSet gk;

        if (produc_diaria.getId_prod_trab() == 0) {
            stm = cnx.prepareStatement(
                    "INSERT INTO tbl_prod_diaria (id_empleado,id_cargo,production_id,cantidad_diaria)"
                    + " VALUES (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

            stm.setInt(1, produc_diaria.getId_empleado().getId_worker());
            stm.setInt(2, produc_diaria.getId_cargo().getIdCargo());
            stm.setInt(3, produc_diaria.getProduction_id().getProductionId());

           
            stm.setInt(4, produc_diaria.getCantidad_diaria());

            stm.execute();

            gk = stm.getGeneratedKeys();
            while (gk.next()) {
                produc_diaria.setId_prod_trab(gk.getInt(1));
            }
        } else {
            stm = cnx.prepareStatement("UPDATE tbl_prod_diaria SET id_empleado = ?,id_cargo = ?,production_id = ?, cantidad_diaria = ? WHERE id_prod_trab = ?");
            stm.setInt(1, produc_diaria.getId_empleado().getId_worker());
            stm.setInt(2, produc_diaria.getId_cargo().getIdCargo());
            stm.setInt(3, produc_diaria.getProduction_id().getProductionId());
           
            stm.setInt(4, produc_diaria.getCantidad_diaria());
            stm.setInt(5, produc_diaria.getId_prod_trab());

            stm.execute();

        }

        return produc_diaria;

    }

    public Produc_Diaria find(int id) {
        Produc_Diaria produc_diaria = new Produc_Diaria();

        try {

            PreparedStatement stm = cnx.prepareStatement("SELECT * FROM tbl_prod_diaria WHERE id_prod_trab = ?");
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                produc_diaria.setId_prod_trab(rs.getInt("id_prod_trab"));
                produc_diaria.setId_empleado(new Worker());
                produc_diaria.getId_empleado().setId_worker(rs.getInt("id_empleado"));
                produc_diaria.setId_cargo(new Cargo());
                produc_diaria.getId_cargo().setIdCargo(rs.getInt("id_cargo"));
                produc_diaria.setProduction_id(new Producciones());
                produc_diaria.getProduction_id().setProductionId(rs.getInt("production_id"));
                produc_diaria.setFecha_trabaj(rs.getDate("fecha_trab"));

                produc_diaria.setCantidad_diaria(rs.getInt("cantidad_diaria"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return produc_diaria;

    }

    public boolean delete(Produc_Diaria produc_diaria) throws SQLException {

        PreparedStatement stm = cnx.prepareStatement("DELETE FROM tbl_prod_diaria WHERE id_prod_trab = ?");
        stm.setInt(1, produc_diaria.getId_prod_trab());
        stm.execute();

        return true;
    }

}
