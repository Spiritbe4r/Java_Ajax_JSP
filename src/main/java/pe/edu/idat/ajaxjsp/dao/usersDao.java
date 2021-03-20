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
import pe.edu.idat.ajaxjsp.models.Users;

/**
 *
 * @author ronal
 */
public class usersDao {

    private Connection cnx;
    private static usersDao instance;

    private usersDao() throws SQLException {
        cnx = DbUtil.getDataSource().getConnection();
    }

    public static usersDao getInstance() throws SQLException {
        if (instance == null) {
            instance = new usersDao();
        }
        return instance;

    }

    /*public Users identificar(Users user) throws Exception {
        Users usu = null;
        ResultSet rs = null;
        Statement st = null;
        String sql = "SELECT U.ID_user, C.NOMBRE_CARGO FROM tbl_user U INNER JOIN tbl_CARGO C ON U.ID_CARGO = C.ID_CARGO WHERE U.user_estado = 1 AND U.username = = '" + user.getUsername() + "' "
                + "AND U.password = '" + user.getuPassword() + "'";
        try {

            st = cnx.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next() == true) {
                usu = new Users();
                usu.setIdUser(rs.getInt("ID_user"));
                usu.setUsername(user.getUsername());
                usu.setUserCargo(new Cargo());
                usu.getUserCargo().setNombreCargo(rs.getString("NOMBRE_CARGO"));
                usu.setUserEstado(true);
            }

        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (cnx != null) {
                    cnx.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }

        }
        return usu;
    }*/
    public List<Users> list() throws SQLException {
        List<Users> users = new ArrayList<>();

        String query = "SELECT u.id_user,u.username ,u.password,u.fullname,u.user_estado,c.id_cargo,c.nombre_cargo "
                + "FROM tbl_user u INNER JOIN tbl_cargo c on u.id_cargo=c.id_cargo ";

        PreparedStatement stm = cnx.prepareStatement(query);
        ResultSet rs = stm.executeQuery();

        Users user;
        while (rs.next()) {
            user = new Users();
            user.setIdUser(rs.getInt("id_user"));
            user.setUsername(rs.getString("username"));
            user.setuPassword(rs.getString("password"));
            user.setuFullname(rs.getString("fullname"));
            user.setUserEstado(rs.getInt("user_estado"));

            user.setUserCargo(new Cargo());
            user.getUserCargo().setIdCargo(rs.getInt("id_cargo"));
            user.getUserCargo().setNombreCargo(rs.getString("nombre_cargo"));
            users.add(user);
        }

        return users;
    }

    public Users save(Users user) throws SQLException {
        

        PreparedStatement stm;
        ResultSet gk;

        if (user.getIdUser() == 0) {
            stm = cnx.prepareStatement(
                    "INSERT INTO tbl_user (username,password,fullname, user_estado,id_cargo)"
                    + " VALUES (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getuPassword());
            stm.setString(3, user.getuFullname());
            stm.setInt(4, user.getUserEstado());
            stm.setInt(5, user.getUserCargo().getIdCargo());

            stm.execute();

            gk = stm.getGeneratedKeys();
            while (gk.next()) {
                user.setIdUser(gk.getInt(1));
            }
        } else {
            stm = cnx.prepareStatement("UPDATE tbl_user SET username = ?,password = ?,fullname = ?, user_estado = ?, id_cargo = ? WHERE id_user = ?");
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getuPassword());
            stm.setString(3, user.getuFullname());
            stm.setInt(4, user.getUserEstado());
            stm.setInt(5, user.getUserCargo().getIdCargo());
            stm.setInt(6, user.getIdUser());

            stm.execute();
           

        }
        return user;

    }

    public Users find(int id) throws SQLException {
        Users user = new Users();

        try {

            PreparedStatement stm = cnx.prepareStatement("SELECT * FROM tbl_user WHERE id_user = ?");
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                user.setIdUser(rs.getInt("id_user"));
                user.setUsername(rs.getString("username"));
                user.setuPassword(rs.getString("password"));
                user.setuFullname(rs.getString("fullname"));
                user.setUserEstado(rs.getInt("user_estado"));

                user.setUserCargo(new Cargo());
                user.getUserCargo().setIdCargo(rs.getInt("id_cargo"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean delete(Users usuario) throws SQLException {
        PreparedStatement stm = cnx.prepareStatement("DELETE FROM tbl_user WHERE id_user = ?");
        stm.setInt(1, usuario.getIdUser());
        stm.execute();

        return true;

    }
}
