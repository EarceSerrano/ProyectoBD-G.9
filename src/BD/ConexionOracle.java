
package BD;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Kenneth Godinez Chaves
 */
public class ConexionOracle {
    private Connection conn = null;
    private String url, user, pass;
    
    public ConexionOracle(){
        conectar();
}

private void conectar(){
    try{
        Class.forName("oracle.jdbc.OracleDriver"); //Driver BD
        url = "jdbc:oracle:thin:@KennethG:1521:orcl2121";
        user = "CURSO1";
        pass = "123"; 
        conn = DriverManager.getConnection(url, user, pass);
        System.out.println("Conectado!");
    } catch (Exception e){
        System.out.println("Error, no se pudo conectar");
    }
}

public void desconectar(){
    try {
        conn.close();
        System.out.println("Desconectar");
    } catch (Exception e){
        System.out.println("Error, no se pudo desconectar");
    }
}
}
