<%@page import="modelo.Personaje"%>
<%@page import="modelo.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RANKING PERSONAJES</title>
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
            <h1>RANKING PERSONAJES</h1>
            <%
                }
                daos.PersonajeDAO personajeDAO = new daos.PersonajeDAO();

                List<modelo.Personaje> personajes = (List<modelo.Personaje>) personajeDAO.rankingPersonajesNivel();

                if (personajes.isEmpty()) {
            %>
            <p> NO HAY PERSONAJES </p>
            <%
            } else {
            %>
            <div class="row">

                <div class="col-lg-6">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>NIVEL</th>
                                <th>RAZA</th>
                                <th>TIPO</th>
                                    <%
                                        if (user.isIsadmin()) {
                                    %>
                                <th>USUARIO</th>
                                    <%
                                        }
                                    %>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (Personaje personaje : personajes) {
                                    int id = personaje.getIdpersonaje();
                                    String nombre = personaje.getNombre();
                                    int nivel = personaje.getNivel();
                                    String raza = personaje.getRaza().getNombre();
                                    String tipo = personaje.getTipo().getNombre();
                                    String usuario = personaje.getUser().getNombre();
                            %>
                            <tr>
                                <td><%=id%></td>
                                <td><%=nombre%></td>
                                <td><%=nivel%></td>
                                <td><%=raza%></td>
                                <td><%=tipo%></td>
                                <%
                                    if (user.isIsadmin()) {
                                %>
                                <td><%=usuario%></td>
                                <%
                                    }
                                %>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <% }
        %>
    </body>
</html>