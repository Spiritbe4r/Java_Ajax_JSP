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
public class Post {

    private int pid;
    private String pTitle;
    private String pContent;
    private String pPic;
    private int catId;
    private int userId;

    public Post() {

    }

    public Post(int pid, String pTitle, String pContent, String pPic, int catId, int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(String pTitle, String pContent, String pPic, int catId, int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.catId = catId;
        this.userId = userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
