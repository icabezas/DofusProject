<%-- 
    Document   : eliminarRaza
    Created on : 13-may-2018, 21:14:14
    Author     : THOR
--%>

<%@page import="modelo.Raza"%>
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
            <h1>Elminar raza</h1>
            <%
                Object errorMessage = request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p><%
                }
            %>
            <p>Listado de razas</p>
            <%
                daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();

                List<modelo.Raza> razas = (List<modelo.Raza>) rasgosDAO.getListAllRazas();

                if (razas.isEmpty()) {
            %>
            <p> NO HAY RAZAS </p>
            <%
            } else {
            %>
            <div class="row">
                <div class="col-lg-3">
                    <form action="Rasgos" method="POST">

                        <select class="form-control" name="nombreRaza">
                            <%
                                for (Raza raza : razas) {
                                    String nombre = raza.getNombre();
                            %>
                            <option value="<%= nombre%>"><%= nombre%></option> 
                            <% }
                            %>
                        </select>
                        <button class="btn btn-primary" type="submit" value="ELIMINAR RAZA" name="ELIMINAR RAZA">ELIMINAR RAZA</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
