<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR CATEGORIA</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <div class="container">
            <%
                modelo.User user = (modelo.User) session.getAttribute("usuario");
                if (user.isIsadmin()) {
                Object errorMessage = session.getAttribute("status");
                    if (errorMessage != null) {
            %><p style="color:red"><%=errorMessage%></p>
            <h1>Elminar categoria</h1>
            <%
                }
            %>
            <p>Listado de categorias</p>
            <%
                daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();

                List<modelo.Categoria> categorias = (List<modelo.Categoria>) rasgosDAO.getListAllCategorias();

                if (categorias.isEmpty()) {
            %>
            <p> NO HAY CATEGORIAS </p>
            <%
            } else {
            %>
            <div class="row">
                <div class="col-lg-3">
                    <form action="Rasgos" method="POST">

                        <select class="form-control" name="nombreCategoria">
                            <%
                                for (Categoria catg : categorias) {
                                    String nombre = catg.getNombre();
                            %>
                            <option value="<%= nombre%>"><%= nombre%></option> 
                            <% }
                            %>
                        </select>
                        <button class="btn btn-primary" type="submit" value="ELIMINAR CATEGORIA" name="ELIMINAR CATEGORIA">ELIMINAR CATEGORIA</button>
                    </form>
                    <% }
                    } else {%>
                    <h2>NO TIENES ACCESO A ESTA PÁGINA</h2>
                    <%}
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
