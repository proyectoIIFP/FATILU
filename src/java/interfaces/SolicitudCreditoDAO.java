/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

/**
 *
 * @author fatil
 */
import java.util.List;
import entity.SolicitudCredito;

public interface SolicitudCreditoDAO {
    void insertarSolicitud(SolicitudCredito solicitud);
    
    List<SolicitudCredito> obtenerTodasSolicitudes();
    void aprobarSolicitud(int id);
    void rechazarSolicitud(int id);
}
