<%-- 
    Document   : anyadirCaracteristicaObjeto
    Created on : 13-may-2018, 23:38:46
    Author     : THOR
--%>

<%@page import="modelo.Caracteristica"%>
<%@page import="modelo.Objeto"%>
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
        <%
            daos.ObjetoDAO objetoDAO = new daos.ObjetoDAO();
            daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();
            Object errorMessage = request.getAttribute("status");
            if (errorMessage != null) {
        %><p style="color:red"><%=errorMessage%></p><%
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <form action="Rasgos" method="POST">
                        <div class="form-group">
                            <label for="objeto">OBJETO</label>

                            <%
                                List<modelo.Objeto> objetos = (List<modelo.Objeto>) objetoDAO.getListAllObjetos();

                                if (objetos.isEmpty()) {
                            %>
                            <p> NO HAY OBJETOS </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="objeto" name="nombreObjeto">
                                <%
                                    for (Objeto obj : objetos) {
                                        String nombre = obj.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="caracteristicas">Caracteristicas</label>

                            <%
                                List<modelo.Caracteristica> caracteristicas = (List<modelo.Caracteristica>) rasgosDAO.getListAllCaracteristicas();

                                if (caracteristicas.isEmpty()) {
                            %>
                            <p> NO HAY CARACTERISTICAS </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="caracteristica" name="nombreCaracteristica">
                                <%
                                    for (Caracteristica caracteristica : caracteristicas) {
                                        String nombre = caracteristica.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                        </div>
                        <%
                            if (objetos.isEmpty() || caracteristicas.isEmpty()) {
                        %>
                        <button disabled type="submit" class="btn btn-primary" name="ANYADIR CARACTERISTICA" value="ANYADIR CARACTERISTICA">ANYADIR CARACTERISTICA</button>

                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary" name="ANYADIR CARACTERISTICA" value="ANYADIR CARACTERISTICA">ANYADIR CARACTERISTICA</button>
                        <%
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
