<%-- 
    Document   : Usuarios
    Created on : 24-feb-2020, 14:02:03
    Author     : Empresa
--%>

<%@page import="Clases.ClsUsuario"%>
<%@page import="Clases.ClsDatos"%>
<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
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
            ClsUsuario miUsuarioLogueado = (ClsUsuario) sesion.getAttribute("usuario");

            if (miUsuarioLogueado == null || miUsuarioLogueado.getIdPerfil() != 1) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }

            // Variable que muestra los mensajes del sistema.
            String varMensaje = "";

            // Identificamos el botón que el usuario presionó.
            boolean btnConsultar = false;
            boolean btnNuevo = false;
            boolean btnModificar = false;
            boolean btnBorrar = false;
            boolean btnLimpiar = false;
            boolean btnListar = false;

            if (request.getParameter("btnConsultar") != null) {
                btnConsultar = true;
            }

            if (request.getParameter("btnNuevo") != null) {
                btnNuevo = true;
            }

            if (request.getParameter("btnModificar") != null) {
                btnModificar = true;
            }

            if (request.getParameter("btnBorrar") != null) {
                btnBorrar = true;
            }

            if (request.getParameter("btnLimpiar") != null) {
                btnLimpiar = true;
            }

            if (request.getParameter("btnListar") != null) {
                btnListar = true;
            }

            // Obtenemos el valor como fue llamado el formulario
            String varIdUsuario = "";
            String varNombres = "";
            String varApellidos = "";
            String varClave = "";
            String varConfirmacion = "";
            String varIdPerfil = "";
            String varFoto = "";

            if (request.getParameter("txtIdUsuario") != null) {
                varIdUsuario = request.getParameter("txtIdUsuario");
            }
            if (request.getParameter("txtNombres") != null) {
                varNombres = request.getParameter("txtNombres");
            }
            if (request.getParameter("txtApellidos") != null) {
                varApellidos = request.getParameter("txtApellidos");
            }
            if (request.getParameter("txtClave") != null) {
                varClave = request.getParameter("txtClave");
            }
            if (request.getParameter("txtConfirmacion") != null) {
                varConfirmacion = request.getParameter("txtConfirmacion");
            }
            if (request.getParameter("ListIdPerfil") != null) {
                varIdPerfil = request.getParameter("ListIdPerfil");
            }
            if (request.getParameter("flsFoto") != null) {
                varFoto = request.getParameter("flsFoto");
            }

            // Si presiona el botón consultar        
            if (btnConsultar) {
                if (varIdUsuario.equals("")) {
                    varMensaje = "Debe ingresar un ID de usuario.";
                } else {
                    ClsDatos misDatos = new ClsDatos();
                    ClsUsuario miUsuario = misDatos.getUsuario(varIdUsuario);

                    if (miUsuario == null) {
                        varMensaje = "Usuario NO existe.";
                    } else {
                        varIdUsuario = miUsuario.getIdUsuario();
                        varNombres = miUsuario.getNombres();
                        varApellidos = miUsuario.getApellidos();
                        varClave = miUsuario.getClave();
                        varConfirmacion = miUsuario.getClave();
                        varIdPerfil = "" + miUsuario.getIdPerfil();
                        varFoto = miUsuario.getFoto();
                        varMensaje = "Usuario consultado";
                    }

                    misDatos.cerrarConexion();
                }
            }

            // Si presiona el botón limpiar
            if (btnLimpiar) {
                varIdUsuario = "";
                varNombres = "";
                varApellidos = "";
                varClave = "";
                varConfirmacion = "";
                varIdPerfil = "";
                varFoto = "";
            }

            // Si presiona el botón Nuevo
            if (btnNuevo) {
                if (varIdUsuario.equals("")) {
                    varMensaje = "Debe ingresar un ID de usuario";
                } else if (varNombres.equals("")) {
                    varMensaje = "Debe ingresar nombre de usuario";
                } else if (varApellidos.equals("")) {
                    varMensaje = "Debe ingresar apellidos de usuario";
                } else if (varClave.equals("")) {
                    varMensaje = "Debe ingresar clave de usuario";
                } else if (varConfirmacion.equals("")) {
                    varMensaje = "Debe ingresar confirmación de clave de usuario";
                } else if (!varClave.equals(varConfirmacion)) {
                    varMensaje = "La clave de usuario y su confirmación NO coinciden";
                } else if (varIdPerfil.equals("0")) {
                    varMensaje = "Debe seleccionar un perfil de usuario";
                } else {
                    ClsDatos misDatos = new ClsDatos();
                    ClsUsuario miUsuario = misDatos.getUsuario(varIdUsuario);

                    if (miUsuario != null) {
                        varMensaje = "Usuario ya existe";
                    } else {
                        miUsuario = new ClsUsuario(
                                varIdUsuario,
                                varNombres,
                                varApellidos,
                                varClave,
                                new Integer(varIdPerfil),
                                varFoto);

                        misDatos.newUsuario(miUsuario);
                        varMensaje = "Usuario ingresado";
                    }

                    misDatos.cerrarConexion();
                }
            }

            // Si presiona el botón Modificar
            if (btnModificar) {
                if (varIdUsuario.equals("")) {
                    varMensaje = "Debe ingresar un ID de usuario";
                } else if (varNombres.equals("")) {
                    varMensaje = "Debe ingresar nombre de usuario";
                } else if (varApellidos.equals("")) {
                    varMensaje = "Debe ingresar apellidos de usuario";
                } else if (varClave.equals("")) {
                    varMensaje = "Debe ingresar clave de usuario";
                } else if (varConfirmacion.equals("")) {
                    varMensaje = "Debe ingresar confirmación de clave de usuario";
                } else if (!varClave.equals(varConfirmacion)) {
                    varMensaje = "La clave de usuario y su confirmación NO coinciden";
                } else if (varIdPerfil.equals("0")) {
                    varMensaje = "Debe seleccionar un perfil de usuario";
                } else {
                    ClsDatos misDatos = new ClsDatos();
                    ClsUsuario miUsuario = misDatos.getUsuario(varIdUsuario);

                    if (miUsuario == null) {
                        varMensaje = "Usuario NO existe";
                    } else {
                        miUsuario = new ClsUsuario(
                                varIdUsuario,
                                varNombres,
                                varApellidos,
                                varClave,
                                new Integer(varIdPerfil),
                                varFoto);

                        misDatos.updateUsuario(miUsuario);
                        varMensaje = "Usuario modificado";
                    }

                    misDatos.cerrarConexion();
                }
            }

            // Si presiona el botón consultar        
            if (btnBorrar) {
                if (varIdUsuario.equals("")) {
                    varMensaje = "Debe ingresar un ID de usuario.";
                } else {
                    ClsDatos misDatos = new ClsDatos();
                    ClsUsuario miUsuario = misDatos.getUsuario(varIdUsuario);

                    if (miUsuario == null) {
                        varMensaje = "Usuario NO existe.";
                    } else {
                        misDatos.deleteUsuario(varIdUsuario);

                        varIdUsuario = "";
                        varNombres = "";
                        varApellidos = "";
                        varClave = "";
                        varConfirmacion = "";
                        varIdPerfil = "";
                        varFoto = "";

                        varMensaje = "Usuario eliminado";
                    }

                    misDatos.cerrarConexion();
                }
            }

            if (btnListar) {
                %>
                <jsp:forward page="UsuariosListados.jsp"></jsp:forward>
                <%
            }
        %>

        <h1>Usuarios</h1>
        <form name="SvtUsuarios" id="SvtUsuarios" action="Usuarios.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>ID Usuario:</td>
                        <td><input type="text" name="txtIdUsuario" id="txtIdUsuario" value="<%=varIdUsuario%>" size="10" />(*)</td>
                    </tr>
                    <tr>
                        <td>Nombres:</td>
                        <td><input type="text" name="txtNombres" id="txtNombres" value="<%=varNombres%>" size="30" />(*)</td>
                    </tr>
                    <tr>
                        <td>Apellidos:</td>
                        <td><input type="text" name="txtApellidos" id="txtApellidos" value="<%=varApellidos%>" size="30" />(*)</td>
                    </tr>
                    <tr>
                        <td>Clave:</td>
                        <td><input type="password" name="txtClave" id="txtClave" value="<%=varClave%>" size="10" />(*)</td>
                    </tr>
                    <tr>
                        <td>Confirmación de clave:</td>
                        <td><input type="password" name="txtConfirmacion" id="txtConfirmacion" value="<%=varConfirmacion%>" size="10" />(*)</td>
                    </tr>
                    <tr>
                        <td>Perfil:</td>

                        <td><select name="ListIdPerfil" id="ListIdPerfil">
                                <%-- OPCION 1:Escoje la opción de Drop-down List
                                --%>
                                <option value="0" <%=(varIdPerfil.equals("") ? "selected" : "")%> >Seleccione el perfil...</option>
                                <option value="1" <%=(varIdPerfil.equals("1") ? "selected" : "")%> >Administrador</option>
                                <option value="2" <%=(varIdPerfil.equals("2") ? "selected" : "")%> >Empleado</option>

                                <%-- OPCION 2: 
                                Éste Código también funciona perfectamente para que escoja la opción de Drop-down List
                                <%
                                    if (varIdPerfil.equals("")) {
                                %>
                                <option value="0" selected>Seleccione el perfil</option>
                                <%
                                } else {
                                %>
                                <option value="0" >Seleccione el perfil</option>
                                <%
                                    }

                                    if (varIdPerfil.equals("1")) {
                                %>
                                <option value="1" selected>Administrador</option>
                                <%
                                } else {
                                %>
                                <option value="1">Administrador</option>
                                <%
                                    }

                                    if (varIdPerfil.equals("2")) {
                                %>
                                <option value="2" selected>Empleado</option>
                                <%
                                } else {
                                %>
                                <option value="2">Empleado</option>
                                <%
                                    }
                                %>
                                --%>
                            </select>(*)</td>
                    </tr>
                    <tr>
                        <td>Foto:</td>
                        <td>
                            <input type="file" name="flsFoto" id="flsFoto" value="<%=varFoto%>" />
                            <%
                                if (varFoto == null) {
                                    varFoto = "";
                                }

                                if (!varFoto.equals("")) {
                            %>
                            <br>
                            <img src="<%="photographs/" + varFoto%>" width="150" height="150" alt="Seleccione una foto..." />
                            <%
                            } else {
                            %>
                            <br>
                            <img src="photographs/usuarioGenerico.png" width="150" height="150" alt="Seleccione una foto..."/>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">* Campos obligatorios</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <jsp:include page="botones.jsp"></jsp:include>
            </form>
            <br>
            <h1><%=varMensaje%></h1>
        <br>
        <a href="javaScript:history.back (1)">Regresar a la página anterior</a><br>
        <a href="MenuAdministrador.jsp">Regresar al menú</a>
    </body>
</html>
