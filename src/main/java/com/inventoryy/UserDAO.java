package com.inventoryy;


import java.sql.Connection;
import java.sql.PreparedStatement;



public class UserDAO {



public boolean validateUser(
        String username,
        String password) {


    boolean status=false;


    String sql =
    "SELECT * FROM users WHERE username=? AND password=?";



    try {


        Connection con =
                DBConnection.getConnection();



        PreparedStatement ps =
                con.prepareStatement(sql);



        ps.setString(1, username);

        ps.setString(2, password);



        var rs =
                ps.executeQuery();



        if(rs.next()) {

            status=true;

        }



        rs.close();

        ps.close();

        con.close();



    }
    catch(Exception e){

        System.out.println(e.getMessage());

    }



    return status;

}


}