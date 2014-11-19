<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="error" scope="session" value="${sessionScope.error}"/>
        <title>..::Pagina Inicial::..</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Bevan' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/main.css" />
        <c:set var="fName" value="${sessionScope.fName}" scope="session"/>
        <c:set var="facebook" value="${sessionScope.facebook}" scope="session"/>
    </head>
    <body>
    <br><br><br><br><br><br><br>
    <center>
        <div class="row">
            <form method="POST" action="signin">
            
            <div class="row">
                <div class="small-12 columns">
                    <center class="enzo"><h1><font face="Showcard Gothic">Canchas Futbol 5</font></h1></center>
                </div>
            </div>
            <br>            
                <div class="row">                                         
                    <div class="small-2 columns">&nbsp;</div>      
                    <div class="small-8 columns">
                            Futbol5 es una aplicación que permite organizar "pichangas", "picadas" de fútbol.
                            En un principio estaba destinado a ser utilizado solamente por los miembros de la comunidad, 
                            pero a partir de hoy está disponible para todo el mundo.
                            Solamente necesitas una cuenta de Facebook para poder loguearte.
                    </div>
                    <div class="small-2 columns">&nbsp;</div>                          
                </div>
                        
                <div class="row"> 
                        <center>
                            <c:if test="${facebook == null}">
                                <br>
                                <div class="small-12 columns"><button>Logueate con Facebook</button>
                            </c:if>
                            <c:if test="${facebook != null}">
                                <br>Ya ha iniciado Sesión
                            </c:if>
                    </div></center>
                </div>  
        </form>
            <center>
                <c:if test="${facebook != null}">
                    <br>
                    <form action="organizador.jsp"><div class="small-12 columns"><button>Entrar como: ${fName}</button></form>
                    <form action="logout"><div class="small-12 columns"><button>Iniciar Sesion con Otra Cuenta</button></form>
            
                </c:if>
                
            </center>
        </div>
     
    </center>
    <c:if test="${error!=null}">
        <script type="text/javascript">
            alert("${error}");
        </script>
        <c:remove var="error" scope="session"/>
    </c:if>
    </body>
</html>

