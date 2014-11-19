<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <c:set var="actual" scope="session" value="${sessionScope.actual}"/>
    
    <c:set var="partidosOrganizados" scope="session" value="${sessionScope.partidosOrganizados}"/>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.:Partidos que administro:.</title>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800,400' rel='stylesheet' type='text/css'>
        
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
                <a href="perfil.jsp">Mi Perfil</a></div>
            
            <div class="medium-2 columns"><br>
                <a href="logout">Logout</a></div>
                        
        </div>
        
        <br><br>
        <div class="row" style="background: rgba(50,50,50,0.5);
    border-radius: 8px;">
            <div class="small-12 columns">
                <center class="org"><h1>Partidos que administro</h1></center>
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
                            <th><center><c:out value="${i.fecha}"/><c:out value="${i.hora}"/></center></th>
                            <th><center><c:out value="${i.cancha}"/></center></th>
                            <th><center><c:out value="${i.estado}"/></center></th>
                            <th><center><c:out value="${i.goleseq1}"/></center></th>
                            <th><center><a href="s?idPartido=${i.id}">Ver</a></center></th>
                            <th><center><a href="s?idPartido=${i.id}">Iniciar</a></th>
                            <th><center><a href="s?idPartido=${i.id}">Cancelar</a></th>
                        </tr>
                    </c:forEach>
                </table>
                </div>
            </div>
            
        </div>
    </body>
</html>
