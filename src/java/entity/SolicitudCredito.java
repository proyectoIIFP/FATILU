package entity;

import java.io.Serializable;

public class SolicitudCredito implements Serializable {
    private double monto;
    private String nombre;
    private String apellido;
    private String ci;
    private String nroCelular;
    private String direccion;
    private String estado;

    // Constructores, getters y setters
    

    // (Implementa según tus necesidades)

    public SolicitudCredito() {
    }

    public SolicitudCredito(double monto, String nombre, String apellido, String ci, String nroCelular, String direccion) {
        this.monto = monto;
        this.nombre = nombre;
        this.apellido = apellido;
        this.ci = ci;
        this.nroCelular = nroCelular;
        this.direccion = direccion;
         this.estado = "Pendiente"; // Por defecto, las solicitudes están pendientes
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public String getNroCelular() {
        return nroCelular;
    }

    public void setNroCelular(String nroCelular) {
        this.nroCelular = nroCelular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setId(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
