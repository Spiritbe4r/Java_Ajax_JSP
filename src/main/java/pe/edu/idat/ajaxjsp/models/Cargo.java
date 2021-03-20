/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.models;

/**
 *

*/
public class Cargo {

    private int idCargo;
    private String nombreCargo;
    private int estadoCargo;

    public Cargo(int idCargo, String nombreCargo, int estadoCargo) {
        this.idCargo = idCargo;
        this.nombreCargo = nombreCargo;
        this.estadoCargo = estadoCargo;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getNombreCargo() {
        return nombreCargo;
    }

    public void setNombreCargo(String nombreCargo) {
        this.nombreCargo = nombreCargo;
    }

    public int getEstadoCargo() {
        return estadoCargo;
    }

    public void setEstadoCargo(int estadoCargo) {
        this.estadoCargo = estadoCargo;
    }

        public Cargo(){
        
    }

    
}
