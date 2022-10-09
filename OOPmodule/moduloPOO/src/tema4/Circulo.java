package tema4;

public class Circulo extends Figura{
    private double radio;
    //Constructor
    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }
    //Setters & Getters

    public double getRadio() {
        return radio;}
    public void setRadio(double radio) {
        this.radio = radio;}
    
    //Methods
    public double calcularArea(){
        return Math.PI * Math.pow(radio, 2);
    }
    public double calcularPerimetro(){
        return 2 * Math.PI * this.radio;
    }
    
    public String toString(){
        String text = super.toString()
                + "\n" + "Radio:" + this.getRadio();
        return text;
    }
}
