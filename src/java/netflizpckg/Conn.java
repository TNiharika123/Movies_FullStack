package netflizpckg;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author 91991
 */
public class Conn {
   public Connection con;
    public Conn(){
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            System.out.println("Connected Successfully");
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String arg[]){
        new Conn();
    }
}


