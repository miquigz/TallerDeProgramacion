/* 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI. */     /*** @author miqui*/
package tema2;

public class Ej01tema2 {
    
    public static void main(String[] args) {
        Persona Marcos = new Persona("marcos", 44100200, 23);
        //System.out.println(marcos.toString());
        //System.out.println(marcos.getDNI());
        Marcos.getDNI();

    }
    
}

