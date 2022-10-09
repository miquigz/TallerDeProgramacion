package tema4;

public class Ej05Tema4 {
    
    public static void main(String[] args) {
        
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        
        VisorFiguraModificado viso = new VisorFiguraModificado(3);
        
        System.out.println(viso.getCapacidadMaxima());
        System.out.println("----------");
        System.out.println(viso.getGuardadas());
        System.out.println(viso.quedaEspacio());
        viso.mostrar();
        System.out.println("-----------");
        viso.guardar(c1);
        viso.guardar(r);
        viso.guardar(c2);
        System.out.println("------INSERTADAS 3 figuras-----");
        System.out.println(viso.getGuardadas());
        System.out.println(viso.quedaEspacio());
        viso.guardar(r);
        System.out.println("-----------");
        viso.mostrar();
    }
}
