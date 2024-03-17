/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.SolicitudCreditoDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fatil
 */
@WebServlet("/AdminCreditosServlet")
public class AdminCreditosServlet extends HttpServlet {
    private final SolicitudCreditoDAOImpl solicitudDAO = new SolicitudCreditoDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && !action.isEmpty()) {
            int id = Integer.parseInt(request.getParameter("id"));

            if ("aprobar".equals(action)) {
                solicitudDAO.aprobarSolicitud(id);
            } else if ("rechazar".equals(action)) {
                solicitudDAO.rechazarSolicitud(id);
            }

            // Redirige nuevamente a la página de administración después de la acción
            response.sendRedirect("admin_creditos.jsp");
        } else {
            // Maneja otras acciones si es necesario
        }
    }
}
