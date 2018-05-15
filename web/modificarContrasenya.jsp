
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR CONTRASEÑA</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <div class="container">
            <h1>MODIFICAR CONTRASEÑA</h1>
            <%
                modelo.User user = (modelo.User) session.getAttribute("usuario");

                Object errorMessage = session.getAttribute("status");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p>
            <%
                }
            %>

            <div class="row">
                <div class="col-lg-6">
                    <form action="User${user.getNombre()}" method="POST">
                        <div class="form-group">
                            <label for="oldPassword">Contraseña antigua</label>
                            <input maxlength="20" required name="oldPassword" type="text" class="form-control" id="oldPassword" placeholder="Contraseña antigua">
                        </div>
                        <div class="form-group">
                            <label for="newPassword1">Nueva contraseña</label>
                            <input maxlength="20" required name="newPassword1" type="text" class="form-control" id="newPassword1" placeholder="Nueva contraseña">
                        </div>
                        <div class="form-group">
                            <label for="newPassword2">Repite la nueva contraseña</label>
                            <input maxlength="20" required name="newPassword2" type="text" class="form-control" id="newPassword2" placeholder="Nombre del objeto">
                        </div>
                        <button class="btn btn-primary" type="submit" value="MODIFICAR CONTRASENYA" name="MODIFICAR CONTRASENYA">MODIFICAR CONTRASEÑA</button>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
