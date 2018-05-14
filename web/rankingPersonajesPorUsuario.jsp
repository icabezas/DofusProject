<%-- 
    Document   : rankingPersonajesPorUsuario
    Created on : 14-may-2018, 21:55:23
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
            Object errorMessage = session.getAttribute("status");
            if (errorMessage != null) {
        %><p><%=errorMessage%></p>
        <h1>LISTADO DE PERSONAJES DE <%=request.getAttribute("userSelected")%></h1>

        <%
            }
            daos.PersonajeDAO personajeDAO = new daos.PersonajeDAO();

            List<modelo.Tipo> tipos = (List<modelo.Tipo>) rasgosDAO.getListAllTipos();

            if (tipos.isEmpty()) {
        %>
        <p> NO HAY TIPOS </p>
        <%
        } else {
        %>
        <div class="row">
            <div class="col-lg-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th>NOMBRE</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            for (Tipo tipo : tipos) {
                                String nombre = tipo.getNombre();
                        %>
                        <tr>
                            <td><%=nombre%></td>
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
