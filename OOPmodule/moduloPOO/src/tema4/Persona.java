package tema4;

public class Persona {
    private String name;
    private int DNI;
    private int edad;

    public Persona(String name, int DNI, int edad) {
        this.name = name;
        this.DNI = DNI;
        this.edad = edad;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    public String toString(){
        String text = "Mi nombre es " + this.getName() + ", mi DNI es " + this.getDNI() + " y tengo  " + this.getEdad() + " anios";
        return text;
    }
    
}
