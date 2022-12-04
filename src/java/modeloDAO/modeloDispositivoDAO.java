package modeloDAO;

import config.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.clsDispositivo;

public class modeloDispositivoDAO implements interfazDispositivoDAO {

    @Override
    public List<modelo.clsDispositivo> listar(String filtro) {
        List<modelo.clsDispositivo> dispositivos = new ArrayList<>();
        String sql = "select * from dispositivo dis "
                + "inner join estados est ON est.idEstado = dis.estado "
                + "where estado = '" + filtro + "'";
        try {
            PreparedStatement ps = conexion.Conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                clsDispositivo d = new clsDispositivo();
                d.setIdDispositivo(rs.getInt(1));
                d.setNombre(rs.getString(2));
                d.setMarca(rs.getString(3));
                d.setEstado(rs.getString(11));
                dispositivos.add(d);
            }
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return dispositivos;
    }

    @Override
    public int registrarDispositivo(clsDispositivo dispositivo) {
        int resultado = 0;
        String sql = "INSERT INTO dispositivo(nombre,marca,estado,proveedor,fechaAlta,observacion)values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conexion.Conectar().prepareStatement(sql);
            ps.setString(1, dispositivo.getNombre());
            ps.setString(2, dispositivo.getMarca());
            ps.setString(3, dispositivo.getEstado());
            ps.setString(4, dispositivo.getProveedor());
            ps.setString(5, dispositivo.getFechaAlta());
            ps.setString(6, dispositivo.getObservacion());
            resultado = ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error en la BD al agregar a : " + e);
        }
        return resultado;
    }

    @Override
    public clsDispositivo getId(int idDispositivo) {
        String sql = "select * from dispositivo where idDispositivo =?";
        clsDispositivo d = new clsDispositivo();
        try {
            PreparedStatement ps = conexion.Conectar().prepareStatement(sql);
            ps.setInt(1, idDispositivo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setIdDispositivo(rs.getInt(1));
                d.setNombre(rs.getString(2));
                d.setMarca(rs.getString(3));
                d.setProveedor(rs.getString(5));
            }
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return d;
    }
}
