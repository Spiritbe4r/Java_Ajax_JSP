/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.idat.ajaxjsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pe.edu.idat.ajaxjsp.connection.DbUtil;
import pe.edu.idat.ajaxjsp.models.Category;
import pe.edu.idat.ajaxjsp.models.Post;

/**
 *
 * @author ronal
 */
public class PostDao {
    
    private Connection cnx;
    private static PostDao instance;

    private PostDao() throws SQLException {
        cnx = DbUtil.getDataSource().getConnection();
    }

    public static PostDao getInstance() throws SQLException {
        if (instance == null) {
            instance = new PostDao();
        }
        return instance;
    }
    public PostDao(Connection con) {
        this.cnx = con;
    }



    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = cnx.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into posts(pTitle,pContent,pPic,catId,userId) values(?,?,?,?,?)";
            PreparedStatement pstmt = cnx.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            
            pstmt.setString(3, p.getpPic());
            pstmt.setInt(4, p.getCatId());
            pstmt.setInt(5, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    get all the posts
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = cnx.prepareStatement("select * from posts order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
           
                String pPic = set.getString("pPic");
   
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pPic, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = cnx.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pPic,  catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = cnx.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
              
                String pPic = set.getString("pPic");
               
                int cid=set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pPic, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}