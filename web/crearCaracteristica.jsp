<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREAR CARACTERISTICA</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    </head>
    <body>

        <button class="btn btn-primary" onclick="location.href = '../../mainScreen.jsp';" >Atrás</button>
        <%
            modelo.User user = (modelo.User) session.getAttribute("usuario");
            if (user.isIsadmin()) {
                Object errorMessage = session.getAttribute("status");
                if (errorMessage != null) {
        %><p><%=errorMessage%></p><%
            }
        %>
        <div class="container">
            <form action="Rasgos" method="POST">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="nombreCaracteristica">Nombre</label>
                            <input required type="text" class="form-control" name="nombreCaracteristica" id="nombreCaracteristica" placeholder="Nombre de la caracteristica">
                        </div>
                        <div class="form-group">
                            <label for="valorCaracteristica">Valor</label>
                            <input required type="number" class="form-control" name="valorCaracteristica" id="valorCaracteristica" placeholder="Valor de la caracteristica">
                        </div>
                        <div class="form-group">
                            <div class="isPrimaria">
                                <label for="isPrimaria">¿Es una caracteristica primaria?</label>
                                <input type="checkbox" id="isPrimaria" name="isPrimaria">Si</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-3">
                        <button type="submit" class="btn btn-primary" name="CREAR CARACTERISTICA" value="CREAR CARACTERISTICA">CREAR CARACTERISTICA</button>
                    </div>
                </div>
            </form>
        </div>
        <% } else {%>
        <h2>NO TIENES ACCESO A ESTA PÁGINA</h2>
        <%}
        %>
    </body>
</html>
