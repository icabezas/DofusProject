<%@page import="modelo.Tipo"%>
<%@page import="modelo.Raza"%>
<%@page import="modelo.Caracteristica"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR PERSONAJE</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <%
            modelo.User user = (modelo.User) session.getAttribute("usuario");
            modelo.Personaje personaje = (modelo.Personaje) session.getAttribute("personaje");

            daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();
            List<modelo.Raza> razas = (List<modelo.Raza>) rasgosDAO.getListAllRazas();
            List<modelo.Tipo> tipos = (List<modelo.Tipo>) rasgosDAO.getListAllTipos();

            Object errorMessage = session.getAttribute("status");
            if (errorMessage != null) {
        %><p style="color:red"><%=errorMessage%></p><%
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <form action="Personaje" method="POST">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input readonly name="nombrePersonaje" type="text" class="form-control" id="nombre" value="<%=personaje.getNombre()%>">
                        </div>
                        <div class="form-group">
                            <label for="nivel">Nivel</label>
                            <input readonly name="nivel" type="number" class="form-control" id="nivel" value="<%=personaje.getNivel()%>">
                        </div>
                        <div class="form-group">
                            <label for="raza">Raza</label>
                            <select class="form-control" id="raza" name="raza">
                                <%
                                    for (Raza raza : razas) {
                                        String nombre = raza.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Tipo</label>
                            <select class="form-control" id="tipo" name="tipo">
                                <%
                                    for (Tipo tipo : tipos) {
                                        String nombre = tipo.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary" name="MODIFICAR" value="MODIFICAR">MODIFICAR PERSONAJE</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
