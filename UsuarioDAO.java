/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

// Importar las clases necesarias

import entity.login;


public interface UsuarioDAO {
    login obtenerUsuarioPorId(int id);
    void actualizarUsuario(login usuario);
    // Otros métodos...
}



