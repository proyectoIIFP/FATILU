package DAO;

import conexion.Conexion;
import entity.login;
import interfaces.UsuarioDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class UsuarioDAOImpl implements UsuarioDAO {
    private Conexion cn = new Conexion();

    @Override
    public login obtenerUsuarioPorId(int id) {
        login usuario = null;
        String sql = "SELECT * FROM persona WHERE codigo = ?";
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario = mapearUsuarioDesdeResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    @Override
    public void actualizarUsuario(login usuario) {
    try (Connection con = cn.getConnection();
         PreparedStatement ps = con.prepareStatement("UPDATE persona SET celular=?, direccion=? WHERE codigo=?")) {
        ps.setString(2, usuario.getDireccion_id());
        ps.setInt(3, usuario.getTelefono_id());
        ps.setString(1, usuario.getUsuario_id());
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    private login mapearUsuarioDesdeResultSet(ResultSet rs) throws SQLException {
        return new login(
            rs.getInt("codigo"),
            rs.getString("nombre"),
            rs.getString("apellido"),
            rs.getString("direccion"),
            rs.getInt("celular"),
            rs.getString("acceso"),
            rs.getString("contrasena"),
            rs.getObject("fecha_hora", LocalDateTime.class),
            rs.getInt("tipopersona_codigo")
        );
    }
}
