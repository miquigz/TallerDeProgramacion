package tema3;

public class Ej01Tema3 {
    
    public static void main(String[] args) {
        Triangulo triang = new Triangulo(30, 20, 25, "amarillo", "azul");
        
        System.out.println("peri: " + triang.calcularPerimetro());
        System.out.println("Area: " + triang.calcularArea());
    }
}
