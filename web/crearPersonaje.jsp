<%-- 
    Document   : crearPersonaje
    Created on : 14-may-2018, 0:28:12
    Author     : THOR
--%>

<%@page import="modelo.Tipo"%>
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
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>

        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <%
            daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();

            Object errorMessage = session.getAttribute("errorMessage");
            if (errorMessage != null) {
        %><p><%=errorMessage%></p><%
            }
        %>
        <div class="container">
            <form action="Personaje" method="POST">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="nombrePersonaje">Nombre</label>
                            <input required type="text" class="form-control" name="nombrePersonaje" id="nombrePersonaje" placeholder="Nombre">
                        </div>

                        <div class="form-group">
                            <label for="razaPersonaje">Raza</label>

                            <%
                                List<modelo.Raza> razas = (List<modelo.Raza>) rasgosDAO.getListAllRazas();

                                if (razas.isEmpty()) {
                            %>
                            <p> NO HAY RAZAS </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="razaPersonaje" name="razaPersonaje">
                                <%
                                    for (Raza raza : razas) {
                                        String nombre = raza.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipoPersonaje">Tipo</label>

                            <%
                                List<modelo.Tipo> tipos = (List<modelo.Tipo>) rasgosDAO.getListAllTipos();

                                if (tipos.isEmpty()) {
                            %>
                            <p> NO HAY TIPOS </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="tipoPersonaje" name="tipoPersonaje">
                                <%
                                    for (Tipo tipo : tipos) {
                                        String nombre = tipo.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-3">
                        <%
                            if (tipos.isEmpty() || razas.isEmpty()) {
                        %>
                        <button disabled type="submit" class="btn btn-primary" name="CREAR PERSONAJE" value="CREAR PERSONAJE">CREAR PERSONAJE</button>
                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary" name="CREAR PERSONAJE" value="CREAR PERSONAJE">CREAR PERSONAJE</button>

                        <%
                            }
                        %>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
