<%-- 
    Document   : organizador
    Created on : 26/09/2014, 12:22:49 AM
    Author     : EQ
--%>

<!--ESTO QUEDA-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <c:set var="actual" scope="session" value="${sessionScope.actual}"/>
    
    <c:set var="partidosOrganizados" scope="session" value="${sessionScope.listaBuscada}"/>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organizador</title>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800,400' rel='stylesheet' type='text/css'>
        
    </head>
    <body>
        
        <a href="home.jsp">
            <img src="img/logoFutbol.jpg" />
        </a>
        <br><br>
        <div class="row" style="background: rgba(50,50,50,0.5);
    border-radius: 8px;">
            <div class="small-12 columns">
                <center class="org"><h1>Reservas del Organizador</h1></center>
            </div>
            <br>
            <br>
            <br>
            <div class="small-12 columns">
                <div class="org">
                <h3>Partidos que administro:</h3>
                </div>
            </div>
            <br>
            <br>
            <br>
            <div class="row">
                <div class="table">
                    <table class="small-12 columns">
                    <tr align="center" valign="middle">                         
                        <th><center>Fecha</center></th>
                        <th><center># Cancha</center></th>
                        <th><center>Inscritos</center></th>
                        <th><center>En Espera</center></th>
                        <th colspan="3"><center>Acciones</center></th>
                    </tr>
                    <c:forEach var="i" items="${partidosOrganizados}">
                        <tr align="center" valign="middle">        
                            <th><center><c:out value="${i.fecha}"/></center></th>
                            <th><center><c:out value="${i.cancha}"/></center></th>
                            <th><center><c:out value="${i.Inscritos}"/></center></th>
                            <th><center><c:out value="${i.EnEspera}"/></center></th>
                            <th><center><a href="s?idReserva=${i.id}">Ver</a></center></th>
                            <th><center><a href="s?idReserva=${i.id}">Iniciar</a></th>
                            <th><center><a href="s?idReserva=${i.id}">Cancelar</a></th>
                        </tr>
                    </c:forEach>
                </table>
                </div>
            </div>
            
        </div>
    </body>
</html>
