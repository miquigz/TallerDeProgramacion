package tema1;
//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        //Paso 3: Crear el vector para 15 double 
        int dimF = 15;
        double [] jugadores = new double[dimF - 1];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double altura;
        double sumaTotal = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0; i < dimF; i++){
            System.out.println("Ingrese altura de jugador:");
            altura = Lector.leerDouble();
            sumaTotal = sumaTotal + altura;
            jugadores[i] = altura;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        double promedio = sumaTotal / dimF;
        System.out.println("El promedio de alturas fue: " + promedio );
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int superanProm = 0;
        for (i=0; i < dimF; i++)
            if (jugadores[i] > promedio)
                superanProm++;
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad q superan el prom fue: " + superanProm);
    }   
}