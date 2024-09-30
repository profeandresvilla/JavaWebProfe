<%-- 
    Document   : UsuariosListados
    Created on : 28-feb-2020, 12:08:43
    Author     : Empresa
--%>

<%@page import="Clases.ClsUsuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.ClsDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="encabezado.jsp"></jsp:include>
        <title>Sistema de facturación</title>
        </head>
        <body>
                    <%
            // Código para identificar si es Administrador o Empleado 
            // por medio de la sesión.
            HttpSession sesion = request.getSession();
            ClsUsuario miUsuario = (ClsUsuario) sesion.getAttribute("usuario");

            if (miUsuario == null || miUsuario.getIdPerfil() != 1) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>
            
            <h1>Listado Usuarios</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID Usuario</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Perfil</th>
                        <th>Foto</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    ClsDatos misDatos = new ClsDatos();
                    ResultSet rs = misDatos.getUsuariosTodos();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("idUsuario")%></td>
                    <td><%=rs.getString("nombres")%></td>
                    <td><%=rs.getString("apellidos")%></td>
                    <td><%=(rs.getString("idPerfil").equals("1") ? "Administrador" : "Empleado")%></td>
                    <td><img src="<%="photographs/" + rs.getString("foto")%>" width="80" height="100" /></td>
                </tr>
                <%
                    }
                    misDatos.cerrarConexion();
                %>
            </tbody>
        </table>

        <br>
        <a href="javaScript:history.back (1)">Regresar a la página anterior</a><br>
        <a href="MenuAdministrador.jsp">Regresar al menú</a>
    </body>
</html>
