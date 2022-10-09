/** @author miqui*/
package tema2;

import PaqueteLectura.GeneradorAleatorio;


public class Ej05Tema2 {
     public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimF = 20;
        Partido[] partidos = new Partido[dimF];
        
        String local, visitante;
        int golLoc, golVis, partidoNum;
        partidoNum = 0;
        
        golLoc = GeneradorAleatorio.generarInt(8);
        golVis = GeneradorAleatorio.generarInt(8);
        local = GeneradorAleatorio.generarString(3);
        visitante = GeneradorAleatorio.generarString(3);
        
        
        while ( (partidoNum < 20) && ( visitante!= "ZZZ" )){
            partidos[partidoNum] = new Partido(local, visitante, golLoc, golVis);
            partidoNum++;
            golLoc = GeneradorAleatorio.generarInt(8);
            golVis = GeneradorAleatorio.generarInt(8);
            local = GeneradorAleatorio.generarString(3);
            visitante = GeneradorAleatorio.generarString(3);            
        }
        int i;
        int cantRiver = 0;//cant ganadas por river
        int cantBoca = 0; //cant goles de boca jugando de Local
        for (i=0; i < dimF; i++){
            System.out.println(partidos[i].getLocal() + " " + partidos[i].getGolesLocal() + " VS " + partidos[i].getGolesVisitante() + " " + partidos[i].getVisitante());
            if (partidos[i].hayGanador())
                if (partidos[i].getGanador() == "River")
                    cantRiver++;
            if (partidos[i].getLocal() == "Boca")
                cantBoca = cantBoca + partidos[i].getGolesLocal();
        }
        System.out.println("Ganadas por river:" + cantRiver + " goles de boca de local: " + cantBoca);
    }
}
