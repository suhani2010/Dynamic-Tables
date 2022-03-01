
package com.table.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.table.entities.User;
import com.table.helper.ConnectionProvider;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;




public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to database
    
    public boolean saveUser(User user){
        boolean f=false;
        try{
            //user-->database
            String query="INSERT INTO user(name,email,password,gender) VALUES (?,?,?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="SELECT* FROM user WHERE email =? and password =?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
           // System.out.println(email+" "+password);
            if(rs.next())
            {
                user=new User();
                //data from db
                String name=rs.getString("name");
                
                //set to user object
                user.setName(name);
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
            }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
        System.out.println(user);
         return user;
        
    }
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        try{
            String query="update user set name =? , email =? , password =?, gender =?,where id=?";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setInt(5, user.getId());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean createNewTable( String tableName, List<String> newTableColumns,String email) {
    
    //ArrayList to string separated by comma
    
    String tColumNames = String.join(",",newTableColumns );
     boolean f=false;
        try{
            Statement stmt = ConnectionProvider.getStatement();
            String query = "CREATE TABLE "+tableName+"( "+tColumNames+";";
            System.out.println("query : "+query);
            stmt.execute(query);
            String q="INSERT INTO userInfo(email,tablename) VALUES (?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(q);
            
            pstmt.setString(1, email);
            pstmt.setString(2, tableName);
            
            System.out.println(q);
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    
}
}
