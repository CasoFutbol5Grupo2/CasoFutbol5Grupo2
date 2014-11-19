
package edu.ulima.mongo;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import edu.ulima.bean.Jugador;
import edu.ulima.bean.Partido;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class MongoDB {
    MongoClient mc = null;
    DB db = null;
    DBCollection coll1 = null;

    public MongoDB() {
        try {
            init();
        } catch (UnknownHostException ex) {
            Logger.getLogger(MongoDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
     //Inicializar
     public void init() throws UnknownHostException {
        mc = new MongoClient("localhost",27017);
        db = mc.getDB("casofutbol");
       
    }
    //Ingresar un Usuario
    public Jugador crearJugador(Jugador jugador){
        BasicDBObject doc1 = new BasicDBObject();
        this.colJugador();
        int id = (int)this.nuevoIdJug();
        doc1.put("idJug",id);
        doc1.put("correo", jugador.getCorreo());
        doc1.put("nombre",jugador.getNombre());
        doc1.put("fbid",jugador.getFbid());
        doc1.put("imagen",jugador.getImagen());
        doc1.put("partidosg",0);
        doc1.put("partidosp",0);
        doc1.put("coef",0);
        
        jugador.setCoeficiente(0);
        jugador.setPartPerdidos(0);
        jugador.setPartGanados(0);
        jugador.setPartGanados(0);
        jugador.setId(id);
        coll1.insert(doc1);
        
        return jugador;
   }
    //Nuevo id para nuevo Jugador
    private double nuevoIdJug(){
        BasicDBObject query = new BasicDBObject();
        query.put("tipo", "id");
        double sig =0;
        DBCursor cursor = coll1.find(query);
        while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
                sig = (double)o.get("sig");
        }
        updateJugador();
        return sig;
    }
    //Incrementar id en la BD
    private void updateJugador(){
            
            BasicDBObject query = new BasicDBObject();
            BasicDBObject where = new BasicDBObject();
            where.put("tipo", "id");
            BasicDBObject cond = new BasicDBObject();
            cond.put( "sig",1 );
            query.put("$inc",cond);
            coll1.update(where, query);
    
    }
    //Col Jugador
    private void colJugador(){
    coll1 = db.getCollection("jugador");
    }
    
    //Col Partido
    private void colPartido(){
    coll1 = db.getCollection("partido");
    }
        
    
    //Parse Jugador
    private Jugador parseJugador (DBObject o){
    Jugador jugador = new Jugador();
                String id = o.get("idJug").toString();
                //System.out.println(id);
                //id = id.substring(0, id.indexOf("."));
                //System.out.println(id);
                jugador.setId(Integer.parseInt(id));
                jugador.setCorreo(o.get("correo").toString());
                jugador.setNombre(o.get("nombre").toString());
                jugador.setFbid(o.get("fbid").toString());
                jugador.setImagen(o.get("imagen").toString());
                String partidosg = o.get("partidosg").toString();
                //System.out.println(partidosg);
               /* if (!partidosg.equalsIgnoreCase("0")){
                partidosg = partidosg.substring(0, partidosg.indexOf("."));
                }*/
                jugador.setPartGanados(Integer.parseInt(partidosg));
               String partidosp = o.get("partidosp").toString();
               /* if (!partidosp.equalsIgnoreCase("0")){
                partidosp = partidosp.substring(0, partidosp.indexOf("."));
                }*/
                jugador.setPartPerdidos(Integer.parseInt(partidosp));
                
                jugador.setCoeficiente(Float.parseFloat(o.get("coef").toString()));
    return jugador;
    }
    
 //   Buscar Jugador por correo, regresaria un null si no lo encuentra
    
    public Jugador buscarJugadorCorreo(String correo){
        this.colJugador();
        BasicDBObject query = new BasicDBObject();
        query.append("correo", correo);
        Jugador jugador = null;
        //System.out.println(query);
        DBCursor cursor = coll1.find(query);
        while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
                jugador = this.parseJugador(o);
                return jugador;
        }   
    
        return null;
    
    
    }
    //Buscar Jugador por Id
    public Jugador buscarJugadorId(int idJug){
        this.colJugador();
        BasicDBObject query = new BasicDBObject();
        query.append("idJug", idJug);
        Jugador jugador = null;
        //System.out.println(query);
        DBCursor cursor = coll1.find(query);
        while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
                jugador =this.parseJugador(o);
                
        }   
    
        return jugador;
    
    
    }
    //Crear Partido
    
    public Partido crearPartido(Partido partido){
        this.colPartido();
        int id = (int)this.nuevoIdPartido(); 
        partido.setId(id);
        List<Integer> inv = new ArrayList<>();
        for (Jugador j : partido.getInvitados()){
          inv.add(j.getId());
        }
        
        
        BasicDBObject doc1 = new BasicDBObject();
         doc1.put("idPar",id);
        doc1.put("cancha", partido.getCancha());
        doc1.put("administrador", partido.getAdministrador().getId());
        doc1.put("fecha",partido.getFecha());
        doc1.put("hora",partido.getHora());
        doc1.put("estado",partido.getEstado());
        doc1.put("invitados", inv );
        doc1.put("equipo1",new ArrayList<BasicDBObject>());
        doc1.put("goleseq1",0);
        doc1.put("equipo2",new ArrayList<BasicDBObject>());
        doc1.put("goleseq2",0);
        
        
        coll1.insert(doc1);
        return partido;
    }
    //Nuevo id para nuevo Partido
    private double nuevoIdPartido(){
    BasicDBObject query = new BasicDBObject();
        query.put("tipo", "id");
        double sig =0;
        DBCursor cursor = coll1.find(query);
        while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
                sig = (double)o.get("sig");
        }
        updatePartido();
        return sig;
    
    
    
    }
    //Incrementar id en la BD
     private void updatePartido(){
            
            BasicDBObject query = new BasicDBObject();
            BasicDBObject where = new BasicDBObject();
            where.put("tipo", "id");
            BasicDBObject cond = new BasicDBObject();
            cond.put( "sig",1 );
            query.put("$inc",cond);
            coll1.update(where, query);
    
    }
    //Parse Partido
     private Partido parsePartido (DBObject o){
     Partido partido = new Partido();
                String id = o.get("idPar").toString();
                partido.setId(Integer.parseInt(id));
                String goles1 = o.get("goleseq1").toString();
                partido.setGoleseq1(Integer.parseInt(goles1));
                String goles2 = o.get("goleseq2").toString();
                partido.setGoleseq2(Integer.parseInt(goles2));
                String cancha = o.get("cancha").toString();
                partido.setCancha(Integer.parseInt(cancha));
                String idAdmin = o.get("administrador").toString();
                int idAdministrador = Integer.parseInt(idAdmin);
                partido.setAdministrador(this.buscarJugadorId(idAdministrador));
                partido.setFecha(o.get("fecha").toString());
                partido.setHora(o.get("hora").toString());
                partido.setEstado(o.get("estado").toString());
                List<Jugador> lista = partido.getInvitados();
                BasicDBList bdl = (BasicDBList) o.get("invitados");
                for ( int i=0; i < bdl.size(); i++) {
                    String s = bdl.get(i).toString();
                    //System.out.println(s);
                    lista.add(this.buscarJugadorId(Integer.parseInt(s)));
                }
                partido.setInvitados(lista);
                lista = partido.getEquipo1();
                bdl = (BasicDBList) o.get("equipo1");
                for ( int i=0; i < bdl.size(); i++) {
                    String s = (String)bdl.get(i);
                   lista.add(this.buscarJugadorId(Integer.parseInt(s)));
                }
                partido.setEquipo1(lista);
                lista = partido.getEquipo2();
                bdl = (BasicDBList) o.get("equipo2");
                for ( int i=0; i < bdl.size(); i++) {
                    String s = (String)bdl.get(i);
                   lista.add(this.buscarJugadorId(Integer.parseInt(s)));
                }
                partido.setEquipo2(lista);
        return partido;
     }
     
     //Buscar Partido por ID, regresa NULL si no lo encuentra
    public Partido buscarPartidoID(int idPar){
        this.colPartido();
        BasicDBObject query = new BasicDBObject();
        query.append("idPar", idPar);
        Partido partido = null;
        //Jugador jugador = null;
        //System.out.println(query);
        DBCursor cursor = coll1.find(query);
        while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
                partido = this.parsePartido(o);
               return partido;
                
               
                
        }   
    
        return null;
    
    
    }
     
    //Ver Partidos por Administrador
   public List<Partido> partidosAdmin(Jugador jugador){
       this.colPartido();
    List<Partido> lista = new ArrayList<>();
            BasicDBObject query = new BasicDBObject();
                        
            List<BasicDBObject> cond = new ArrayList<BasicDBObject>();
            int admin = jugador.getId();
            cond.add( new BasicDBObject("administrador",admin) );
            
            query.put("$and",cond);
       
            DBCursor cursor = coll1.find(query);
            while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
               Partido partido = this.parsePartido(o);
                lista.add(partido);
            }
         return lista;
   }
   
      
    //Ver Todos los Partidos
   public List<Partido> partidosTodos(){
       this.colPartido();
    List<Partido> lista = new ArrayList<>();
            
            BasicDBObject query = new BasicDBObject();
            BasicDBObject existe = new BasicDBObject()
                    .append("$exists",  1);
                    
            query.put("idPar",existe);
            //System.out.println( query.toString() );    
                        
                   
            DBCursor cursor = coll1.find(query);
            while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
                Partido partido = this.parsePartido(o);
                lista.add(partido);
                
            }
         return lista;
   }
    
   //Ver los Partidos donde participa el jugador
   //(excluyendo los q administra - ver "if" en el loop para modificar esto)
   public List<Partido> partidosParticipantes(Jugador jugador){
            this.colPartido();
            List<Partido> lista = new ArrayList<>();
            BasicDBObject query = new BasicDBObject();
                        
            List<BasicDBObject> cond = new ArrayList<BasicDBObject>();
            int participante = jugador.getId();
            cond.add( new BasicDBObject("equipo2",participante) );
            cond.add( new BasicDBObject("invitados",participante) );
            cond.add( new BasicDBObject("equipo1",participante) );
            
            query.put("$or",cond);
       
            DBCursor cursor = coll1.find(query);
            while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
                
               Partido partido = this.parsePartido(o);
               //quitar el if si son TODOS los partidos, incluidos los administrados 
               if (partido.getAdministrador().getId()!=jugador.getId()){ 
               lista.add(partido);
               }
            }
         return lista;
   
   
   
   }
   
   
   //Actualizar Jugador
   
   public void actualizarJugador(Jugador jugador){
        this.colJugador();
   
        BasicDBObject doc1 = new BasicDBObject();
        BasicDBObject doc = new BasicDBObject();
        doc.put("idJug", jugador.getId());
      
        doc1.put("idJug",jugador.getId());
        doc1.put("correo", jugador.getCorreo());
        doc1.put("nombre",jugador.getNombre());
        doc1.put("fbid",jugador.getFbid());
        doc1.put("imagen",jugador.getImagen());
        doc1.put("partidosg",jugador.getPartGanados());
        doc1.put("partidosp",jugador.getPartPerdidos());
        doc1.put("coef",jugador.getCoeficiente());
        coll1.update(doc, doc1);
   
   
   }
   
   //Actualizar Partido
    public void actualizarPartido(Partido partido){
        this.colPartido();
      
        List<Integer> inv = new ArrayList<>();
        for (Jugador j : partido.getInvitados()){
          inv.add(j.getId());
        }
        List<Integer> eq1 = new ArrayList<>();
        for (Jugador j : partido.getEquipo1()){
          eq1.add(j.getId());
        }
        List<Integer> eq2 = new ArrayList<>();
        for (Jugador j : partido.getEquipo2()){
          eq2.add(j.getId());
        }
        
        BasicDBObject doc = new BasicDBObject();
        doc.put("idPar",partido.getId());
        BasicDBObject doc1 = new BasicDBObject();
        doc1.put("idPar",partido.getId());
        
        
        doc1.put("cancha", partido.getCancha());
        doc1.put("administrador", partido.getAdministrador().getId());
        doc1.put("fecha",partido.getFecha());
        doc1.put("hora",partido.getHora());
        doc1.put("estado",partido.getEstado());
        doc1.put("invitados", inv );
        doc1.put("equipo1",eq1);
        doc1.put("goleseq1",partido.getGoleseq1());
        doc1.put("equipo2",eq2);
        doc1.put("goleseq2",partido.getGoleseq2());
        coll1.update(doc, doc1);
   
   }
    //Buscar un Partido por Fecha y Hora
    public List<Partido> buscarPartidoporFechayHora(String fecha, String hora){
            this.colPartido();
            List<Partido> lista = new ArrayList<>();
            BasicDBObject query = new BasicDBObject();
                        
            List<BasicDBObject> cond = new ArrayList<BasicDBObject>();
            
            cond.add( new BasicDBObject("fecha",fecha) );
            cond.add( new BasicDBObject("hora", hora) );
            
            query.put("$and",cond);
       
            DBCursor cursor = coll1.find(query);
            while ( cursor.hasNext() ) {
                DBObject o = cursor.next();
               Partido partido = this.parsePartido(o);
                lista.add(partido);
            }
            return lista;
    
    
    
    
    
    
    
    }
}
