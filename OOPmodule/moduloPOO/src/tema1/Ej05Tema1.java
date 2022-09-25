/*5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto. */
/**** @author miqui*/
package tema1;

import PaqueteLectura.Lector;

public class Ej05Tema1 {
    public static void main(String[] args) {
        int clientes = 2;
        int aspectos = 4;
        int [][] puntajes = new int[clientes][aspectos];
        int i, j;
        //nombrar aspectos:
        String [] aspectosArray = new String[aspectos];
        aspectosArray[0]= "Atencion al Cliente ";
        aspectosArray[1]= "Calidad de la comida ";
        aspectosArray[2]= "Precio ";
        aspectosArray[3]= "Ambiente ";
        //Leer calificaciones de los clientes
        for (i=0; i < clientes; i++){
            System.out.println("---------------------" +" Cliente nro: " + i + " ---------------------");
            for (j=0; j < aspectos; j++){
                System.out.print("Ingrese un puntaje 1..10, para el aspecto " + aspectosArray[j]);
                puntajes[i][j]= Lector.leerInt();
            }
        }
    //----- Promedio de puntaje por aspecto: -----
        int [] totalPuntajes = new int[aspectos];
        //Inicializamos vector sumaTotal:
        for (j=0; j < aspectos; j++)
            totalPuntajes[j] = 0;
        //Calculamos suma total de puntajes:
        for (i=0; i < clientes; i++){
            for (j=0; j < aspectos; j++){
                totalPuntajes[j] = totalPuntajes[j] + puntajes[i][j]; 
            }//Sumamos puntaje del cliente actual(i) del aspecto actual(j), en totalPuntajes del aspecto actual(j)
        }
        //Calculamos promedio, e informamos:
        System.out.println();
        System.out.println("--------------- Promedios de puntajes segun el aspecto: ---------------");
        for (j=0; j < aspectos; j++){
            double puntajeAct = totalPuntajes[j];
            System.out.println("El promedio para el aspecto: " + aspectosArray[j] + " fue: " + puntajeAct / clientes);
        }
    }
}
