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
        <title>JSP Page</title>
    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href='./index.jsp';" >Atrás</button>
        <h1>Elminar usuario</h1>
        <%
            Object errorMessage = request.getAttribute("errorMessage");
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
        <%
            }
        %>
    </body>
</html>
