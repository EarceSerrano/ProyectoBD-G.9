
package ConexionDB;

import java.sql.Connection;

public class conexionOracle {
    private Connection conn = null;
    private String url, user, pass;
    
    public ConexionOracle(){
        conectar();
    }
 
    private void conectar(){
        try{  
            Class.forName("oracle.jdbc.OracleDriver") ;//Driver DB
            url = "jdbc:oracle:thin:@localhost:1521:orcl" ;
            user= "JAVA";
            pass= "JAVA";
                    conn = DriverManager.getConnection(url, user, pass);
                    System.out.println("Conectando");
                    
        } catch(Exception e){
            System.out.println("No se pudo establecer la conexion");
        }
    }
    
    
    public void desconectar(){
        try{
            conn.close();
        } catch(Exception e){
            System.out.println("Error, no se pudo desconectar ");
        }
    }
    
}
