/* 4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04Tema2 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dias = 5; int personas = 8;
        Persona[][] matrizCasting = new Persona[dias][personas];
        int dni, edad, i, j, cupos;
        String name;
        //inicializar matriz
        for (i=0; i < dias; i++){
            for (j=0; j < personas; j++ ){
                matrizCasting[i][j] = new Persona();
            }
        }

    //------------ Cargar Matriz  ---------------
        cupos = 0; 
        i = 0;
        j = 0;
        dni = GeneradorAleatorio.generarInt(900);
        edad = GeneradorAleatorio.generarInt(30);
        name = GeneradorAleatorio.generarString(3);

        while ((cupos < 40) && "ZZZ" != name){
            if (j == 8){
                System.out.println("EL indice i:" + i);
                j = 0;
                i++;
            }
            System.out.print("EL indice j:" + j + " ");
            matrizCasting[i][j].setDNI(dni);
            matrizCasting[i][j].setNombre(name);
            matrizCasting[i][j].setEdad(edad);
            
            dni = GeneradorAleatorio.generarInt(900);
            edad = GeneradorAleatorio.generarInt(90);
            name = GeneradorAleatorio.generarString(3);
            j++;
            cupos++;
        }
        
        //Impresion de Matriz
        System.out.println();
        System.out.println();
        for (i = 0; i < dias; i++){
            System.out.println("------------------------------ El dia actual es:" + (i+1) + "------------------------------");
            for (j = 0; j < personas ; j++ ){
                System.out.print("N: " + matrizCasting[i][j].getNombre() + ", Edad:"+ matrizCasting[i][j].getEdad() + " |");
            }
            System.out.println();
        }
    }
}
