package tema4; /**@author miqui **/

public class Jugador extends Empleado{
    private int partidos;
    private int goles;

    public Jugador(int partidos, int goles, String name, Double sueldo, int antiguedad) {
        super(name, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }
    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }
    public int getGoles() {
        return goles;
    }
    public void setGoles(int goles) {
        this.goles = goles;
    }


    //Punto B y C
    public double calcularEfectividad() {
        double goles = this.getGoles();
        double partidos = this.getPartidos();
        return goles / partidos;
    }

    public double calcularSueldoACobrar() {
        double sueldo = this.getSueldo();
        double diezPorciento = sueldo * 0.1;
        sueldo = sueldo + ( diezPorciento * this.getAntiguedad() );
        if (this.calcularEfectividad() > 0.5)
            sueldo = sueldo + sueldo;
        return sueldo;
    }
    
    
    
    
    
}
