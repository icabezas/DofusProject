<%-- 
    Document   : eliminarObjeto
    Created on : 13-may-2018, 18:00:13
    Author     : THOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Objeto"%>
<%@page import="java.util.List"%>


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
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <div class="container">
            <h1>Elminar objeto</h1>
            <%
                Object errorMessage = request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p><%
                }
            %>
            <p>Listado de objetos</p>
            <%
                daos.ObjetoDAO objetoDAO = new daos.ObjetoDAO();

                List<modelo.Objeto> objetos = (List<modelo.Objeto>) objetoDAO.getListAllObjetos();

                if (objetos.isEmpty()) {
            %>
            <p> NO HAY OBJETOS </p>
            <%
            } else {
            %>
            <form action="Objeto" method="POST">

                <select class="form-control" name="objetoBorrar">
                    <%
                        for (Objeto objt : objetos) {
                            String nombre = objt.getNombre();
                    %>
                    <option value="<%= nombre%>"><%= nombre%></option> 
                    <% }
                    %>
                </select>
                <input type="submit" value="ELIMINAR OBJETO" name="ELIMINAR OBJETO">
            </form>
            <%
                }
            %>
        </div>
    </body>
</html>
