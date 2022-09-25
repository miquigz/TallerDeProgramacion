package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {
    /**
    * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        //Inicializamos generador aleatorio
        GeneradorAleatorio.iniciar();
        
        int DF=11;
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i < DF; i++){
            tabla2[i]= 2 * i;
            System.out.println(tabla2[i]);
        }
        int aux = 0;
        System.out.print("Multiplicaciones: ");
        while (aux != 11){
            aux = GeneradorAleatorio.generarInt(12);
            if (aux != 11)
                System.out.print(tabla2[aux] + " ");
        }
        System.out.println();
        System.out.println("2x" + "5" + "="+ tabla2[5]);
        System.out.println("Fin programa");
    }
}
