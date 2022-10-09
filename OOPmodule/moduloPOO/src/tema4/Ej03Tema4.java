package tema4;

public class Ej03Tema4 {
    
    public static void main(String[] args) {
        Persona per = new Persona("Marta", 4092, 70);
        Trabajador tra = new Trabajador("Jardinero","Mauro", 4092, 70);
        
        System.out.println("-------------");
        System.out.println(per.toString());
        System.out.println("-------------");
        System.out.println(tra.toString());
        System.out.println("-------------");
    }
     
}
