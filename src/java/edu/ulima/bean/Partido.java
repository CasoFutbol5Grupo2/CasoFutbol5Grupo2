package edu.ulima.bean;

import java.io.Serializable;
import java.util.List;

public class Partido implements Serializable{
    
    private int id;
    private Jugador administrador;
    private int cancha;
    private String fecha;
    private List<Jugador> invitados;
    private List<Jugador> equipo1;
    private int goleseq1;
    private List<Jugador> equipo2;
    private int goleseq2;
    private String estado;
    private String hora;
    
    public Partido() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Jugador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Jugador administrador) {
        this.administrador = administrador;
    }

    public int getCancha() {
        return cancha;
    }

    public void setCancha(int cancha) {
        this.cancha = cancha;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public List<Jugador> getInvitados() {
        return invitados;
    }

    public void setInvitados(List<Jugador> invitados) {
        this.invitados = invitados;
    }

    public List<Jugador> getEquipo1() {
        return equipo1;
    }

    public void setEquipo1(List<Jugador> equipo1) {
        this.equipo1 = equipo1;
    }

    public List<Jugador> getEquipo2() {
        return equipo2;
    }

    public void setEquipo2(List<Jugador> equipo2) {
        this.equipo2 = equipo2;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getGoleseq1() {
        return goleseq1;
    }

    public void setGoleseq1(int goleseq1) {
        this.goleseq1 = goleseq1;
    }

    public int getGoleseq2() {
        return goleseq2;
    }

    public void setGoleseq2(int goleseq2) {
        this.goleseq2 = goleseq2;
    }
    
    
}
