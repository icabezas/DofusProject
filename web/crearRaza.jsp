<%-- 
    Document   : crearRaza
    Created on : 13-may-2018, 21:09:33
    Author     : THOR
--%>

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
            Object errorMessage = request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %><p><%=errorMessage%></p><%
            }
        %>
        <div class="container">
            <form action="Rasgos" method="POST">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="nombreRaza">Nombre</label>
                            <input required type="text" class="form-control" name="nombreRaza" id="nombreRaza" placeholder="Nombre de la raza">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-3">
                        <button type="submit" class="btn btn-primary" name="CREAR RAZA" value="CREAR RAZA">CREAR RAZA</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
