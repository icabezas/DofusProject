<%-- 
    Document   : mostrarPersonajes
    Created on : 14-may-2018, 1:05:11
    Author     : THOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            modelo.User user = (modelo.User) session.getAttribute("usuario");
        %>
        <p>Bienvenid@ <%=user.getNombre()%></p>
        <%

            if (user.isIsadmin()) {%>

        <div class="container">
            <h1>LISTADO USUARIOS</h1>
            <%
                Object errorMessage = request.getAttribute("errorMessage");
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
        <%} else {%>
        <div class="container">
            <h1>LISTADO USUARIOS</h1>
            <%
                Object errorMessage = request.getAttribute("errorMessage");
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
        <%}
        %>
    </body>
</html>
