/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import exceptions.DofusException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.User;

/**
 *
 * @author THOR
 */
public class UsuarioDAO extends DbDAO{

    Connection conexion;

    //REGISTRAR USUARIO
    public void newUser(User u) throws SQLException, DofusException {
        conectar();
        String insert = "insert into usuario values (?,?,?,?);";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setString(1, u.getNombre());
        ps.setString(2, u.getPassword());
        ps.setInt(3, 1);
        ps.setBoolean(4, false);
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public List<User> getListUsersNoAdmin() throws SQLException {
        conectar();
        String query = "select * from usuario where not nombre = 'admin'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<User> usuarios = new ArrayList<>();
        while (rs.next()) {
            User user = new User();
            user.setNombre(rs.getString("nombre"));
            user.setPassword(rs.getString("passwd"));
            user.setLevel(rs.getInt("nivel"));
            user.setIsadmin(rs.getBoolean("isAdmin"));
            usuarios.add(user);
        }
        rs.close();
        st.close();
        desconectar();
        return usuarios;
    }
    
    public List<User> getListUsers() throws SQLException {
        conectar();
        String query = "select * from usuario";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<User> usuarios = new ArrayList<>();
        while (rs.next()) {
            User user = new User();
            user.setNombre(rs.getString("nombre"));
            user.setPassword(rs.getString("passwd"));
            user.setLevel(rs.getInt("nivel"));
            user.setIsadmin(rs.getBoolean("isAdmin"));
            usuarios.add(user);
        }
        rs.close();
        st.close();
        desconectar();
        return usuarios;
    }
    
    //ELIMINAR USUARIO
    public void eliminarUsuario(String userName) throws SQLException{
        conectar();
        String delete = "delete from usuario where nombre = '" + userName + "'";
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.close();
        desconectar();
    }

    //FUNCION AUXILIAR
    public User getUserByUsername(String userName) throws SQLException {
        conectar();
        User user = new User();
        String select = "select * from usuario where nombre='" + userName + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            user.setNombre(userName);
            user.setPassword(rs.getString("passwd"));
            user.setLevel(rs.getInt("nivel"));
            user.setIsadmin(rs.getBoolean("isAdmin"));
        }
        rs.close();
        st.close();
        desconectar();
        return user;
    }

    public boolean existsUser(String username) throws SQLException {
        conectar();
        boolean exists = false;
        String select = "select * from usuario where nombre ='" + username + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            exists = true;
        } else {
            exists = false;
        }
        rs.close();
        st.close();
        desconectar();
        return exists;
    }
    
    //

    //CHECK PASSWORDS
    public boolean checkPasswords(String psw1, String psw2) {
        if (psw1.equals(psw2)) {
            return true;
        } else {
            return false;
        }
    }
    
    // ********************* Conectar / Desconectar ****************************//

    public void conectar() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/dofus";
        String user = "root";
        String pass = "";
        conexion = DriverManager.getConnection(url, user, pass);
    }

    public void desconectar() throws SQLException {
        if (conexion != null) {
            conexion.close();
        }
    }
}
