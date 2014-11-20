
package edu.ulima.mongo;

import edu.ulima.bean.Partido;
import edu.ulima.bean.Jugador;
import edu.ulima.bean.Partido;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;



public class Logica {
    
    public List<Integer> getCanchasDisponible(String fecha, String hora){
    
        MongoDB m = new MongoDB();
        List<Partido> partidos = m.buscarPartidoporFechayHora(fecha, hora);
        List<Integer> canchasocupadas = new ArrayList<>();
        for ( Partido p : partidos){
        canchasocupadas.add(p.getCancha());
        }
        
        List<Integer> canchaslibres = new ArrayList<>();
        for (int i = 1; i<=10; i++ ){
        canchaslibres.add(i);
        }
        
        for (Integer e : canchasocupadas){
        canchaslibres.remove(e);
        
        }
        return canchaslibres;
    }
    
    public Partido randomEquipos(Partido partido){
    MongoDB m = new MongoDB();
    List<Jugador> todos = new ArrayList<>();
    
    for(Jugador jug : partido.getInvitados()){
    todos.add(jug);
    }
    for(Jugador jug : partido.getEquipo1()){
    todos.add(jug);
    }
    for(Jugador jug : partido.getEquipo2()){
    todos.add(jug);
    }
    
        Collections.shuffle(todos);
     int i = 0;
     List<Jugador> equipo1 = new ArrayList<>();
     List<Jugador> equipo2 = new ArrayList<>();
     List<Jugador> invitados = new ArrayList<>();
     
     for(Jugador jugador : todos){
     if ((i % 2) == 0){
     equipo1.add(jugador);
     
     } else{
     equipo2.add(jugador);
     }
     i++;
     }   
        
     partido.setInvitados(invitados);
     partido.setEquipo1(equipo1);
     partido.setEquipo2(equipo2);
     
     m.actualizarPartido(partido);
    return partido;
    }
    
    public Jugador hallarCoef(Jugador jugador){
    MongoDB m = new MongoDB();
    int ganados = jugador.getPartGanados();
    int perdidos = jugador.getPartPerdidos();
    float coef = ganados /((ganados+perdidos)*1.0f);
    jugador.setCoeficiente(coef);
    m.actualizarJugador(jugador);
    return jugador;
    }
    
    public Partido randomEquiposParcial(Partido partido){
    MongoDB m = new MongoDB();
    List<Jugador> quedan = partido.getInvitados();
    
     Collections.shuffle(quedan);
     
     List<Jugador> equipo1 = partido.getEquipo1();
     List<Jugador> equipo2 = partido.getEquipo2();
     List<Jugador> invitados = new ArrayList<>();
     
     for(Jugador jugador : quedan){
     if (equipo1.size()<=5){
     equipo1.add(jugador);
     
     } else{
     equipo2.add(jugador);
     }
     }   
        
     partido.setInvitados(invitados);
     partido.setEquipo1(equipo1);
     partido.setEquipo2(equipo2);
    
    m.actualizarPartido(partido);
    return partido;
    }
    
    public List<String> getCanchasDispDia(String fecha){
    List<String> horasdisp = new ArrayList<>(); 
    List<Integer> horas = new ArrayList<>();
    for (int i = 8; i <=20; i++){
    horas = getCanchasDisponible(fecha, String.valueOf(i));
    if (horas.isEmpty()){
        horasdisp.add(String.valueOf(i));
    }
   }
    return horasdisp;
    }
    
    public Partido asignarCancha(Partido partido){
    List<Integer> horas = this.getCanchasDisponible(partido.getFecha(), partido.getHora());
    partido.setCancha(horas.get(0));
    MongoDB m = new MongoDB();
    m.actualizarPartido(partido);
    return partido;
    }
}
