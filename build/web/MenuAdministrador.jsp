<%-- 
    Document   : MenuAdministrador
    Created on : 21-feb-2020, 21:42:05
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

            String foto = miUsuario.getFoto();

            if (foto.equals("")) {
                foto = "usuarioGenerico.png";
            } 
        %>

        <h1>Menú principal</h1>
        <h2>Bienvenido: <%=miUsuario.getNombres() + " " + miUsuario.getApellidos()%></h2><br>
        <img src="<%="photographs/" + foto%>" width="150" height="150" />
        <br><br>
        <a href="MenuAdministrador.jsp">Cliente</a><br>
        <a href="MenuAdministrador.jsp">Productos</a><br>
        <a href="Usuarios.jsp">Usuarios</a><br>
        <a href="MenuAdministrador.jsp">Nueva Factura</a><br>
        <a href="ReporteFacturas.jsp">Reporte Facturas</a><br>
        <a href="index.jsp">Salir</a>
    </body>
</html>
