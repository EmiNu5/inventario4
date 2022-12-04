package modeloDAO;

import java.util.List;
import modelo.clsDispositivo;

public interface interfazDispositivoDAO {

    public List<modelo.clsDispositivo> listar(String filtro);

    public int registrarDispositivo(clsDispositivo dispositivo);

    public clsDispositivo getId(int idDispositivo);
}
