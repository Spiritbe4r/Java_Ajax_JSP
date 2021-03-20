/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.connection;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author ronal
 */

public class DbUtil {

   private static DataSource dataSource;
   
    private static final String ELVIN_LOOKUP_SERVICE = "java:/comp/env/jdbc/textDB";

    static {
        try {
            Context context = new InitialContext();
            Object lookup = context.lookup(ELVIN_LOOKUP_SERVICE);
            if (lookup != null) {
                dataSource = (DataSource) lookup;
            } else {
                new RuntimeException("ELVIN look up issue.");
            }
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
    
    public void closeConnection(Connection connection) throws SQLException {
        connection.close();
    } 

}
