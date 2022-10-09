/* * To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools 
Templates* and open the template in the editor.*//**** @author mique*/
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    private int nHabitaciones;
    private Habitacion [] habitaciones;
    
    public Hotel(int nHabitaciones){
        GeneradorAleatorio.iniciar();
        this.nHabitaciones = nHabitaciones;
        habitaciones = new Habitacion[this.nHabitaciones];//Instanciamos array, con su dimF;
        int i;
        for (i=0; i < this.nHabitaciones; i++){ //Instanciamos cada elemento del array, los cuales son Objetos
            habitaciones[i] = new Habitacion(GeneradorAleatorio.generarDouble(8000)+2000);
        }
    }
    public int getNHabitaciones(){
        return this.nHabitaciones;
    }
    public void aumentarCosto(double monto){
        int i;
        for (i=0; i < this.nHabitaciones; i++){
            habitaciones[i].setCostoNoche(habitaciones[i].getCostoNoche() + monto);
        }
    }
    public void ingresarCliente(Cliente cliente, int numHabitacion){
        //Asumimos que num es valido, y que la habitacion esta libre
        habitaciones[numHabitacion].setCliente(cliente);
        habitaciones[numHabitacion].setOcupada(true);
    }
    public String toString(){
        int i;String auxMsj = " ";
        for (i=0; i < this.nHabitaciones; i++){
            auxMsj = auxMsj + "Habitacion:"+(i+1)+ habitaciones[i].toString() + "\n";
        }
        return auxMsj;
    }
    
    
    
}
