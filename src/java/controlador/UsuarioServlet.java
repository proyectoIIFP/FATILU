package controlador;

import DAO.UsuarioDAOImpl;
import entity.login;
import interfaces.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    // UsuarioServlet
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Obtener los parámetros del formulario
        String nuevoNroCelular = request.getParameter("nroCelular");
        String nuevaDireccion = request.getParameter("direccion");

        // Obtener el usuario de la sesión
        HttpSession session = request.getSession();
        login usuario = (login) session.getAttribute("usuario_id");

        // Actualizar los campos
        usuario.setTelefono_id(Integer.parseInt(nuevoNroCelular));
        usuario.setDireccion_id(nuevaDireccion);

        // Llamar al DAO para actualizar la información en la base de datos
        UsuarioDAOImpl dao = new UsuarioDAOImpl();
        dao.actualizarUsuario(usuario);
        // Actualizar los atributos de sesión
        session.setAttribute("celular", nuevoNroCelular);
        session.setAttribute("direccion", nuevaDireccion);
        // Redirigir a la página de perfil actualizada o a donde desees
        response.sendRedirect("mostrarPerfil.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
