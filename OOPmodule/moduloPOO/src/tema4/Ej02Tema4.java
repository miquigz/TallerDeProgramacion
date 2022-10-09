package tema4;

public class Ej02Tema4 {
    
    public static void main(String[] args) {
        Entrenador ent = new Entrenador(15, "Pékerman", 1700.60, 2);
        
        Jugador jug = new Jugador(9, 5, "Dybala", 5700.90, 1);
        
        System.out.println(jug.toString());
        System.out.println(ent.toString());
    }
    
}
