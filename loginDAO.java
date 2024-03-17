/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//loginDAO.java
package DAO;

/*Librerias importadas del Java*/
import conexion.Conexion;
import entity.login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import interfaces.Validar;
import java.sql.SQLException;

/**
 *
 * @author fatil
 */
public class loginDAO implements Validar {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public int validar(login log) {
        int r = 0;
        String sql = "select codigo,acceso, contrasena, tipopersona_codigo from persona where acceso=? and contrasena=?";
        try {
            con = cn.getConnection(); // Aquí utilizamos cn en lugar de Conexion
            ps = con.prepareStatement(sql);
            ps.setString(1, log.getUsuario_id());
            ps.setString(2, log.getContrasena_id());

            rs = ps.executeQuery();
            while (rs.next()) {
                r = r + 1;
                log.setId(rs.getInt("codigo"));
                log.setUsuario_id(rs.getString("acceso"));
                log.setContrasena_id(rs.getString("contrasena"));
                log.setTipo_usuario(rs.getInt("tipopersona_codigo"));
            }
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            cerrarRecursos(ps, con);
        }
    }

    public String obtenerNombreUsuario(String usuario_id, String contrasena_id) {
        String nombreUsuario = null;

        String sql = "SELECT nombre FROM persona WHERE acceso = ? AND contrasena= ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario_id);
            ps.setString(2, contrasena_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                nombreUsuario = rs.getString("nombre");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Maneja la excepción de manera adecuada
        } finally {
            cerrarRecursos(ps, con);
        }

        return nombreUsuario;
    }

    @Override
    public login obtenerDatosUsuario(String usuario_id, String contrasena_id) {
        login usuario = null;
        String sql = "SELECT codigo, cedula, acceso, contrasena, tipopersona_codigo, nombre, apellido, direccion, celular FROM persona WHERE acceso=? AND contrasena=?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario_id);
            ps.setString(2, contrasena_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new login();
                usuario.setId(rs.getInt("codigo"));
                usuario.setDocumento(rs.getString("cedula"));
                usuario.setUsuario_id(rs.getString("acceso"));
                usuario.setContrasena_id(rs.getString("contrasena"));
                usuario.setTipo_usuario(rs.getInt("tipopersona_codigo"));
                usuario.setNombre_id(rs.getString("nombre"));
                usuario.setApellido_id(rs.getString("apellido"));
                usuario.setDireccion_id(rs.getString("direccion"));
                usuario.setTelefono_id(rs.getInt("celular"));
            }
        } catch (SQLException e) {
        } finally {
            cerrarRecursos(ps, con);
        }

        return usuario;
    }

    public boolean existeUsuario(String usuario) {
        String sql = "SELECT acceso FROM persona WHERE acceso = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            rs = ps.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            cerrarRecursos(ps, con);
        }
    }

    private void cerrarRecursos(PreparedStatement ps1, Connection con1) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
        }
    }

    public void actualizarUsuario(login usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
