<%@page import="modelo.Caracteristica"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR OBJETO</title>
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
            if (user.isIsadmin()) {
                daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();
                Object errorMessage = session.getAttribute("status");
                if (errorMessage != null) {
        %><p style="color:red"><%=errorMessage%></p><%
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <form action="Objeto" method="POST">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input required name="nombreObjeto" type="text" class="form-control" id="nombre" value="" placeholder="Nombre del objeto">
                        </div>
                        <div class="form-group">
                            <label for="nivel">Nivel</label>
                            <input required name="nivel" type="number" class="form-control" id="nivel" placeholder="Nivel">
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripción</label>
                            <input required name="descripcion" type="text" class="form-control" id="descripcion" placeholder="Descripcion">
                        </div>
                        <div class="form-group">
                            <label for="categoria">Categoria</label>

                            <%
                                List<modelo.Categoria> categorias = (List<modelo.Categoria>) rasgosDAO.getListAllCategorias();

                                if (categorias.isEmpty()) {
                            %>
                            <p> NO HAY CATEGORIAS </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="categoria" name="categoria">
                                <%
                                    for (Categoria cat : categorias) {
                                        String nombre = cat.getNombre();
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

                            <select class="form-control" id="caracteristica" name="caracteristicaObjeto">
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
                            if (categorias.isEmpty() || caracteristicas.isEmpty()) {
                        %>
                        <button disabled type="submit" class="btn btn-primary" name="MODIFICAR OBJETO" value="MODIFICAR OBJETO">MODIFICAR OBJETO</button>

                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary" name="MODIFICAR OBJETO" value="MODIFICAR OBJETO">MODIFICAR OBJETO</button>
                        <% }
                        } else {%>
                        <h2>NO TIENES ACCESO A ESTA PÁGINA</h2>
                        <%}
                        %>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
