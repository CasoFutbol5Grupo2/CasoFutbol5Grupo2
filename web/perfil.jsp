<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Ganados',     11],
          ['Perdidos',      2]
        ]);

        var options = {
          legend:{position:'bottom', textStyle: {color: 'white'}},
          backgroundColor: 'transparent',
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <c:set var="actual" scope="session" value="${sessionScope.actual}"/>
        <title>..::Perfil de Usuario::..</title>
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
                <a href="logout">Logout</a></div>
                        
        </div>
        <div class="row">
            <div class="small-12 columns">
                <center class="enzo">
                    <h1><font face="Showcard Gothic">Mi Perfil</font></h1>
                </center>
            </div>
        </div>
        <br>
        <br>
        <img src="${actual.imagen}" width="200"/>
        <br>
        <br>
        ${actual.nombre}
        <br>
        <br>
        
        <div id="piechart" style="width: 400px; height: 400px;"></div>
    </center>
</html>
