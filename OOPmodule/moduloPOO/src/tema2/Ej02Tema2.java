/* 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.    */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02Tema2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int dimF = 15;
        Persona[] vecPersonas = new Persona[dimF];
        int i, dni, edad;
        String name;
        i=0;
        dni = GeneradorAleatorio.generarInt(7000);
        edad = GeneradorAleatorio.generarInt(90);
        name = GeneradorAleatorio.generarString(20);
        while (i < dimF && edad != 0){
            vecPersonas[i] = new Persona(name, dni, edad);
            i++;
            dni = GeneradorAleatorio.generarInt(7000);
            edad = GeneradorAleatorio.generarInt(90);
            name = GeneradorAleatorio.generarString(20);
        }
        int dimL = i;
        /*for (i=0; i < dimF; i++){

           vecPersonas[i] = new Persona(name, dni, edad);
        }*/
        for (i=0; i < dimL; i++){
            System.out.println(vecPersonas[i]);
        }
        int auxCant = 0;
        Persona menorDni = new Persona();
        menorDni.setDNI(9000);
        for (i=0; i < dimL; i++){
           if (vecPersonas[i].getDNI() < menorDni.getDNI() )
               menorDni = vecPersonas[i];
           if (vecPersonas[i].getEdad() > 65)
               auxCant++;
        }
        System.out.println("Canti: " + auxCant + " y menor dni: " + menorDni.toString());
    } 
}
