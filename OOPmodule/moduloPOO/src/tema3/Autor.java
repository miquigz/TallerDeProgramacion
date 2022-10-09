package tema3;

/**
 *
 * @author mique
 */
public class Autor {
    
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(String name, String bio, String orig){
        nombre = name;
        biografia = bio;
        origen = orig;
    }
    
    public Autor(){
        
    }
    //Getters
    public String getNombre(){
        return nombre;
    }
    public String getBiografia(){
        return biografia;
    }
    public String getOrigen(){
        return origen;
    }
    //Setters
    public void setNombre(String name){
        nombre = name;
    }
    public void setBiografia(String bio){
        biografia = bio;
    }
    public void setOrigen(String ori){
        origen = ori;
    }
    
    public String toString(){
        String aDevolver =  ("Nombre: " + this.nombre + " de origen: " + this.origen + " biografia: " + this.biografia);
        return aDevolver;
    }
    
}
