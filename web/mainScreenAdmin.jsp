<%-- 
    Document   : userValidado
    Created on : 04-may-2018, 20:21:23
    Author     : THOR
--%>

<%@page import="modelo.Personaje"%>
<%@page import="daos.PersonajeDAO"%>
<%@page import="modelo.User"%>
<%@page import="java.util.List"%>
<%@page import="daos.UsuarioDAO"%>
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
        <button class="btn btn-primary" onclick="location.href = './index.jsp';" >DESCONECTAR</button>

        <%
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            modelo.User user = (modelo.User) session.getAttribute("usuario");
            List<modelo.User> usuarios = (List<modelo.User>) usuarioDAO.getListUsersNoAdmin();
        %>
        <p>Bienvenid@ <%=user.getNombre()%></p>



        <div class="container">
            <h1>ADMINISTRACION</h1>
            <div class="row">
                <div class="col-lg-6">
                    <h3>USUARIO</h3>
                    <form action="modificarContrasenya.jsp" moethod="POST">
                        <button class="btn btn-primary" type="submit" value="MODIFICAR CONTRASENYA">MODIFICAR CONTRASEÑA</button>
                    </form>

                    <form action="eliminarUsuario.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR USUARIO">ELIMINAR USUARIO</button>
                    </form>
                    <form action="mostrarUsuarios.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR USUARIOS">MOSTRAR USUARIOS</button>
                    </form>
                    <a href="rankingPersonajesPorUsuario.jsp"></a>
                    <a href="mainScreen.jsp"></a>
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
                    <form action="Personaje" method="POST">
                        <div class="form-group">

                            <label for="usuario">Usuarios</label>

                            <%
                                if (usuarios.isEmpty()) {
                            %>
                            <p> NO HAY USUARIOS </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="usuario" name="usuario">
                                <%
                                    for (User us : usuarios) {
                                        String nombre = us.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                            <button class="btn btn-primary" type="submit" name="SELECCIONAR USUARIO" value="SELECCIONAR USUARIO">SELECCIONAR USUARIO</button>
                        </div>
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
                    <hr>
                    <h3>PERSONAJES</h3>

                    <form action="eliminarPersonajes.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR PERSONAJES">ELIMINAR PERSONAJES</button>
                    </form>
                    <form action="eliminarPersonajes.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR PERSONAJES">ELIMINAR PERSONAJES</button>
                    </form>
                    <form action="mostrarPersonajes.jsp" method="POST">
                        <div class="form-group">
                            <div class="col-lg-3">

                                <label for="usuarioPersonajes">Usuarios</label>

                                <%
                                    if (usuarios.isEmpty()) {
                                %>
                                <p> NO HAY USUARIOS </p>
                                <%
                                } else {
                                %>

                                <select class="form-control" id="usuarioPersonajes" name="usuarioPersonajes">
                                    <%
                                        for (User us : usuarios) {
                                            String nombre = us.getNombre();
                                    %>
                                    <option value="<%= nombre%>"><%= nombre%></option> 
                                    <% }
                                        }
                                    %>
                                </select>
                                <button class="btn btn-primary" type="submit" value="VER PERSONAJES">VER PERSONAJES</button>
                            </div>
                        </div>
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
                    <hr>
                    <h3>RANKING</h3>
                    <form action="mostrarRankingUsuariosNivel.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR RANKING USUARIOS">RANKING USUARIOS</button>
                    </form>
                    <form action="mostrarRankingPersonajesNivel.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR RANKING PERSONAJES">RANKING TODOS PERSONAJES</button>
                    </form>
                    <hr>

                </div>
            </div>
        </div>
    </body>
</html>
