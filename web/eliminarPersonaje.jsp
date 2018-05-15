<%@page import="modelo.Personaje"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Caracteristica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR PERSONAJE</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <div class="container">
            <%
                modelo.User user = (modelo.User) session.getAttribute("usuario");
                Object errorMessage = session.getAttribute("status");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p>
            <h1>Elminar caracteristicas</h1>
            <%
                }
            %>
            <p>Listado de personajes</p>
            <%
                List<modelo.Personaje> personajes = new ArrayList<>();
                daos.PersonajeDAO personajeDAO = new daos.PersonajeDAO();
                if (user.isIsadmin()) {
                    personajes = (List<modelo.Personaje>) personajeDAO.getListAllPersonajesPorUsuario(null);
                } else {
                    personajes = (List<modelo.Personaje>) personajeDAO.getListAllPersonajesPorUsuario(user);
                }

                if (personajes.isEmpty()) {
            %>
            <p> NO HAY PERSONAJES </p>
            <%
            } else {
            %>
            <div class="row">
                <div class="col-lg-3">
                    <form action="Personaje" method="POST">

                        <select class="form-control" name="personajeBorrar">
                            <%
                                for (Personaje person : personajes) {
                                    String nombre = person.getNombre();
                            %>
                            <option value="<%= nombre%>"><%= nombre%></option> 
                            <% }
                            %>
                        </select>
                        <button class="btn btn-primary" type="submit" value="ELIMINAR PERSONAJE" name="ELIMINAR PERSONAJE">ELIMINAR PERSONAJE</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
