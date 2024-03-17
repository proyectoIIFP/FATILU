package controlador;

import DAO.SolicitudCreditoDAOImpl;
import entity.SolicitudCredito;
import interfaces.SolicitudCreditoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SolicitudCreditoServlet")
public class SolicitudCreditoServlet extends HttpServlet {
    private final SolicitudCreditoDAO solicitudDAO = new SolicitudCreditoDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtén los parámetros del formulario
            double monto = Double.parseDouble(request.getParameter("monto"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String ci = request.getParameter("ci");
            String nroCelular = request.getParameter("nroCelular");
            String direccion = request.getParameter("direccion");

            // Crea un objeto SolicitudCredito
            SolicitudCredito solicitud = new SolicitudCredito(monto, nombre, apellido, ci, nroCelular, direccion);

            // Inserta la solicitud en la base de datos
            solicitudDAO.insertarSolicitud(solicitud);

            // Puedes redirigir a una página de confirmación u otro destino según tus necesidades
            response.sendRedirect("confirmacionSolicitud.jsp");
        } catch (NumberFormatException e) {
            // Manejar la excepción si la conversión de monto a double falla
            e.printStackTrace();
            // Puedes redirigir a una página de error si es necesario
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            // Manejar otras excepciones
            e.printStackTrace();
            // Puedes redirigir a una página de error si es necesario
            response.sendRedirect("error.jsp");
        }
    }
    
}
