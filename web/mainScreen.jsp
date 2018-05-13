<%-- 
    Document   : userValidado
    Created on : 04-may-2018, 20:21:23
    Author     : THOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            modelo.User user = (modelo.User) session.getAttribute("usuario");
        %>
        <p>Bienvenid@ <%=user.getNombre()%></p>
        <%

            if (user.isIsadmin()) {%>
        <h1>ADMINISTRACION</h1>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>USUARIO</h3>
                    <form action="eliminarUsuario.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR USUARIO">ELIMINAR USUARIO</button>
                    </form>
                    <form action="makeAdmin.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="DAR PRIVILEGIOS">DAR PRIVILEGIOS</button>
                    </form>
                    <hr>
                    <h3>OBJETOS</h3>
                    <form action="eliminarObjeto.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR OBJETOS">ELIMINAR OBJETOS</button>
                    </form>
                    <form action="crearObjeto.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR OBJETO">CREAR OBJETOS</button>
                    </form>
                    <hr>
                    <h3>CATEGORIA</h3>
                    <form action="eliminarCategoria.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="ELIMINAR CATEGORIA">ELIMINAR CATEGORIA</button>
                    </form>
                    <form action="crearCategoria.jsp" method="POST">
                        <button class="btn btn-primary" type="submit" value="CREAR CATEGORIA">CREAR CATEGORIA</button>
                    </form>
                </div>
            </div>
            <%} else {%>

            <%}
            %>
        </div>
    </body>
</html>
