
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/*Librerias importadas de Java*/
import java.time.LocalDateTime;

/**
 *
 * @author fatil
 */
public class login {

    int id;
    String nombre_id;
    String apellido_id;
    String direccion_id;
    String document;
    int telefono_id;
    String usuario_id;
    String contrasena_id;
    LocalDateTime fecha_hora;
    private int tipo_usuario;
    private double limiteCredito;

    public login() {
        /*constructor vacio.*/
    }

    public login(int id, String documento, String nombre_id, String apellido_id, String direccion_id, int telefono_id, String usuario_id, String contrasena_id, LocalDateTime fecha_hora, int tipo_usuario,
            double limiteCredito) {
        this.id = id;
        this.nombre_id = nombre_id;
        this.document = documento;
        this.apellido_id = apellido_id;
        this.direccion_id = direccion_id;
        this.telefono_id = telefono_id;
        this.usuario_id = usuario_id;//nro de cedula
        this.contrasena_id = contrasena_id;
        this.fecha_hora = fecha_hora;
        this.tipo_usuario = tipo_usuario;
        this.limiteCredito = limiteCredito;

    }

    public login(int aInt, String string, String string0, String string1, int aInt0, String string2, String string3, LocalDateTime object, int aInt1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public login(String string, double aDouble) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_id() {
        return nombre_id;
    }

    public void setNombre_id(String nombre_id) {
        this.nombre_id = nombre_id;
    }

    public String getDocumento() {
        return document;
    }

    public void setDocumento(String document) {
        this.document = document;
    }

    public String getApellido_id() {
        return apellido_id;
    }

    public void setApellido_id(String apellido_id) {
        this.apellido_id = apellido_id;
    }

    public String getDireccion_id() {
        return direccion_id;
    }

    public void setDireccion_id(String direccion_id) {
        this.direccion_id = direccion_id;
    }

    public int getTelefono_id() {
        return telefono_id;
    }

    public void setTelefono_id(int telefono_id) {
        this.telefono_id = telefono_id;
    }

    public String getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(String usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getContrasena_id() {
        return contrasena_id;
    }

    public void setContrasena_id(String contrasena_id) {
        this.contrasena_id = contrasena_id;
    }

    public LocalDateTime getFecha_hora() {
        return fecha_hora;
    }

    public void setFecha_hora(LocalDateTime fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

    public int getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(int tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public double getLimiteCredito() {
        return limiteCredito;
    }

    public void setLimiteCredito(double limiteCredito) {
        this.limiteCredito = limiteCredito;
    }

    public int getDeudaPendiente() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public double getMontoAbonado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
