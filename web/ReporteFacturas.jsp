<%-- 
    Document   : ReporteFacturas
    Created on : 28-feb-2020, 18:19:03
    Author     : Empresa
--%>

<%@page import="Clases.ClsUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="encabezado.jsp"></jsp:include>
            <title>Sistema de facturación</title>
        </head>
        <body>
            <h1>Reporte de facturas</h1>
            <br>
            <a href="javaScript:history.back (1)">Regresar a la página anterior</a><br>

        <%
            // Código para identificar si es Administrador o Empleado 
            // por medio de la sesión.
            HttpSession sesion = request.getSession();
            ClsUsuario miUsuario = (ClsUsuario) sesion.getAttribute("usuario");

            if (miUsuario.getIdPerfil() == 1) {
        %>
        <a href="MenuAdministrador.jsp">Regresar al menú</a>
        <%
        } else {
        %>
        <a href="MenuEmpleado.jsp">Regresar al menú</a>
        <%
            }
        %>
    </body>
</html>
