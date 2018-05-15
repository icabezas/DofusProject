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
                    <h3>PERSONAJES</h3>
                    <form action="crearPersonaje.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR PERSONAJE">CREAR PERSONAJE</button>
                    </form>
                    <form action="Personaje" method="POST">
                        <div class="form-group">

                            <label for="nombrePersonaje">Personajes</label>

                            <%
                                PersonajeDAO personajeDAO = new PersonajeDAO();
                                List<modelo.Personaje> personajes = (List<modelo.Personaje>) personajeDAO.getListAllPersonajesPorUsuario(user);
                                if (personajes.isEmpty()) {
                            %>irene 
                            <p> NO HAY PERSONAJES </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="nombrePersonaje" name="nombrePersonaje">
                                <%
                                    for (Personaje pers : personajes) {
                                        String nombre = pers.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                            <button class="btn btn-primary" type="submit" name="ELIMINAR PERSONAJE" value="ELIMINAR PERSONAJE">ELIMINAR PERSONAJE</button>
                        </div>
                    </form>
                    <hr>
                    <form action="Personaje" method="POST">
                        <div class="form-group">

                            <label for="nombrePersonaje">Personajes</label>

                            <%
                                if (personajes.isEmpty()) {
                            %>
                            <p> NO HAY PERSONAJES </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="nombrePersonaje" name="nombrePersonaje">
                                <%
                                    for (Personaje pers : personajes) {
                                        String nombre = pers.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                            <button class="btn btn-primary" type="submit" name="MODIFICAR PERSONAJE" value="MODIFICAR PERSONAJE">MODIFICAR PERSONAJE</button>
                        </div>
                    </form>

                    <form action="mostrarPersonajes.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR PERSONAJES">MOSTRAR PERSONAJES</button>
                    </form>

                </div>
                <div class="col-lg-6">
                    <h3>RANKING</h3>
                    <form action="mostrarRankingPersonajesNivel.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="RANKING PERSONAJES">RANKING PERSONAJES</button>
                    </form>
                    <h3>OBJETOS</h3>
                    <form action="adquirirObjeto.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ADQUIRIR OBJETO">ADQUIRIR OBJETO</button>
                    </form>
                    <form action="mostrarObjetosPersonaje.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="MOSTRAR OBJETOS">MOSTRAR OBJETOS</button>
                    </form>

                </div>

            </div>
        </div>
    </body>
</html>
