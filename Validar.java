/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

/*Librerias importadas de Java*/
import entity.login;

/**
 *
 * @author fatil
 */
public interface Validar {
    public int validar(login log);
    login obtenerDatosUsuario(String usuario_id, String contrasena_id);
    
}
