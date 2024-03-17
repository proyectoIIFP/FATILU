package controlador;

import DAO.ProductoDAO;
import entity.Producto;
import DAO.loginDAO;
import entity.login;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controlador extends HttpServlet {

    loginDAO dao = new loginDAO();
    ProductoDAO productoDAO = new ProductoDAO();
    login p = new login();
    int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");

        if (accion.equals("Ingresar")) {
            String usuario_id = request.getParameter("txtUsuario");
            String contrasena_id = request.getParameter("textContrasena");

            // Configura las credenciales del usuario
            p.setUsuario_id(usuario_id);
            p.setContrasena_id(contrasena_id);

            int resultadoValidacion = dao.validar(p);

            if (resultadoValidacion == 1) {
                // Obtener todos los datos del usuario
                login usuario = dao.obtenerDatosUsuario(usuario_id, contrasena_id);

                // Imprimir mensajes de depuración
    System.out.println("Nombre en el servlet: " + usuario.getNombre_id());
    System.out.println("Apellido en el servlet: " + usuario.getApellido_id());
    System.out.println("Telefono en el servlet: " + usuario.getTelefono_id());
    System.out.println("Direccion en el servlet: " + usuario.getDireccion_id());
    System.out.println("Documento en el servlet: " + usuario.getDocumento());
                
                // Almacenar en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                // Resto del código...
                int id = usuario.getId();
                int tipoUsuario = usuario.getTipo_usuario();
                String nombreUsuario = dao.obtenerNombreUsuario(usuario_id, contrasena_id);

                // Otros atributos
                String apellidoUsuario = usuario.getApellido_id();
                String direccionUsuario = usuario.getDireccion_id();
                String documento = usuario.getDocumento();
                int telefonoUsuario = usuario.getTelefono_id();

                // Configurar atributos en la sesión
                session.setAttribute("codigo", id);
                session.setAttribute("usuario", usuario_id);
                session.setAttribute("contrasena", contrasena_id);
                session.setAttribute("tipoUsuario", tipoUsuario);
                session.setAttribute("nombre", nombreUsuario);
                session.setAttribute("cedula", documento);
                session.setAttribute("apellidoUsuario", apellidoUsuario);
                session.setAttribute("direccionUsuario", direccionUsuario);
                session.setAttribute("telefonoUsuario", telefonoUsuario);

                // Redireccionar según el tipo de usuario
                if (tipoUsuario == 2) {
                    // Usuario tipo cliente
                    request.getRequestDispatcher("principal_cliente.jsp").forward(request, response);
                } else if (tipoUsuario == 1) {
                    // Usuario tipo administrador
                    request.getRequestDispatcher("principal_admin.jsp").forward(request, response);
                } else {
                    // Tipo de usuario no reconocido
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                // Usuario o contraseña incorrectos
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } else if (accion.equals("MostrarProductos")) {
            // Obtener la lista de productos desde el DAO
            List<Producto> listaProductos = productoDAO.obtenerProductos();
            request.setAttribute("listaProductos", listaProductos);
            request.getRequestDispatcher("productos.jsp").forward(request, response);
        } else if (accion.equals("BuscarProducto")) {
            // Resto del código...
        } else if (accion.equals("RegistrarProducto")) {
            // Resto del código...
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
