<%-- 
    Document   : eliminarUsuario
    Created on : 13-may-2018, 17:22:31
    Author     : THOR
--%>

<%@page import="modelo.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR USUARIO</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href = './mainScreenAdmin.jsp';" >Atrás</button>
        <h1>Elminar usuario</h1>
        <%
            modelo.User user = (modelo.User) session.getAttribute("usuario");
            if (user.isIsadmin()) {
                Object errorMessage = session.getAttribute("status");
                if (errorMessage != null) {
        %><p><%=errorMessage%></p><%
            }
        %>
        <p>Listado de usuarios</p>
        <%
            daos.UsuarioDAO usuarioDAO = new daos.UsuarioDAO();

            List<modelo.User> usuarios = (List<modelo.User>) usuarioDAO.getListUsersNoAdmin();

            if (usuarios.isEmpty()) {
        %>
        <p> NO HAY USUARIOS </p>
        <%
        } else {
        %>
        <form action="User" method="POST">

            <select name="usuarioBorrar">
                <%
                    for (User usuario : usuarios) {
                        String nombre = usuario.getNombre();
                %>
                <option value="<%= nombre%>"><%= nombre%></option> 
                <% }
                %>
            </select>
            <input type="submit" value="ELIMINAR USUARIO" name="ELIMINAR USUARIO">
        </form>
        <% }
        } else {%>
        <h2>NO TIENES ACCESO A ESTA PÁGINA</h2>
        <%}
        %>
    </body>
</html>
