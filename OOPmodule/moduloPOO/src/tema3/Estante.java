package tema3;
/* @author mique */
public class Estante {
    private int dimF, dimL;
    private Libro[] libros;

    public Estante(){
        this.dimF = 20;
        dimL = 0;
        libros = new Libro[dimF];
    }
    //DimF dinamico, constructor.
    public Estante(int dimF) {
        dimL = 0;
        this.dimF = dimF;
        libros = new Libro[dimF];
    }
    
    public int getAlmacenados(){
        return dimL;
    }
    
    public int getDimF(){
        return this.dimF;
    }
    
    public boolean estaLleno(){
        return dimL == dimF;
    }
    
    public void agregarLibro(Libro libro){
        if (dimL < dimF){
            libros[dimL] = libro;
            dimL++;
        }else{
            System.out.println("!!!!!!!!Dimension del array superada!!!!!!, no se puede ingresar libro");
        }
    }
    
    public Libro buscarTitulo(String titulo){
        int i; 
        Libro aux = new Libro();
        for (i=1; i < dimF; i++){
            if (libros[i].getTitulo() == titulo){
                aux = libros[i];
            }
        }
        return aux;
    }
}
