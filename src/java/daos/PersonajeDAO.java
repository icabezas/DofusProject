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
import modelo.Categoria;
import modelo.Objeto;
import modelo.ObjetoPersonaje;
import modelo.Personaje;
import modelo.User;

/**
 *
 * @author THOR
 */
public class PersonajeDAO extends DbDAO {

    Connection conexion;
    RasgosDAO rasgosDAO = new RasgosDAO();
    UsuarioDAO usuarioDAO = new UsuarioDAO();

    public void crearPersonaje(Personaje personaje) throws SQLException {
        conectar();
        String insert = "insert into personaje values (?,?,?,?,?,?);";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setInt(1, getLastID());
        ps.setString(2, personaje.getNombre());
        ps.setInt(3, personaje.getNivel());
        ps.setString(4, personaje.getRaza().getNombre());
        ps.setString(5, personaje.getTipo().getNombre());
        ps.setString(6, personaje.getUser().getNombre());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public void modificarPersonaje(Personaje personaje) throws SQLException, DofusException {
        conectar();
        Statement st = conexion.createStatement();
        String update = "update personaje set raza='" + personaje.getRaza().getNombre() + "' and tipo = '" + personaje.getTipo().getNombre() + "' where nombre = '" + personaje.getNombre() + "';";
        st.executeUpdate(update);
        st.close();
        desconectar();
    }

    public void eliminarPersonaje(Personaje personaje) throws SQLException {
        conectar();
        String delete = "delete from personaje where nombre = '" + personaje.getNombre() + "'";
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.close();
        desconectar();
    }

    public Personaje getPersonajeByNombre(String nombrePersonaje) throws SQLException {
        conectar();
        Personaje personaje = new Personaje();
        String select = "select * from personaje where nombre='" + nombrePersonaje + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            personaje.setIdpersonaje(rs.getInt("idPersonaje"));
            personaje.setNombre(rs.getString("nombre"));
            personaje.setNivel(rs.getInt("nivel"));
            personaje.setRaza(rasgosDAO.getRazaByName(rs.getString("raza")));
            personaje.setTipo(rasgosDAO.getTipoByName(rs.getString("tipo")));
            personaje.setUser(usuarioDAO.getUserByUsername(rs.getString("usuario")));

        } else {
            personaje = null;
        }
        rs.close();
        st.close();
        desconectar();
        return personaje;
    }

    public void subirNivelPersonajeObjetos(Personaje personaje) throws SQLException {
        conectar();
        Statement st = conexion.createStatement();
        String update = "update personaje set nivel=" + personaje.getNivel();
        st.executeUpdate(update);
        st.close();
        desconectar();
    }

    public List<ObjetoPersonaje> getListAllObjetos(Personaje personaje) throws SQLException {
        conectar();
        String query = "select * from objeto inner join objetopersonaje on objeto.idobjeto = objetopersonaje.idobjeto inner join personaje on objetopersonaje.idpersonaje = personaje.idpersonaje where personaje.nombre='" + personaje.getNombre() + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<ObjetoPersonaje> objetosPersonaje = new ArrayList<>();
        ObjetoPersonaje objetoPersonaje = new ObjetoPersonaje();
        Categoria categoria = new Categoria();
        Objeto objeto = new Objeto();
        while (rs.next()) {
            objeto.setIdobjeto(rs.getInt("objeto.idObjeto"));
            objeto.setNombre(rs.getString("objeto.nombre"));
            categoria = rasgosDAO.getCategoriaByName(rs.getString("objeto.categoria"));
            objeto.setCategoria(categoria);
            objeto.setDescripcion(rs.getString("objeto.descripcion"));
            objeto.setNivel(rs.getInt("objeto.nivel"));
            objetoPersonaje.setPersonaje(personaje);
            objetoPersonaje.setObjeto(objeto);
            objetosPersonaje.add(objetoPersonaje);
        }
        rs.close();
        st.close();
        desconectar();
        return objetosPersonaje;
    }

    public List<Personaje> getListAllPersonajes() throws SQLException {
        conectar();
        String query = "select * from personaje";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Personaje> personajes = new ArrayList<>();
        while (rs.next()) {
            Personaje pers = new Personaje();
            pers.setIdpersonaje(rs.getInt("idPersonaje"));
            pers.setNombre(rs.getString("nombre"));
            pers.setNivel(rs.getInt("nivel"));
            pers.setRaza(rasgosDAO.getRazaByName(rs.getString("raza")));
            pers.setTipo(rasgosDAO.getTipoByName(rs.getString("tipo")));
            pers.setUser(usuarioDAO.getUserByUsername(rs.getString("usuario")));
            personajes.add(pers);
        }
        rs.close();
        st.close();
        desconectar();
        return personajes;
    }

    public List<Personaje> getListAllPersonajesPorUsuario(User user) throws SQLException {
        conectar();
        String query = "select * from personaje where usuario = '" + user.getNombre() + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Personaje> personajes = new ArrayList<>();
        while (rs.next()) {
            Personaje pers = new Personaje();
            pers.setIdpersonaje(rs.getInt("idPersonaje"));
            pers.setNombre(rs.getString("nombre"));
            pers.setNivel(rs.getInt("nivel"));
            pers.setRaza(rasgosDAO.getRazaByName(rs.getString("raza")));
            pers.setTipo(rasgosDAO.getTipoByName(rs.getString("tipo")));
            pers.setUser(usuarioDAO.getUserByUsername(rs.getString("usuario")));
            personajes.add(pers);
        }
        rs.close();
        st.close();
        desconectar();
        return personajes;
    }

    //RANKING PERSONAJES POR USUARIO
    public List<Personaje> rankingPersonajesNivelPorUsuario(User user) throws SQLException {
        conectar();
        String query = "select * from personaje where usuario = '" + user.getNombre() + "' order by nivel desc";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Personaje> personajes = new ArrayList<>();
        while (rs.next()) {
            Personaje pers = new Personaje();
            pers.setIdpersonaje(rs.getInt("idPersonaje"));
            pers.setNombre(rs.getString("nombre"));
            pers.setNivel(rs.getInt("nivel"));
            pers.setRaza(rasgosDAO.getRazaByName(rs.getString("raza")));
            pers.setTipo(rasgosDAO.getTipoByName(rs.getString("tipo")));
            pers.setUser(usuarioDAO.getUserByUsername(rs.getString("usuario")));
            personajes.add(pers);
        }
        rs.close();
        st.close();
        desconectar();
        return personajes;
    }

    //RANKING PERSONAJES
    public List<Personaje> rankingPersonajesNivel() throws SQLException {
        conectar();
        String query = "select * from personaje order by nivel desc";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Personaje> personajes = new ArrayList<>();
        while (rs.next()) {
            Personaje pers = new Personaje();
            pers.setIdpersonaje(rs.getInt("idPersonaje"));
            pers.setNombre(rs.getString("nombre"));
            pers.setNivel(rs.getInt("nivel"));
            pers.setRaza(rasgosDAO.getRazaByName(rs.getString("raza")));
            pers.setTipo(rasgosDAO.getTipoByName(rs.getString("tipo")));
            pers.setUser(usuarioDAO.getUserByUsername(rs.getString("usuario")));
            personajes.add(pers);
        }
        rs.close();
        st.close();
        desconectar();
        return personajes;
    }

    //FUNCIONES AUXILIARES
    public int getLastID() throws SQLException {
        conectar();
        String query = "select * from personaje";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        int lastID = 0;
        while (rs.next()) {
            lastID = rs.getInt("idPersonaje");
        }
        rs.close();
        st.close();
        desconectar();
        return lastID + 1;
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
