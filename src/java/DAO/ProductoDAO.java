/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/*Librerias importadas del Java*/
import conexion.Conexion;
import entity.Producto;
import entity.login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import interfaces.ValidarProd;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author fatil
 */
public class ProductoDAO implements ValidarProd{
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
        
   
    public int validarprod(Producto prod) {
        int r=0;
        String sql="SELECT * FROM productos WHERE nombre = ?";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, prod.getNombre());
            rs=ps.executeQuery();
            while(rs.next()){
                r=r+1;
                prod.setNombre(rs.getString("nombre"));
            }
            if(r==1){
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            //JOptionPane.showMessageDialog(null,"Error en la conexion de la BD"+e.toString());
            return 0;
        }
    }
    public void insertarProducto(Producto prod) {
    String sql = "INSERT INTO productos (nombre, descripcion, stock, stock_minimo, fecha_de_vencimiento, precio_venta, precio_compra) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, prod.getNombre());
        ps.setString(2, prod.getDescripcion());
        ps.setInt(3, prod.getStock());
        ps.setInt(4, prod.getStock_minimo());
        ps.setDate(5, prod.getFecha_de_vencimiento());
        ps.setDouble(6, prod.getPrecio_venta());
        ps.setDouble(7, prod.getPrecio_compra());
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    public List<Producto> obtenerProductos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}