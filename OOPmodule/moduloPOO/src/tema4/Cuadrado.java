package tema4;

public class Cuadrado extends Figura{
    private double lado;
 //constr   
    public Cuadrado(double unLado, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setLado(unLado);

    } 
//getter 
    public double getLado(){
        return lado;       
    }
//setter
    public void setLado(double unLado){
        lado=unLado;
    }
//methods
    public double calcularArea(){
       return (getLado()* getLado());
    }
    
    public double calcularPerimetro(){
       return (getLado()*4);
    }
    
    public String toString(){
       String aux = super.toString() + 
                    " Lado: " + getLado();
       return aux;
    }

}
