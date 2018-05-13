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
import modelo.Categoria;

/**
 *
 * @author THOR
 */
public class RasgosDAO {
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
