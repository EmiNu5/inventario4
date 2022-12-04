package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class conexion {
    private static Connection con = null;
    private static final String  URL = "jdbc:mysql://localhost:3306/";
    private static final String  DATABASE = "inventario";
    private static final String  USER= "root";
    private static final String  PASS = ""; 
    public static Connection Conectar(){
        //control de exception
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();//ruta del driver
            con = DriverManager.getConnection(URL+DATABASE,USER,PASS);
        }catch (Exception e){
            System.err.println(e.getMessage());
        }
        return con;
    }

//    public static Connection getConnection() {
//        Connection cnn = null;
//        try {
//
//            //USAMDP DATASOURCE - POOL DE CONEXIONES
//            Context ctx = new InitialContext();
//            DataSource ds = (DataSource) ctx.lookup("jdbc/StoreDS");
//            cnn = ds.getConnection();
//
//        } catch (Exception ex) {
//            System.err.println(ex.getMessage());
//        }
//        return cnn;
//    }
}
