/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BD;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionOracle {
    private Connection conn = null;
    private String url, user, pass;
    
    public ConexionOracle(){
        conectar();
    }
 
    private void conectar(){
        try{  
            Class.forName("oracle.jdbc.OracleDriver"); //Driver DB
            url = "jdbc:oracle:thin:@localhost:1521:orcl" ;
            user= "JAVA";
            pass= "JAVA";
                    conn = DriverManager.getConnection(url, user, pass);
                    System.out.println("Conectando!");
                    
        } catch(Exception e){
            System.out.println("No se pudo establecer la conexion");
        }
    }
    
    
    public void desconectar(){
        try{
            conn.close();
            System.out.println("Desconectado!");
        } catch(Exception e){
            System.out.println("Error, no se pudo desconectar ");
        }
    }
    
}

///La conexion si se ejecuta, sin embargo actualmente no se puede agregar un paquete para probar la conexion.