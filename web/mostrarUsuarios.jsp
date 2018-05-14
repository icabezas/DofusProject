<%-- 
    Document   : makeAdmin
    Created on : 13-may-2018, 17:55:51
    Author     : THOR
--%>

<%@page import="modelo.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <div class="container">
            <h1>LISTADO USUARIOS</h1>
            <%
                Object errorMessage = session.getAttribute("errorMessage");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p><%
                }
                daos.UsuarioDAO usuarioDAO = new daos.UsuarioDAO();

                List<modelo.User> usuarios = (List<modelo.User>) usuarioDAO.getListUsers();

                if (usuarios.isEmpty()) {
            %>
            <p> NO HAY USUARIOS </p>
            <%
            } else {
            %>
            <div class="row">

                <div class="col-lg-6">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>NOMBRE</th>
                                <th>NIVEL</th>
                                <th>ADMINISTRADOR</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (User usuario : usuarios) {
                                    String nombre = usuario.getNombre();
                                    int nivel = usuario.getLevel();
                                    boolean isAdmin = usuario.isIsadmin();
                            %>
                            <tr>
                                <td><%=nombre%></td>
                                <td><%=nivel%></td>
                                <td><%=isAdmin%></td>
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
