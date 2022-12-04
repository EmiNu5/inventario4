package modelo;

import java.sql.Date;

public class clsDispositivo {

    public int idDispositivo;
    public String nombre;
    public String marca;
    public String estado;
    public String proveedor;
    public String destino;
    public String fechaAlta;
    public String fechaUltMod;
    public String observacion;

    public clsDispositivo(int idDispositivo, String nombre, String marca, String estado,String proveedor,String destino, String fechaAlta, String fechaUltMod, String observacion) {
        this.idDispositivo = idDispositivo;
        this.nombre = nombre;
        this.marca = marca;
        this.estado = estado;
        this.proveedor = proveedor;
        this.destino = destino;        
        this.fechaAlta = fechaAlta;
        this.fechaUltMod = fechaUltMod;
        this.observacion = observacion;
    }



    public clsDispositivo() {
    }

    public int getIdDispositivo() {
        return idDispositivo;
    }

    public void setIdDispositivo(int idDispositivo) {
        this.idDispositivo = idDispositivo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(String fechaAlta) {
        this.fechaAlta = fechaAlta;
    }
    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
    public String getFechaUltMod() {
        return fechaUltMod;
    }

    public void setFechaUltMod(String fechaUltMod) {
        this.fechaUltMod = fechaUltMod;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
}
