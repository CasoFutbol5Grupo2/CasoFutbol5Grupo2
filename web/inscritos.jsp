<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <c:set var="PartidosInscritos" scope="session" value="${sessionScope.listaBuscada}"/>
    <head>
        
        <title>..::Pagina de Inscritos::..</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        
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
            <div class="small-12 columns">
                <center class="org"><h1>Partidos que participo</h1></center>
            </div>
            <br>
            <br>
            <br>
            <br>
            <div class="row">
                <div class="table">
                    <table class="small-12 columns">
                    <tr align="center" valign="middle">                         
                        <th><center>Fecha</center></th>
                        <th><center># Cancha</center></th>
                        <th colspan="2"><center>Acciones</center></th>
                    </tr>
                    <c:forEach var="i" items="${partidosInscritos}">
                        <tr align="center" valign="middle">        
                            <th><center><c:out value="${i.fecha}"/></center></th>
                            <th><center><c:out value="${i.cancha}"/></center></th>
                            <th><center><a href="s?idPartido=${i.id}">Alineaciones</a></th>
                            <th><center><a href="s?idPartido=${i.id}">Salir</a></th>
                        </tr>
                    </c:forEach>
                </table>
                </div>
            </div>
            
        </div>
    
    </body>
</html>
