/*
Clase Libro a la cual se agregaron constructores. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private String editorial;
   private Autor autor;
   private int añoEdicion;
   private String ISBN;
   private double precio;
   
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor autor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial;
         añoEdicion = unAñoEdicion;
         this.autor = autor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    public Libro(  String unTitulo,  String unaEditorial, Autor autor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial;
         añoEdicion = 2015;
         this.autor = autor;
         ISBN =  unISBN;
         precio = 100;
    }
    
    public Libro(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    public Autor getPrimerAutor(){
        return this.autor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    public void setPrimerAutor(Autor autor){
         this.autor = autor;
    } 
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + autor + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}
