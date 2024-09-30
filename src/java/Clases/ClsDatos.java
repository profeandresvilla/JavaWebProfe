/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Empresa
 */
public class ClsDatos {

    private Connection cnn;

    // Constructor para abrir la DB.
    public ClsDatos() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/facturacion";
            cnn = DriverManager.getConnection(db, "root", "12345678");
        } catch (Exception ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void cerrarConexion() {
        try {
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Validar si el usuario es válido o NO
    /////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////
    // validarUsuario01: Sólo mensaje
    /*
    public boolean validarUsuario (String usuario, String clave) {
        try {
            String sql = "select (1) from usuarios where "
                    + "idUsuario = '" + usuario + "' and "
                    + "clave = '" + clave + "'";
            
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
     */
    /////////////////////////////////////////////////////////////////
    // validarUsuario02: Devuelve perfil.
    public String validarUsuario(String usuario, String clave) {
        try {
            String sql = "select idPerfil from usuarios where "
                    + "idUsuario = '" + usuario + "' and "
                    + "clave = '" + clave + "'";

            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            if (rs.next()) {
                return rs.getString("idPerfil");
            } else {
                return "Nok";
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
            return "Nok";
        }
    }
    /////////////////////////////////////////////////////////////////

    public ClsUsuario getUsuario(String idUsuario) {
        try {
            ClsUsuario miUsuario = null;

            String sql = "select * from usuarios where "
                    + "idUsuario = '" + idUsuario + "'";

            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            // Tiramos el Query
            if (rs.next()) {
                miUsuario = new ClsUsuario(
                        rs.getString("idUsuario"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("clave"),
                        rs.getInt("idPerfil"),
                        rs.getString("foto"));
            }

            return miUsuario;
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void newUsuario(ClsUsuario miUsuario) {
        try {
            String sql = "insert into usuarios values('"
                    + miUsuario.getIdUsuario() + "', '"
                    + miUsuario.getNombres() + "', '"
                    + miUsuario.getApellidos() + "', '"
                    + miUsuario.getClave() + "', "
                    + miUsuario.getIdPerfil() + ", '"
                    + miUsuario.getFoto() + "')";

            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUsuario(ClsUsuario miUsuario) {
        try {
            String sql = "update usuarios set "
                    + "nombres='" + miUsuario.getNombres() + "',"
                    + "apellidos='" + miUsuario.getApellidos() + "',"
                    + "clave='" + miUsuario.getClave() + "',"
                    + "idPerfil=" + miUsuario.getIdPerfil() + ","
                    + "foto='" + miUsuario.getFoto() + "' "
                    + "where idUsuario='" + miUsuario.getIdUsuario() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUsuario(String idUsuario) {
        try {
            String sql = "delete from usuarios where "
                    + "idUsuario = '" + idUsuario + "'";

            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet getUsuariosTodos () {
        try {
            ClsUsuario miUsuario = null;
            String sql = "select * from usuarios";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ClsDatos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
