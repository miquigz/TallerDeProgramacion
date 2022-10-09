package tema4;

public class Triangulo extends Figura{
    
    private double lado1;
    private double lado2;
    private double lado3;

    //Constructor
    public Triangulo(double lado1, double lado2, double lado3, String unCR, String unCL) {
        super(unCR, unCL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    //Getters & Setters

    public double getLado1() {
        return lado1;
    }
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public double calcularPerimetro(){
        return (lado1 + lado2 + lado3);
    }
    
    public double calcularArea(){
        double s = this.calcularPerimetro() / 2;
        s = (s * (s - this.getLado1()) * (s - this.getLado2()) * (s - this.getLado3()));
        Math.sqrt(s);
        return s;
    }
    
    public String toString(){
        String texto = super.toString()
                + "\n Lado1: "+ this.getLado1()
                + "\n" + "Lado2:" + this.getLado2()
                + "\n" + "Lado3:" + this.getLado3();
        return texto;
    }
}
