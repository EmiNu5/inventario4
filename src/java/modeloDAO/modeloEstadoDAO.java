package modeloDAO;

import config.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import modelo.clsEstado;

public class modeloEstadoDAO implements interfazEstadoDAO {

    @Override
    public List<modelo.clsEstado> getAllEstado() {

        List<modelo.clsEstado> list = new ArrayList<modelo.clsEstado>();
        try {
            String sql = "SELECT * FROM estados";
            PreparedStatement ps = conexion.Conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                modelo.clsEstado categoriaEstado = new modelo.clsEstado();
                categoriaEstado.setId(rs.getInt("idEstado"));
                categoriaEstado.setNombre(rs.getString("DescEstado"));
                list.add(categoriaEstado);
            }
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        return list;
    }

}
