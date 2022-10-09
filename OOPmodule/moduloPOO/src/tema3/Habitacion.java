/** To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor. *//**** @author mique*/
package tema3;

public class Habitacion {
    private double costoNoche;
    private boolean ocupada;
    private Cliente cliente;

    public Habitacion(double costoNoche){
        this.costoNoche = costoNoche;
        this.ocupada = false;
    }

    public Habitacion(double costoNoche, Cliente cliente) {
        this.costoNoche = costoNoche;
        this.ocupada = true;
        this.cliente = cliente;
    }
//Getters
    public double getCostoNoche(){return costoNoche;}
    public boolean isOcupada(){return ocupada;}
    public Cliente getCliente(){return cliente;}
//Setters
    public void setCostoNoche(double costoNoche){this.costoNoche = costoNoche;}
    public void setOcupada(boolean ocupada){this.ocupada = ocupada;}
    public void setCliente(Cliente cliente){this.cliente = cliente;}
//Methods
    
    public String toString(){
        String aux;
        aux = "Costo: " + costoNoche + "Ocupada:" + ocupada;
        if (ocupada){
            aux = aux + " " +this.cliente.toString();
        }
        return aux;
    }
    
}
