/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

public class Producto {
    private int id_producto; // PostgreSQL asignará automáticamente valores únicos y secuenciales a este campo
    private String nombre;
    private String codigo;
    private String descripcion;
    private int stock;
    private int stock_minimo;
    private Date fecha_de_vencimiento;
    private double precio_venta;
    private double precio_compra;

    // Constructor vacío (puedes personalizarlo según tus necesidades)
    public Producto() {
    }

    // Constructor sin id_producto (lo omitimos porque será autoincremental)
    public Producto(String codigo,String nombre, String descripcion, int stock, int stock_minimo,
                    Date fecha_de_vencimiento, double precio_venta, double precio_compra) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.stock = stock;
        this.stock_minimo = stock_minimo;
        this.fecha_de_vencimiento = fecha_de_vencimiento;
        this.precio_venta = precio_venta;
        this.precio_compra = precio_compra;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStock_minimo() {
        return stock_minimo;
    }

    public void setStock_minimo(int stock_minimo) {
        this.stock_minimo = stock_minimo;
    }

    public Date getFecha_de_vencimiento() {
        return fecha_de_vencimiento;
    }

    public void setFecha_de_vencimiento(Date fecha_de_vencimiento) {
        this.fecha_de_vencimiento = fecha_de_vencimiento;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }

    public double getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(double precio_compra) {
        this.precio_compra = precio_compra;
    }
    
}
