/** To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.*/ /**** @author mique*/
package tema3;

public class Ej05Tema3 {
    public static void main(String[] args) {
        Circulo circ = new Circulo(50, "Amariilo", "Azul");
        System.out.print("AREA CIRCULO:");
        System.out.println(circ.calcularArea());
        System.out.print("Perimetro CIRCULO:");
        System.out.println(circ.calcularPerimetro());
    }    
}
