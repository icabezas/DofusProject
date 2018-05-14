/*
 * Esta clase contiene las funciones de gestion de Categoria, Raza, Tipo, Caracteristica
 *
 */
package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Caracteristica;
import modelo.Categoria;
import modelo.Raza;
import modelo.Tipo;

/**
 *
 * @author THOR
 */
public class RasgosDAO extends DbDAO {
    //DAO GENERAL PARA CATEGORIA, TIPO, RAZA, CARACTERISTICAS

    Connection conexion;

    //CATEGORIA
    public void crearCategoria(Categoria categoria) throws SQLException {
        conectar();
        String insert = "insert into categoria values (?);";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setString(1, categoria.getNombre().toUpperCase());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public void eliminarCategoria(String nombreCategoria) throws SQLException {
        conectar();
        String delete = "delete from categoria where nombre = '" + nombreCategoria + "'";
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.close();
        desconectar();
    }

    public Categoria getCategoriaByName(String categoriaNombre) throws SQLException {
        conectar();
        Categoria categoria = new Categoria();
        String select = "select * from categoria where nombre='" + categoriaNombre + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            categoria.setNombre(categoriaNombre);
        }
        rs.close();
        st.close();
        desconectar();
        return categoria;
    }

    public List<Categoria> getListAllCategorias() throws SQLException {
        conectar();
        String query = "select * from categoria";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Categoria> categorias = new ArrayList<>();
        while (rs.next()) {
            Categoria categoria = new Categoria();
            categoria.setNombre(rs.getString("nombre"));
            categorias.add(categoria);
        }
        rs.close();
        st.close();
        desconectar();
        return categorias;
    }

    //RAZA
    public void crearRaza(Raza raza) throws SQLException {
        conectar();
        String insert = "insert into raza values (?);";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setString(1, raza.getNombre().toUpperCase());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public void eliminarRaza(String nombreRaza) throws SQLException {
        conectar();
        String delete = "delete from raza where nombre = '" + nombreRaza + "'";
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.close();
        desconectar();
    }

    public Raza getRazaByName(String razaNombre) throws SQLException {
        conectar();
        Raza raza = new Raza();
        String select = "select * from raza where nombre='" + razaNombre + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            raza.setNombre(razaNombre);
        }
        rs.close();
        st.close();
        desconectar();
        return raza;
    }

    public List<Raza> getListAllRazas() throws SQLException {
        conectar();
        String query = "select * from raza";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Raza> razas = new ArrayList<>();
        while (rs.next()) {
            Raza raza = new Raza();
            raza.setNombre(rs.getString("nombre"));
            razas.add(raza);
        }
        rs.close();
        st.close();
        desconectar();
        return razas;
    }

    //TIPO
    public void crearTipo(Tipo tipo) throws SQLException {
        conectar();
        String insert = "insert into tipo values (?);";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setString(1, tipo.getNombre().toUpperCase());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public void eliminarTipo(String nombreTipo) throws SQLException {
        conectar();
        String delete = "delete from tipo where nombre = '" + nombreTipo + "'";
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.close();
        desconectar();
    }

    public Tipo getTipoByName(String tipoNombre) throws SQLException {
        conectar();
        Tipo tipo = new Tipo();
        String select = "select * from tipo where nombre='" + tipoNombre + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            tipo.setNombre(tipoNombre);
        }
        rs.close();
        st.close();
        desconectar();
        return tipo;
    }

    public List<Tipo> getListAllTipos() throws SQLException {
        conectar();
        String query = "select * from tipo";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Tipo> tipos = new ArrayList<>();
        while (rs.next()) {
            Tipo tipo = new Tipo();
            tipo.setNombre(rs.getString("nombre"));
            tipos.add(tipo);
        }
        rs.close();
        st.close();
        desconectar();
        return tipos;
    }

    //CARACTERISTICAS
    public void crearCaracteristica(Caracteristica caracteristica) throws SQLException {
        conectar();
        String insert = "insert into caracteristica values (?,?,?,?);";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setInt(1, getLastID());
        ps.setString(2, caracteristica.getNombre().toUpperCase());
        ps.setInt(3, caracteristica.getValor());
        ps.setBoolean(4, caracteristica.isIsPrimaria());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public void eliminarCaracteristica(Caracteristica caracteristica) throws SQLException {
        conectar();
        String delete = "delete from caracteristica where nombre = '" + caracteristica.getNombre() + "'";
        String delete2 = "delete from caracteristicaobjeto where idCaracteristica = " + caracteristica.getIdCaracteristica();
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.executeUpdate(delete2);
        st.close();
        desconectar();
    }

    public void eliminarCaracteristicaObjeto(Caracteristica caracteristica) throws SQLException {
        conectar();
        String delete = "delete from caracteristicaobjeto where idCaracteristica = " + caracteristica.getIdCaracteristica();
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.close();
        desconectar();
    }

    public Caracteristica getCaracteristicaByID(int idCaracteristica) throws SQLException {
        conectar();
        Caracteristica caracteristica = new Caracteristica();
        String select = "select * from caracteristica where idCaracteristica='" + idCaracteristica + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            caracteristica.setNombre(rs.getString("nombre"));
            caracteristica.setIdCaracteristica(idCaracteristica);
        }
        rs.close();
        st.close();
        desconectar();
        return caracteristica;
    }

    public Caracteristica getCaracteristicaByName(String caracteristicaNombre) throws SQLException {
        conectar();
        Caracteristica caracteristica = new Caracteristica();
        String select = "select * from caracteristica where nombre='" + caracteristicaNombre + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            caracteristica.setNombre(caracteristicaNombre);
            caracteristica.setIdCaracteristica(rs.getInt("idCaracteristica"));
        }
        rs.close();
        st.close();
        desconectar();
        return caracteristica;
    }

    public List<Caracteristica> getListAllCaracteristicas() throws SQLException {
        conectar();
        String query = "select * from caracteristica";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Caracteristica> caracteristicas = new ArrayList<>();
        while (rs.next()) {
            Caracteristica caracteristica = new Caracteristica();
            caracteristica.setNombre(rs.getString("nombre"));
            caracteristica.setIsPrimaria(rs.getBoolean("isPrimaria"));
            caracteristica.setValor(rs.getInt("valor"));
            caracteristica.setIdCaracteristica(rs.getInt("idCaracteristica"));
            caracteristicas.add(caracteristica);
        }
        rs.close();
        st.close();
        desconectar();
        return caracteristicas;
    }

    public int getLastID() throws SQLException {
        conectar();
        String query = "select * from caracteristica";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        int lastID = 0;
        while (rs.next()) {
            lastID = rs.getInt("idCaracteristica");
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
