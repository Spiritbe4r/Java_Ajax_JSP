/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.models;

/**
 *
 * @author ronal
 */
public class Producciones {

   

    private int productionId;
    private String productionName;
    private String productionProv;
    private double productionPrice;
    private int productionCant;
    
    public Producciones(){
        
    }

    public Producciones(int productionId, String productionName, String productionProv, double productionPrice, int productionCant) {
        this.productionId = productionId;
        this.productionName = productionName;
        this.productionProv = productionProv;
        this.productionPrice = productionPrice;
        this.productionCant = productionCant;
    }

    public int getProductionId() {
        return productionId;
    }

    public void setProductionId(int productionId) {
        this.productionId = productionId;
    }

    public String getProductionName() {
        return productionName;
    }

    public void setProductionName(String productionName) {
        this.productionName = productionName;
    }

    public String getProductionProv() {
        return productionProv;
    }

    public void setProductionProv(String productionProv) {
        this.productionProv = productionProv;
    }

    public double getProductionPrice() {
        return productionPrice;
    }

    public void setProductionPrice(double productionPrice) {
        this.productionPrice = productionPrice;
    }

    public int getProductionCant() {
        return productionCant;
    }

    public void setProductionCant(int productionCant) {
        this.productionCant = productionCant;
    }

    @Override
    public String toString() {
        return "Produciones{" + "productionId=" + productionId + ", productionName=" + productionName + ", productionProv=" + productionProv + ", productionPrice=" + productionPrice + ", productionCant=" + productionCant + '}';
    }
    

    

}
