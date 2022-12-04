package modelo;

public class clsEstado {

    private int id;
    private String nombre;

    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public clsEstado() {
    }

    public clsEstado(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }
    
}
