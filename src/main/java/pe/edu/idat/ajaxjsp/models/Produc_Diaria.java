/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.models;
import java.util.Date;

/**
 *
 * @author ronal
 */
public class Produc_Diaria {
    
    
    private int id_prod_trab;
    private Worker id_empleado; 
    private Cargo id_cargo;
    private Producciones production_id;
    private Producciones production_price;
    private int cantidad_diaria;
    private Date fecha_trabaj;
    
    public Produc_Diaria() {

    }

    public int getId_prod_trab() {
        return id_prod_trab;
    }

    public void setId_prod_trab(int id_prod_trab) {
        this.id_prod_trab = id_prod_trab;
    }

    public Worker getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(Worker id_empleado) {
        this.id_empleado = id_empleado;
    }

    public Cargo getId_cargo() {
        return id_cargo;
    }

    public void setId_cargo(Cargo id_cargo) {
        this.id_cargo = id_cargo;
    }

    public Producciones getProduction_id() {
        return production_id;
    }

    public void setProduction_id(Producciones production_id) {
        this.production_id = production_id;
    }

    public Producciones getProduction_price() {
        return production_price;
    }

    public void setProduction_price(Producciones production_price) {
        this.production_price = production_price;
    }

    public int getCantidad_diaria() {
        return cantidad_diaria;
    }

    public void setCantidad_diaria(int cantidad_diaria) {
        this.cantidad_diaria = cantidad_diaria;
    }

    public Date getFecha_trabaj() {
        return fecha_trabaj;
    }

    public void setFecha_trabaj(Date fecha_trabaj) {
        this.fecha_trabaj = fecha_trabaj;
    }

    

   
    
    
}
