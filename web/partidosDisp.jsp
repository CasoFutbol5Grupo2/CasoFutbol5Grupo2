<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="partidosDisp" scope="session" value="${sessionScope.partidosDisp}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <title>JSP Page</title>
    </head>
    <center>       
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
                <a href="partidosDisp.jsp">Partidos Disponibles</a></div>    

            <div class="medium-2 columns"><br>
                <a href="reserva.jsp">Reservar cancha</a></div>

            <div class="medium-2 columns"><br>
                <a href="perfil.jsp">Mi Perfil</a></div>
            <div class="medium-2 columns"><br>
                <a href="login.jsp">Logout</a></div>
                        
        </div>
        <div class="row">
            <div class="small-12 columns">
                <center class="enzo">
                    <h1><font face="Showcard Gothic">Partidos Disponibles</font></h1>
                </center>
            </div>
        </div>
        <table>
        <c:forEach var="i" items="${partidosDisp}">
            <tr>
                <td><img src="${i.organizador.imagen}" width="200"/><br>${i.organizador.nombre}&nbsp;${i.organizador.apellido}</td>
                    <td>${i.fecha}<br> ${i.hora}</td>
                    <td><input type="radio" name="tipoInscripcion" value="garantizado"/>Garantizado<br>
                    <input type="radio" name="tipoInscripcion" value="probable"/>Probable</td>
                    <td><a>Ver</a>&nbsp;|&nbsp;<a>Inscribirse</a></td>
            </tr>
        </c:forEach>
        </table>
            <table>
            
                <tr>
                    <td><img src="img/doge.jpeg" width="200"/> <br>Usuario 1</td>
                    <td>${i.fecha} asdafd <br> ${i.hora} fadfe</td>
                    <td><input type="radio" name="tipoInscripcion" value="garantizado"/>Garantizado<br>
                    <input type="radio" name="tipoInscripcion" value="probable"/>Probable</td>
                    <td><a>Ver</a>&nbsp;|&nbsp;<a>Inscribirse</a></td>
                </tr>
                <tr>
                    <td>${i.organizador.imagen}  <img src="img/doge1.jpg" width="200"/> <br>Usuario 2</td>
                    <td>${i.fecha} asdafd <br> ${i.hora} fadfe</td>
                    <td><input type="radio" name="tipoInscripcion" value="garantizado"/>Garantizado<br>
                    <input type="radio" name="tipoInscripcion" value="probable"/>Probable</td>
                    <td><a>Ver</a>&nbsp;|&nbsp;<a>Inscribirse</a></td>
                </tr>
            
            </table>
        
        
    </center>
</html>
