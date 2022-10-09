package tema4;

public class VisorFiguraModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;

    public VisorFiguraModificado(int capMax){
        this.guardadas  = 0;
        if (capMax > 5){
            System.out.println("Tam excedido");
            this.capacidadMaxima = 5;
        }else{
            this.capacidadMaxima = capMax;
        }
        this.vector = new Figura[this.capacidadMaxima];
    }
    
    public VisorFiguraModificado(){
        this.guardadas = 0;
        this.capacidadMaxima = 5;
        this.vector = new Figura[5];
    }
    
    public void guardar(Figura f){
        if (this.quedaEspacio()){
            vector[this.getGuardadas()] = f;
            this.setGuardadas(this.getGuardadas() + 1);
        }else {
            System.out.println("Sin espacio en vector figuras");
        }
    }
    
    public boolean quedaEspacio(){
        return this.getGuardadas() < this.getCapacidadMaxima();
    }
    
    public void mostrar(){
        if (this.getGuardadas()!= 0){
            for (int i = 0; i < this.getGuardadas(); i++) {
                System.out.println(vector[i].toString());
            }
        }else {
            System.out.println("Sin figuras(vacio)");
        }
    }
    
    //getters & setters
    public int getCapacidadMaxima() {
        return capacidadMaxima;
    }
    public void setCapacidadMaxima(int capacidadMaxima) {
        this.capacidadMaxima = capacidadMaxima;
    }
    public Figura[] getVector(){
        return vector;
    }
    public void setVector(Figura[] vector) {
        this.vector = vector;
    }
    public int getGuardadas() {
        return guardadas;
    }
    public void setGuardadas(int guardadas){
        this.guardadas = guardadas;
    }
}
