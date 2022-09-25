package tema1;
//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int i, j; int dimF = 5;
        int[][] matrizEnteros = new int[dimF][dimF];
        //i = columnas (col) , j = filas (row)
        for (i=0; i < dimF; i++)
            for (j=0; j < dimF; j++)
                matrizEnteros[i][j] = GeneradorAleatorio.generarInt(31);
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i=0; i < dimF; i++){
            for (j=0; j < dimF; j++){
                System.out.print(" " + matrizEnteros[i][j] + " ");
            }
            System.out.println("    La fila actual es: " + i);
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int fila1 = 0;
        //Si quiero calcular la fila 1, debo pasar por todas las columnas de la fila 1. es decir [1][0], [1][1], [1][2], [1][3]. 
        for (j=0; j < dimF; j++)
            fila1 = fila1 + matrizEnteros[1][j];
        System.out.println(" --------------------------------------------  ");
        System.out.println("La suma de elementos de la fila 1 : " + fila1);
        System.out.println(" --------------------------------------------  ");
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        int [] vec5 = new int[dimF];
        
        for (j=0; j < dimF; j++){ //Recorro columnas
            int columnaSuma = 0;
            for (i=0; i < dimF; i++) //Recorro filas
                columnaSuma = columnaSuma + matrizEnteros[i][j];
            vec5[j] = columnaSuma;
        }
        System.out.println("Vector de suma de elementos de columna:");
        for (j=0; j < dimF; j++)
            System.out.print(" Suma de col:"+j+" " +  vec5[j] + ", ");
        System.out.println();
        System.out.println(" --------------------------------------------  ");
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        boolean encontre = false;
        System.out.println("Ingrese un valor a buscar en la matriz");
        int buscar = Lector.leerInt();
        for (i= 0; i < dimF; i++)
            for (j= 0; j < dimF; j++){
                if ( (!encontre) && ( matrizEnteros[i][j] == buscar) ){
                    encontre = true;
                    System.out.println("Valor encontrado: "+ buscar + " En la fila y columna: " + i + " "+ j);
                }
            }
        if (!encontre){
            System.out.println("Valor a buscar; no hallado, (No se encontró el elemento)");
        }
        System.out.println(" --------------------------------------------  ");
    }
}