/* * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.*//**** @author mique*/
package tema3;

public class Ej04tema3 {
    
    public static void main(String[] args) {
        int nHabitaciones = 24; int i;
        Hotel hotel = new Hotel(nHabitaciones);
        System.out.println("------------------------------");
        System.out.println("Hotel cant hab: " + hotel.getNHabitaciones());

        Cliente C = new Cliente("Jhon", 24, 3934);
        int X = 19; //habitacion a insertar el cliente
        hotel.ingresarCliente(C, X-1);
        //Imprimimos hotel
        System.out.println("------------------------------");
        System.out.println(hotel.toString());
        //Aumentar el monto de todas las habitaciones:
        double monto = 400;
        hotel.aumentarCosto(monto);
        //Imprimimos hotel
        System.out.println("---------Aumentamos costo---------");
        System.out.println(hotel.toString());
        System.out.println("---------------");

    }
}

