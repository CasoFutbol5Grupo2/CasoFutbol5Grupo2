<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>    
    <head>
        <c:set var="partido" scope="session" value="${sessionScope.detallePartido}"/>
        <c:set var="msjInscripcion" scope="session" value="${sessionScope.msjInscripcion}"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <title>.:Información del Partido:.</title>
        
    </head>
    
    <body> 
        <div class="row" style="background: rgba(50,50,50,0.5);
    border-radius: 8px;">
            <div class="medium-2 columns">
                <a href="home.jsp">
                    <img src="img/logoFutbol.jpg" />
                </a>
            </div>            
            <div class="medium-2 columns"><br>
                <a href="mispartidos.jsp">Mis Partidos</a></div>

            <div class="medium-2 columns"><br>
                <a>Partidos Disponibles</a></div>    

            <div class="medium-2 columns"><br>
                <a>Reservar cancha</a></div>

            <div class="medium-2 columns"><br>
                <a>Mi Perfil</a></div>
            <div class="medium-2 columns"><br>
                <a>Logout</a></div>
                        
        </div>
              
        <br><br>            
            <div class="row" style="background: rgba(50,50,50,0.5);
                 border-radius: 8px;">
                <div class="row">
                    <div class="small-12 columns">
                        <center class="enzo"><h1><font face="Showcard Gothic">Información del Partido ${reserva.id}</font></h1></center>
                
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
                    <br>
                    <div class="row">
                        <center class="blanco"><h3><font face="Showcard Gothic">Resultado</font></h3></center>
                    </div>
                    <br>
                    <form action="servletGuardarResultado" method="POST" id="form">
                    <div class="row">
                    <div class="small-2 columns"></div>
                    <div class="small-4 columns blanco">
                        <p align="right"><b><font size=+1>Equipo 1:</font></b></p>
                    </div>
                    <div class="small-4 columns blanco">
                        <input type="text" name="eq1"/>
                    </div>
                    <div class="small-2 columns"></div>
                </div> 
                    <br>
                    <div class="row">                        
                            <div class="small-2 columns"></div>
                            <div class="small-4 columns blanco">
                                <p align="right"><b><font size=+1>Equipo 2:</font></b></p>
                            </div>
                            <div class="small-4 columns blanco">
                                <input type="text" name="eq2"/>
                            </div>
                            <div class="small-2 columns"></div>
                    </div>
                    <div class="row">                        
                            <center><button type="submit">Iniciar</button></center>
                    </div>
                    </form>
                    
            <div class="row">
                    <div class="small-12 columns">
                        <center class="blanco"><h3><font face="Showcard Gothic">Alineación</font></h3></center>
                    </div>
                </div>
                <br>
            <div class="row">
                <div class="small-6 columns blanco">
                    <p align="center"><b><font size=+1>Equipo 1:</font></b></p>
                    <c:forEach var="i" items="${partido.equipo1}">
                        <p align="center">${i.nombre}&nbsp;${i.apellido}</p>
                    </c:forEach>
                </div>
                <div class="small-6 columns blanco">
                    <p align="center"><b><font size=+1>Equipo 2:</font></b></p>
                    <c:forEach var="i" items="${partido.equipo2}">
                        <p align="center">${i.nombre}&nbsp;${i.apellido}</p>
                    </c:forEach>
                </div> 
            </div>
                </div>
                     
    
    
    </body>
</html>
