<%-- 
    Document   : eliminarTipo
    Created on : 14-may-2018, 0:22:43
    Author     : THOR
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Tipo"%>
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
            <h1>Elminar tipo</h1>
            <%
                Object errorMessage = request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p><%
                }
            %>
            <p>Listado de tipos</p>
            <%
                daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();

                List<modelo.Tipo> tipos = (List<modelo.Tipo>) rasgosDAO.getListAllTipos();

                if (tipos.isEmpty()) {
            %>
            <p> NO HAY TIPOS </p>
            <%
            } else {
            %>
            <div class="row">
                <div class="col-lg-3">
                    <form action="Rasgos" method="POST">

                        <select class="form-control" name="nombreTipo">
                            <%
                                for (Tipo tipo : tipos) {
                                    String nombre = tipo.getNombre();
                            %>
                            <option value="<%= nombre%>"><%= nombre%></option> 
                            <% }
                            %>
                        </select>
                        <button class="btn btn-primary" type="submit" value="ELIMINAR TIPO" name="ELIMINAR TIPO">ELIMINAR TIPO</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
