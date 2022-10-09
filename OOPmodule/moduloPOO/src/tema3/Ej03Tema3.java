/*3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?*/ /* @author miqui */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Ej03Tema3 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estante estante = new Estante(20);
        
        //Cargar Estante (Punto B).
        
        int i; Libro auxLibro; Autor auxAutor;
        
        for (i=0; i < estante.getDimF(); i++){
            if ( i == 10 ){
                auxAutor = new Autor (("Autor " + i), "Bio"+3*i, "origen"+i*2);
                auxLibro = new Libro ("Mujercitas", "editorial", i*2, auxAutor, "isbn2023", 243.0);
            }else{
                auxAutor = new Autor (("Autor " + i), "Bio"+3*i, "origen"+i*2);
                auxLibro = new Libro ("Titulo"+GeneradorAleatorio.generarString(3), "editorial", i*2, auxAutor, "isbn2023", 243.0);
            }
            estante.agregarLibro(auxLibro);
        }
        auxAutor = new Autor (("Autor " + i), "Bio"+3*i, "origen"+i*2);
        auxLibro = new Libro ("Titulo"+GeneradorAleatorio.generarString(3), "editorial", i*2, auxAutor, "isbn2023", 243.0);
        estante.agregarLibro(auxLibro);

        System.out.println(" Titulo encontrado:" + estante.buscarTitulo("Mujercitas"));
        System.out.println("Estante lleno?: " + estante.estaLleno());
        System.out.println("Cantidad de libros en el estante: "+ estante.getAlmacenados());
        
        System.out.println("Longitud del estante:" + estante.getDimF());
    }
    
}
