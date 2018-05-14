<%-- 
    Document   : mostrarCaracteristicas
    Created on : 14-may-2018, 0:14:20
    Author     : THOR
--%>

<%@page import="modelo.Caracteristica"%>
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
            <h1>LISTADO CARACTERISTICAS</h1>
            <%
                Object errorMessage = request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p><%
                }
                daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();

                List<modelo.Caracteristica> caracteristicas = (List<modelo.Caracteristica>) rasgosDAO.getListAllCaracteristicas();

                if (caracteristicas.isEmpty()) {
            %>
            <p> NO HAY CARACTERISTICAS </p>
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
                                <th>VALOR</th>
                                <th>PRIMARIA</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (Caracteristica caracteristica : caracteristicas) {
                                    String nombre = caracteristica.getNombre();
                                    int id = caracteristica.getIdCaracteristica();
                                    int valor = caracteristica.getValor();
                                    boolean isPrimaria = caracteristica.isIsPrimaria();
                            %>
                            <tr>
                                <td><%=id%></td>
                                <td><%=nombre%></td>
                                <td><%=valor%></td>
                                <td><%=isPrimaria%></td>
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
