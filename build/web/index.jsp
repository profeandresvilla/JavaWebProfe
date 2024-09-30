<%-- 
    Document   : index
    Created on : 21-feb-2020, 21:03:54
    Author     : Empresa

Parte 21 - Java WEB
https://www.youtube.com/watch?v=rTVWUZNW55I
0:00
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="encabezado.jsp"></jsp:include>
        <title>Aplicación Web</title>

        <script>
            $(document).ready(function () {
                $("#SvtValidarUsuario").submit(function () {
                    $.post("SvtValidarUsuario", $("#SvtValidarUsuario").serialize(), function (data) {
                        perfil = jQuery.trim(data);

                        if (perfil == "1")
                            document.location.href = "MenuAdministrador.jsp";
                        else if (perfil == "2")
                            document.location.href = "MenuEmpleado.jsp";
                        else
                            $("#mensaje-ingreso").html("<h1>Usuario y/o clave NO válido</h1>")
                    });

                    return false;
                });
            });
        </script>
    </head>
    <body>
        <%
            // Cierra la sesión del usuario ingresado al sistema.
            session.invalidate();
        %>
        <h1>Ingreso al sistema</h1>
        <form name="SvtValidarUsuario" id="SvtValidarUsuario" action="SvtValidarUsuario" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="txtUsuario" id="txtUsuario" value="" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Clave</td>
                        <td><input type="password" name="txtClave" id="txtClave" value="" size="10" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Ingresar" name="btnIngresar" id="btnIngresar" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

        <div id="mensaje-ingreso"></div>
    </body>
</html>
