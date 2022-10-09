/**** @author miqui*/
package tema4;

public abstract class Empleado {
    private String name;
    private Double sueldo;
    private int antiguedad;//en anios
    
    public Empleado(String name, Double sueldo, int antiguedad){
        this.name = name;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    //Getters & Setters
    public String getName() {
        return name;}
    public void setName(String name) {
        this.name = name;}
    public Double getSueldo() {
        return sueldo;}
    public void setSueldo(Double sueldo) {
        this.sueldo = sueldo;}
    public int getAntiguedad() {
        return antiguedad;}
    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;}
    
    
    
    public abstract double calcularEfectividad();
    
    public abstract double calcularSueldoACobrar();
    
    public String toString(){
        String text = this.name + this.sueldo + this.antiguedad 
                + "\n" + this.calcularEfectividad() 
                + "\n" + this.calcularSueldoACobrar();
        return text;
    }
}
