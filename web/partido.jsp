<%@page import="java.util.List"%>
<%@page import="edu.ulima.bean.Jugador"%>
<%@page import="edu.ulima.bean.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>    
    <head>
        <c:set var="partido" scope="session" value="${sessionScope.partido}"/>
        <c:set var="msjInscripcion" scope="session" value="${sessionScope.msjInscripcion}"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <title>.:Partido:.</title>
        
        <jsp:useBean id="Partido" class="edu.ulima.bean.Partido"/>  
        <jsp:useBean id="Jugador" class="edu.ulima.bean.Jugador"/>
        
        <%
            Partido p = (Partido)session.getAttribute("partido"); 
            List<Jugador> invitados = p.getInvitados();
            List<Jugador> equipo1 = p.getEquipo1();
            List<Jugador> equipo2 = p.getEquipo2();
            System.out.println("p"+p);
        %>
        
        <script type="text/javascript">
            
            function guardar(){      
                var listaInv = '<%=invitados%>';
                for(int i=0; i<listaInv.size(); i++){
                    var id = listaInv.get(i).getId();
                    var eq = document.form.id[document.form.id.selectedIndex].value; 
                    $.get("guardarPartidoServlet",{equipo:eq, jugador:id});
                }
                var listaEq1 = '<%=equipo1%>';
                for(int i=0; i<listaEq1.size(); i++){
                    var id = listaEq1.get(i).getId();
                    var eq = document.form.id[document.form.id.selectedIndex].value; 
                    $.get("guardarPartidoServlet",{equipo:eq, jugador:id});
                }
                var listaEq2 = '<%=equipo2%>';
                for(int i=0; i<listaEq2.size(); i++){
                    var id = listaEq2.get(i).getId();
                    var eq = document.form.id[document.form.id.selectedIndex].value; 
                    $.get("guardarPartidoServlet",{equipo:eq, jugador:id});
                }
            }
            
        </script>
    </head>
    
    <body> 
              
        <br><br>            
            
                <div class="row">
                    <div class="small-12 columns">
                        <center class="enzo"><h1><font face="Showcard Gothic">Información del Partido  ${reserva.id}</font></h1></center>
                
                    </div>
                    
                        
                    
                </div>
                
                
                <br> 
                <div class="row">
                    <div class="small-2 columns blanco"></div>
                    <div class="small-4 columns blanco">
                        <p align="right"><b><font size=+1>Fecha:</font></b></p>
                    </div>
                    <div class="small-4 columns blanco">
                        <p class="left">${partido.fecha}&nbsp;${partido.hora}</p>
                    </div>
                    <div class="small-2 columns"></div>
                </div>
                <br>
                <div class="row">
                    <div class="small-2 columns"></div>
                    <div class="small-4 columns blanco">
                        <p align="right"><b><font size=+1>Cancha:</font></b></p>
                    </div>
                    <div class="small-4 columns blanco">
                        <p class="left">${partido.cancha}</p>
                    </div>
                    <div class="small-2 columns"></div>
                </div>                   
                         
            <div class="row">
                    <div class="small-12 columns">
                        <center class="blanco"><h3><font face="Showcard Gothic">Alineación</font></h3></center>
                    </div>
                </div>
                <br>
            <div class="row">
                <center>
                    <form action="iniciarPartidoServlet" method="POST" id="form">
                        <table>
                            <tr>
                                <td>Nombre</td>
                                <td>Coeficiente de Partidos Ganados</td>
                                <td>Equipo</td> 
                            </tr>
                            <c:forEach var="i" items="${partido.invitados}">
                                <tr>
                                    <td>${i.nombre}&nbsp;${i.apellido}</td>
                                    <td></td> 
                                    <td>
                                        <select name="${i.id}" id="${i.id}">
                                            <option value="1">Equipo 1</option>
                                            <option value="2">Equipo 2</option>
                                        </select> 
                                    </td>
                                </tr>            
                            </c:forEach>
                                <c:forEach var="i" items="${partido.equipo1}">
                                <tr>
                                    <td>${i.nombre}&nbsp;${i.apellido}</td>
                                    <td></td> 
                                    <td>
                                        <select name="${i.id}" id="${i.id}">
                                            <option value="1">Equipo 1</option>
                                            <option value="2">Equipo 2</option>
                                        </select> 
                                    </td>
                                </tr>            
                            </c:forEach>
                                <c:forEach var="i" items="${partido.equpo2}">
                                <tr>
                                    <td>${i.nombre}&nbsp;${i.apellido}</td>
                                    <td></td> 
                                    <td>
                                        <select name="${i.id}" id="${i.id}">
                                            <option value="1">Equipo 1</option>
                                            <option value="2">Equipo 2</option>
                                        </select> 
                                    </td>
                                </tr>            
                            </c:forEach>
                        </table>
                        <br><br>
                        <div class="row"> 
                            <center>
                                <div class="small-12 columns"><button onclick="guardar()">Guardar</button>&nbsp;&nbsp;
                                    <button type="submit">Iniciar</button>
                                </div></center>
                        </div>
                        </form>
                </center>      
            </div>
                          
    <br>
    
    
    
    </body>
</html>
