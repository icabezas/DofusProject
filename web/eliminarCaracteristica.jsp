<%-- 
    Document   : eliminarCaracteristica
    Created on : 13-may-2018, 21:35:20
    Author     : THOR
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Caracteristica"%>
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
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <div class="container">
            <h1>Elminar caracteristicas</h1>
            <%
                Object errorMessage = request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p><%
                }
            %>
            <p>Listado de caracteristicas</p>
            <%
                daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();

                List<modelo.Caracteristica> caracteristicas = (List<modelo.Caracteristica>) rasgosDAO.getListAllCaracteristicas();

                if (caracteristicas.isEmpty()) {
            %>
            <p> NO HAY CARACTERISTICAS </p>
            <%
            } else {
            %>
            <div class="row">
                <div class="col-lg-3">
                    <form action="Rasgos" method="POST">

                        <select class="form-control" name="nombreCaracteristica">
                            <%
                                for (Caracteristica catg : caracteristicas) {
                                    String nombre = catg.getNombre();
                            %>
                            <option value="<%= nombre%>"><%= nombre%></option> 
                            <% }
                            %>
                        </select>
                        <button class="btn btn-primary" type="submit" value="ELIMINAR CARACTERISTICA" name="ELIMINAR CARACTERISTICA">ELIMINAR CARACTERISTICA</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
