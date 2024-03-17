package DAO;

import conexion.Conexion;
import entity.SolicitudCredito;
import interfaces.SolicitudCreditoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SolicitudCreditoDAOImpl implements SolicitudCreditoDAO {

    @Override
    public void insertarSolicitud(SolicitudCredito solicitud) {
        try (Connection con = Conexion.getConnection();
                PreparedStatement stmt = con.prepareStatement("INSERT INTO solicitudes_credito (monto, nombre, apellido, ci, nro_celular, direccion) VALUES (?, ?, ?, ?, ?, ?)")) {

            stmt.setDouble(1, solicitud.getMonto());
            stmt.setString(2, solicitud.getNombre());
            stmt.setString(3, solicitud.getApellido());
            stmt.setString(4, solicitud.getCi());
            stmt.setString(5, solicitud.getNroCelular());
            stmt.setString(6, solicitud.getDireccion());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Maneja la excepción según tus necesidades
        }
    }

     @Override
    public List<SolicitudCredito> obtenerTodasSolicitudes() {
        List<SolicitudCredito> solicitudes = new ArrayList<>();

        try (Connection connection = Conexion.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM solicitudes_credito")) {

            while (resultSet.next()) {
                SolicitudCredito solicitud = new SolicitudCredito();
                solicitud.setId(resultSet.getInt("id"));
                solicitud.setMonto(resultSet.getDouble("monto"));
                solicitud.setNombre(resultSet.getString("nombre"));
                solicitud.setApellido(resultSet.getString("apellido"));
                solicitud.setCi(resultSet.getString("ci"));
                solicitud.setNroCelular(resultSet.getString("nro_celular"));
                solicitud.setDireccion(resultSet.getString("direccion"));
                solicitudes.add(solicitud);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Maneja la excepción según tus necesidades
        }

        return solicitudes;
    }

    @Override
    public void aprobarSolicitud(int id) {
        // Implementa la lógica para aprobar la solicitud en la base de datos
        // Puedes realizar un UPDATE en la base de datos para cambiar el estado de la solicitud, por ejemplo.
        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement("UPDATE solicitudes_credito SET estado = 'Aprobada' WHERE id = ?")) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Maneja la excepción según tus necesidades
        }
    }

    @Override
    public void rechazarSolicitud(int id) {
        // Implementa la lógica para rechazar la solicitud en la base de datos
        // Puedes realizar un UPDATE en la base de datos para cambiar el estado de la solicitud, por ejemplo.
        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement("UPDATE solicitudes_credito SET estado = 'Rechazada' WHERE id = ?")) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Maneja la excepción según tus necesidades
        }
    }
}
