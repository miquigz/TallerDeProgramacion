/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
/**
 *
 * @author mique
 */

public class Ej01Tema4 {
    
    public static void main(String[] args) {
        Triangulo tri = new Triangulo(35, 35, 50, "rojo", "violeta");
        Circulo cir = new Circulo(50, "marron", "azul");
        
        System.out.println(tri.toString());
        System.out.println(cir.toString());
        
        tri.despintar();
        cir.despintar();
        System.out.println("=--------------Despintados------------=");
        System.out.println(tri.toString());
        System.out.println(cir.toString());
    }
}
