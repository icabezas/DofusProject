<%-- 
    Document   : userValidado
    Created on : 04-may-2018, 20:21:23
    Author     : THOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            modelo.User user = (modelo.User) session.getAttribute("usuario");
        %>
        <p>Bienvenid@ <%=user.getNombre()%></p>
        <%

            if (user.isIsadmin()) {%>
        <div class="container">
            <h1>ADMINISTRACION</h1>
            <div class="row">
                <div class="col-lg-6">
                    <h3>USUARIO</h3>
                    <form action="eliminarUsuario.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR USUARIO">ELIMINAR USUARIO</button>
                    </form>
                    <form action="mostrarUsuarios.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR USUARIOS">MOSTRAR USUARIOS</button>
                    </form>
                    <hr>
                    <h3>OBJETOS</h3>
                    <form action="eliminarObjeto.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR OBJETOS">ELIMINAR OBJETOS</button>
                    </form>
                    <form action="crearObjeto.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR OBJETO">CREAR OBJETOS</button>
                    </form>
                    <form action="mostrarObjetos.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR OBJETOS">MOSTRAR OBJETOS</button>
                    </form>
                    <hr>
                    <h3>CARACTERISTICAS</h3>
                    <form action="eliminarCaracteristica.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR CARACTERISTICA">ELIMINAR CARACTERISTICA</button>
                    </form>
                    <form action="crearCaracteristica.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR CARACTERISTICA">CREAR CARACTERISTICA</button>
                    </form>
                    <form action="anyadirCaracteristicaObjeto.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ANYADIR CARACTERISTICA A OBJETO">ANYADIR CARACTERISTICA A OBJETO</button>
                    </form>
                    <form action="mostrarCaracteristicas.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR CARACTERISTICAS">MOSTRAR CARACTERISTICASAD </button>
                    </form>

                </div>
                <div class="col-lg-6">
                    <h3>CATEGORIA</h3>
                    <form action="eliminarCategoria.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR CATEGORIA">ELIMINAR CATEGORIA</button>
                    </form>
                    <form action="crearCategoria.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR CATEGORIA">CREAR CATEGORIA</button>
                    </form>
                    <hr>
                    <h3>RAZA</h3>
                    <form action="eliminarRaza.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR RAZA">ELIMINAR RAZA</button>
                    </form>
                    <form action="crearRaza.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR RAZA">CREAR RAZA</button>
                    </form>
                    <form action="mostrarRazas.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR RAZAS">MOSTRAR RAZAS</button>
                    </form>
                    <hr>
                    <h3>TIPO</h3>
                    <form action="eliminarTipo.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR TIPO">ELIMINAR TIPO</button>
                    </form>
                    <form action="crearTipo.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR TIPO">CREAR TIPO</button>
                    </form>
                    <form action="mostrarTipos.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR TIPOS">MOSTRAR TIPOS</button>
                    </form>
                </div>
            </div>
        </div>

        <%} else {%>
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h3>PERSONAJES</h3>
                    <form action="eliminarPersonaje.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR PERSONAJE">ELIMINAR PERSONAJE</button>
                    </form>
                    <form action="crearPersonaje.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR PERSONAJE">CREAR PERSONAJE</button>
                    </form>
                    <hr>
                    <form action="modificarPersonaje.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MODIFICAR PERSONAJE">MODIFICAR PERSONAJE</button>
                    </form>

                </div>
            </div>
            <%}
            %>
        </div>
    </body>
</html>
