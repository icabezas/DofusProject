<%-- 
    Document   : nuevoUsuario
    Created on : 04-may-2018, 20:02:50
    Author     : THOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href='./index.jsp';" >Atrás</button>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="form-sign">
                        <h2 class="form-sign-heading">Registro</h2>
                        <form action="Login" method="POST">
                            <label for="inputUsername">Username</label>
                            <input maxlength="20" type="text" id="inputUsername" name="inputUsername" class="form-control" placeholder="Email" required autofocus>
                            <label for="inputPassword">Contraseña</label>
                            <input maxlength="20"type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Contraseña" required>
                            <label for="inputRepitPassword">Repite la contraseña</label>
                            <input maxlength="20" type="password" id="inputRepitPassword" name="inputRepitPassword" class="form-control" placeholder="REpite contraseña" required>
                            <input type="submit" name="Registrarse" value="Registrarse" class="btn btn-lg btn-primary btn-block">
                        </form>
                        <%
                Object errorMessage = session.getAttribute("status");
                            if (errorMessage != null) {
                        %><p style="color:red"><%=errorMessage%></p><%
                            }
                        %>
                    </div> 
                </div>
            </div>
        </div>
    </body>
</html>
