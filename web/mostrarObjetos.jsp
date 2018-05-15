<%@page import="modelo.Caracteristica"%>
<%@page import="modelo.Objeto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OBJETOS</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <button class="btn btn-primary" onclick="location.href = './mainScreenAdmin.jsp';" >Atrás</button>
        <div class="container">
            <h1>LISTADO OBJETOS</h1>
            <%
                modelo.User user = (modelo.User) session.getAttribute("usuario");
                if (user.isIsadmin()) {
                Object errorMessage = session.getAttribute("status");
                if (errorMessage != null) {
            %><p><%=errorMessage%></p><%
                }
                daos.ObjetoDAO objetoDAO = new daos.ObjetoDAO();

                List<modelo.Objeto> objetos = (List<modelo.Objeto>) objetoDAO.getListAllObjetos();

                if (objetos.isEmpty()) {
            %>
            <p> NO HAY OBJETOS </p>
            <%
            } else {
            %>
            <div class="row">

                <div class="col-lg-6">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>NIVEL</th>
                                <th>DESCRIPCION</th>
                                <th>CATEGORIA</th>
                                <th>CARACTERISTICAS</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (Objeto objeto : objetos) {
                                    String nombre = objeto.getNombre();
                                    int id = objeto.getIdobjeto();
                                    int nivel = objeto.getNivel();
                                    String descripcion = objeto.getDescripcion();
                                    String categoria = objeto.getCategoria().getNombre();
                                    List<Caracteristica> caracteristicas = objetoDAO.getCaracteristicasObjeto(objeto);
                                    String carcts = "";
                                    for (Caracteristica caracteristica : caracteristicas) {
                                        carcts += caracteristica.getNombre() + ", ";
                                    }
                            %>
                            <tr>
                                <td><%=id%></td>
                                <td><%=nombre%></td>
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
            </div>
        </div>

        <% }
        } else {%>
        <h2>NO TIENES ACCESO A ESTA PÁGINA</h2>
        <%}
        %>
    </body>
</html>
