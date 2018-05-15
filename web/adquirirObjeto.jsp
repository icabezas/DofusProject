<%@page import="modelo.Objeto"%>
<%@page import="modelo.Personaje"%>
<%@page import="modelo.Caracteristica"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADQUIRIR OBJETO</title>
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
            
                daos.PersonajeDAO personajeDAO = new daos.PersonajeDAO();
                daos.ObjetoDAO objetoDAO = new daos.ObjetoDAO();
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
                            <label for="personaje">Personaje</label>

                            <%
                                List<modelo.Personaje> personajes = (List<modelo.Personaje>) personajeDAO.getListAllPersonajes();

                                if (personajes.isEmpty()) {
                            %>
                            <p> NO HAY PERSONAJES </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="personaje" name="personaje">
                                <%
                                    for (Personaje pers : personajes) {
                                        String nombre = pers.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="objeto">Objetos</label>

                            <%
                                List<modelo.Objeto> objetos = (List<modelo.Objeto>) objetoDAO.getListAllObjetos();

                                if (objetos.isEmpty()) {
                            %>
                            <p> NO HAY OBJETOS </p>
                            <%
                            } else {
                            %>

                            <select class="form-control" id="objeto" name="objeto">
                                <%
                                    for (Objeto objeto : objetos) {
                                        String nombre = objeto.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                    }
                                %>
                            </select>
                        </div>
                        <%
                            if (personajes.isEmpty() || objetos.isEmpty()) {
                        %>
                        <button disabled type="submit" class="btn btn-primary" name="ADQUIRIR" value="ADQUIRIR OBJETO">ADQUIRIR OBJETO</button>

                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary" name="ADQUIRIR OBJETO" value="ADQUIRIR OBJETO">ADQUIRIR OBJETO</button>
                        <% }
                        %>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>