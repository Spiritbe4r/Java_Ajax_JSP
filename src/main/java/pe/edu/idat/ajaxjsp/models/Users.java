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
public class Users {

    private int idUser;
    private String Username;
    private String uPassword;
    private String uFullname;
    private int userEstado;
    private Cargo userCargo;

    public Users(int idUser, String Username, String uPassword, String uFullname, int userEstado, Cargo userCargo) {
        this.idUser = idUser;
        this.Username = Username;
        this.uPassword = uPassword;
        this.uFullname = uFullname;
        this.userEstado = userEstado;
        this.userCargo = userCargo;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuFullname() {
        return uFullname;
    }

    public void setuFullname(String uFullname) {
        this.uFullname = uFullname;
    }

    public int getUserEstado() {
        return userEstado;
    }

    public void setUserEstado(int userEstado) {
        this.userEstado = userEstado;
    }

    public Cargo getUserCargo() {
        return userCargo;
    }

    public void setUserCargo(Cargo userCargo) {
        this.userCargo = userCargo;
    }
    

    

    
    public Users() {
        
    }

    public void setUserCargo(String userCargo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

}
