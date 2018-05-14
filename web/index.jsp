<%-- 
    Document   : index
    Created on : 13-may-2018, 16:22:26
    Author     : THOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%
                Object errorMessage = session.getAttribute("status");
            if (errorMessage != null) {
        %><p style="color:red"><%=errorMessage%></p><%
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="form-sign">
                        <h2 class="form-sign-heading">Inicia sesión</h2>
                        <form action="Login" method="POST">
                            <input type="text" id="inputUsername" name="inputUsername" class="form-control" placeholder="Email" required autofocus>
                            <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Contraseña" required>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="remember-me"> Recuerdame
                                </label>
                            </div>
                            <input type="submit" name="Login" value="Login" class="btn btn-lg btn-primary btn-block">
                        </form>
                        <a href="./crear/nuevoUsuario.jsp">¿Eres nuevo aquí?</a><br>
                    </div> 
                </div>
            </div>
        </div>
    </body>
</html>
