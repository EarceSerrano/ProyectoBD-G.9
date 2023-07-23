/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package proyectobd;




import BD.ConexionOracle;
/**
 *
 * @author Esteban
 */
public class Main {

     public static void main(String[] args) {
        System.out.println("Codigo para la base de datos-Proyecto");
           ConexionOracle conn = new ConexionOracle();
           conn.desconectar();
           
    }
    
///La conexion si se ejecuta, sin embargo actualmente no se puede agregar un paquete para probar la conexion.
}
