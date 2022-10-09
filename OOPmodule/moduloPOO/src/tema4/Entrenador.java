package tema4;

public class Entrenador extends Empleado{
    private int campeonatos;

    public Entrenador(int campeonatos, String name, Double sueldo, int antiguedad) {
        super(name, sueldo, antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return campeonatos;}
    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;}

    
    public double calcularEfectividad() {
        double anios = this.getAntiguedad();
        double campeonatos = this.getCampeonatos();
        return campeonatos / anios;
    }

    public double calcularSueldoACobrar() {
        double sueldo = this.getSueldo();
        
        double diezPorciento = sueldo * 0.1; //10% del sueldo basico
        sueldo = sueldo + (diezPorciento * this.getAntiguedad()); //10% * anio antiguedad 
        
        if (this.getCampeonatos() >= 1 && this.getCampeonatos() < 4 ){
            sueldo = sueldo + 5000;
        }else if (this.getCampeonatos() >= 5 && this.getCampeonatos() <= 10){
            sueldo = sueldo + 30000;
        }else if (this.getCampeonatos() > 10){
            sueldo = sueldo + 50000;
        }
        
        return sueldo;
    }
    
}
