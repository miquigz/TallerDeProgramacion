/** To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.*//** * @author mique*/
package tema3;


public class Circulo {
    private double radio;
    private String relleno;
    private String linea;

    public Circulo(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }
    //Getters
    public double getRadio() {
        return radio;   }
    public String getRelleno() {
        return relleno;   }
    public String getLinea() {
        return linea;   }
    //Setters
    public void setRadio(double radio) {
        this.radio = radio; }
    public void setRelleno(String relleno) {
        this.relleno = relleno; }
    public void setLinea(String linea) {
        this.linea = linea; }
    //Methods
    
    public double calcularArea(){
        return Math.PI * Math.pow(radio, 2);
    }
    public double calcularPerimetro(){
        return 2 * Math.PI * this.radio;
    }
    
}
