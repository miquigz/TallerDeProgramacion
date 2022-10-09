/*1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s = a+b+c/2 .  La función raíz cuadrada es Math.sqrt(#). **>/ *//** @author miqui */
package tema3;


public class Triangulo {
    
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    //Constructores
    public Triangulo(double unLado, double unLado2, double unLado3, String unColorRelleno, String unColorLinea){
        lado1 = unLado;
        lado2 = unLado2;
        lado3 = unLado3;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }
    
    public Triangulo(){   
    }
        
    //Getters
    public double getLado1(){
        return  lado1;
    }
    public double getLado2(){
        return  lado2;
    }
    public double getLado3(){
        return  lado3;
    }
    public String getRelleno(){
        return  colorRelleno;
    }
    public String getLinea(){
        return  colorLinea;
    }
    //Setters
    public void setRelleno(String unColor){
        colorRelleno = unColor;
    }
    public void setLinea(String unColor){
        colorLinea = unColor;
    }
    public void setLado1(double unLado){
        lado1 = unLado;
    }
    public void setLado2(double unLado){
        lado2 = unLado;
    }
    public void setLado3(double unLado){
        lado3 = unLado;
    }
    //Metodos (Acciones)
    public double calcularPerimetro(){
        return (lado1 + lado2 + lado3);
    }
    
    public double calcularArea(){
        double s = this.calcularPerimetro() / 2;
        s = (s * (s - this.lado1) + (s - this.lado3) + (s - this.lado2));
        Math.sqrt(s);
        return s;
    }
}
