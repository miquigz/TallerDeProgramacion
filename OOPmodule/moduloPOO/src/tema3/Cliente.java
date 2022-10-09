/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor *//** ** @author mique*/
package tema3;


public class Cliente {
    private String nombre;
    private int edad;
    private int DNI;
    
    public Cliente(String name,int age,int dni){
        this.nombre = name;
        this.edad = age;
        this.DNI = dni;
    }
//Getters
    public String getNombre(){return nombre;}
    public int getEdad(){return edad;}
    public int getDNI(){return DNI; }
//Setters
    public void setNombre(String nombre){this.nombre = nombre;}
    public void setEdad(int edad){this.edad = edad;}
    public void setDNI(int DNI){this.DNI = DNI;}
//methods
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
    
    
}
