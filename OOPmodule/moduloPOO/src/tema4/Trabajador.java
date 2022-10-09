package tema4;

public class Trabajador extends Persona{
    private String tarea;
    
    public Trabajador(String tarea,String name, int DNI, int edad) {
        super(name, DNI, edad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }
    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
    public String toString(){
        String text = super.toString() + "Soy " + this.getTarea();
        return text;
    }
    
}
