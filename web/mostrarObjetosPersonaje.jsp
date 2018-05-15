<%@page import="modelo.ObjetoPersonaje"%>
<%@page import="modelo.Personaje"%>
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

        <%

            daos.ObjetoDAO objetoDAO = new daos.ObjetoDAO();
            daos.PersonajeDAO personajeDAO = new daos.PersonajeDAO();
            modelo.User user = (modelo.User) session.getAttribute("usuario");
            List<modelo.ObjetoPersonaje> objetoPersonaje = (List<modelo.ObjetoPersonaje>) session.getAttribute("objetos");
            
            List<modelo.Personaje> personajesUsuario = personajeDAO.getListAllPersonajesPorUsuario(user);
        %>
        <button class="btn btn-primary" onclick="location.href = './mainScreen.jsp';" >Atrás</button>
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <form action="Personaje">
                        <div class="col-xs-6">

                            <select class="form-control" id="personaje" name="personaje">
                                <%
                                    for (Personaje per : personajesUsuario) {
                                        String nombre = per.getNombre();
                                %>
                                <option value="<%= nombre%>"><%= nombre%></option> 
                                <% }
                                %>
                            </select> 
                        </div>
                        <div class="col-xs-6">
                            <button class="btn btn-primary" type="submit" name="SELECCIONAR PERSONAJE" value="SELECCIONAR PERSONAJE">SELECCIONAR PERSONAJE</button>
                        </div>

                    </form>
                </div>
                <div class="col-xs-6"></div>
                <%
                    if (objetoPersonaje != null) {
                %>
                <hr>
                <div class="col-lg-12">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>PERSONAJE</th>
                                <th>NOMBRE</th>
                                <th>NIVEL</th>
                                <th>DESCRIPCION</th>
                                <th>CATEGORIA</th>
                                <th>CARACTERISTICAS</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (ObjetoPersonaje objetoP : objetoPersonaje) {
                                    String nombreObjeto = objetoP.getObjeto().getNombre();
                                    String nombrePersonaje = objetoP.getPersonaje().getNombre();
                                    int nivel = objetoP.getObjeto().getNivel();
                                    String descripcion = objetoP.getObjeto().getDescripcion();
                                    String categoria = objetoP.getObjeto().getCategoria().getNombre();
                                    List<Caracteristica> caracteristicas = objetoDAO.getCaracteristicasObjeto(objetoP.getObjeto());
                                    String carcts = "";
                                    for (Caracteristica caracteristica : caracteristicas) {
                                        carcts += caracteristica.getNombre() + ", ";
                                    }
                            %>
                            <tr>
                                <td><%=nombrePersonaje%></td>
                                <td><%=nombreObjeto%></td>
                                <td><%=nivel%></td>
                                <td><%=descripcion%></td>
                                <td><%=categoria%></td>
                                <td><%=carcts%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <%
                } else {
                %>
                <div class="col-xs-12">
                    <p>NO HAY OBJETOS</p>
                </div>
                <%
                    }
                %>
            </div>
        </div>

    </body>
</html>
