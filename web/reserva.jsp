<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*,java.text.*" %>

<html>
    <c:set var="reservamsj" scope="session" value="${sessionScope.reservamsj}"/>
    <c:set var="partidoDisp" scope="session" value="${sessionScope.partidoDisp}"/>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript">
            
            function mostrar(){
                if (document.form.cancelado[0].checked == true) {
                    document.getElementById('sicancelo').style.display='block';
                } else {
                    document.getElementById('sicancelo').style.display='none';
                }
            }
            
            function cambiarLocales(){ 
                
                var fecha = document.form.fecha.value;
                $.get("buscarCanchaDisponibleServlet",{fecha:fecha}).
                        done(function(data){
                            $("#hora").removeAttr("disabled");
                            console.log("data",typeof data, data);
                            for(i=0;i<data.length;i++){
                                document.form.hora.options[i].value=data[i]['idLocal'];
                                document.form.hora.options[i].text=data[i]['distritoLocal']; 
                            }
                    })
                }
            
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <title>..:Pagina de Reserva:..</title>
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
        <center>
            
                <div class="row">
                    <form action="s04" method="POST" id="form" name="form">
                        <div class="row">
                            <div class="small-12 columns">
                                <center class="enzo">
                                    <h1><font face="Showcard Gothic">Reservar cancha</font></h1>
                                </center>
                            </div>
                        </div>
                        <br>   
                        <div class="row">
                            <div class="small-3 columns"></div>
                            <div class="small-5 columns">
                                <p align="right"><b><font size=+2>Fecha:</font></b></p>
                            </div>
                            <div class="small-3 large-4 columns">
                                <p class="left"><input type="date" name="fecha" id="fecha"/></p>
                            </div>
                            <div class="small-2 columns"></div>
                        </div>
                        <br>
                        <div class="row">                
                            <div class="small-3 columns"></div>
                            <div class="small-5 columns">
                                <p align="right"><b><font size=+2>Hora:</font></b></p>
                            </div>                            
                            <div class="small-3 large-2 columns">
                                <c:if test="${partidoDisp!=null}">
                                <select name="hora" id="hora">
                                    <c:forEach var="i" items="partidoDisp">
                                        
                                    <option value="partido${i.idPartido}">${i.hora}</option>
                                     
                                </c:forEach></select>
                                </c:if>
                            </div>
                            <div class="small-2 columns"></div>
                        </div>
                        <div class="row">
                            <div class="small-3 columns"></div>
                        
                            <div class="small-6 small-centered columns">
                                
                                <textarea name="amigos"></textarea>
                                    
                                </div>
                        <div class="small-3 columns"></div>
                        </div>
                        
                        <div class="row">   
                            <center><div class="small-12 columns"><button type="submit">Reservar</button>
                                </div></center>
                        </div> 
                
              </form>                    
        </div> 
    </center>
    <c:if test="${reservamsj!=null}">
        <script type="text/javascript">
            alert("${reservamsj}");
        </script>
        <c:remove var="reservamsj" scope="session"/>
    </c:if>
    </body>
</html>
