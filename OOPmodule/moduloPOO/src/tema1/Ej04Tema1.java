/* 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.                      */
/* @author miqui */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04Tema1 {
    public static void main(String[] args) {
        //Inicializamos Aleatorio
        GeneradorAleatorio.iniciar();
        
        int dimPisos, dimOfi;     //filas = pisos [i]
        dimPisos = 8; dimOfi = 4; // oficinas = columnas. [j]
        int i, j;
        int [][] edificio = new int[dimPisos][dimOfi];
        
        //Inicializamos matriz, para poder contar las personas:
        
        for (i=0; i < dimPisos; i++)
            for (j=0; j < dimOfi; j++)
                edificio[i][j]= 0;
        
        //Simulamos la llega de personas al edifcio:
        int auxOfi, auxPiso = 0;
        while (auxPiso != 9){
            auxOfi= GeneradorAleatorio.generarInt(4);
            auxPiso= GeneradorAleatorio.generarInt(10); //random entre 0..9
            if (auxPiso != 9 && auxPiso != 8)
                edificio[auxPiso][auxOfi]++;
        }
        //Informar
        System.out.println("Cantidad de personas que concurrieron al edificio:");
        for (i=0; i < dimPisos; i++){
            for(j=0; j < dimOfi; j++)
                System.out.print(edificio[i][j] + " ");
            System.out.println("Piso actual:" + i);
        }
    }
}
