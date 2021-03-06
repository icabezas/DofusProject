/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import modelo.Objeto;
import modelo.Personaje;

/**
 *
 * @author THOR
 */
public class ObjetoDAO extends DbDAO {

    Connection conexion;
    RasgosDAO rasgosDAO = new RasgosDAO();

    public void eliminarObjeto(Objeto objeto) throws SQLException {
        conectar();
        String delete = "delete from objeto where nombre = '" + objeto.getNombre() + "'";
        Statement st = conexion.createStatement();
        st.executeUpdate(delete);
        st.close();
        desconectar();
    }

    public void crearObjeto(Objeto obj) throws SQLException {
        conectar();
        String insert = "insert into objeto values (?,?,?,?,?);";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setInt(1, getLastID());
        ps.setString(2, obj.getNombre());
        ps.setInt(3, obj.getNivel());
        ps.setString(4, obj.getDescripcion());
        ps.setString(5, obj.getCategoria().getNombre());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public void crearObjetoCaracteristica(Caracteristica caracteristica) throws SQLException {
        conectar();
        String insert = "insert into caracteristicaobjeto values (?,?)";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setInt(1, caracteristica.getIdCaracteristica());
        ps.setInt(2, getLastID() - 1);
        ps.executeUpdate();
        ps.close();
        desconectar();
    }
    
    public void anyadirObjetoAPersonaje(Objeto objeto, Personaje personaje) throws SQLException{
        conectar();
        String insert ="insert into objetopersonaje values(?,?)";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setInt(1, objeto.getIdobjeto());
        ps.setInt(2, personaje.getIdpersonaje());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public void anyadirObjetoCaracteristica(Objeto objeto, Caracteristica caracteristica) throws SQLException {
        conectar();
        String insert = "insert into caracteristicaobjeto values (?,?)";
        PreparedStatement ps = conexion.prepareStatement(insert);
        ps.setInt(1, caracteristica.getIdCaracteristica());
        ps.setInt(2, objeto.getIdobjeto());
        ps.executeUpdate();
        ps.close();
        desconectar();
    }

    public Objeto getObjetoByNombre(String nombreObjeto) throws SQLException {
        conectar();
        Objeto objeto = new Objeto();
        String select = "select * from objeto where nombre='" + nombreObjeto + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        Categoria categoria = new Categoria();
        if (rs.next()) {
            objeto.setIdobjeto(rs.getInt("idObjeto"));
            objeto.setNombre(rs.getString("nombre"));
            categoria = rasgosDAO.getCategoriaByName(rs.getString("categoria"));
            objeto.setCategoria(categoria);
            objeto.setDescripcion(rs.getString("descripcion"));
            objeto.setNivel(rs.getInt("nivel"));
        } else {
            objeto = null;
        }
        rs.close();
        st.close();
        desconectar();
        return objeto;
    }

    public List<Objeto> getListAllObjetos() throws SQLException {
        conectar();
        String query = "select * from objeto";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Objeto> objetos = new ArrayList<>();
        Categoria categoria = new Categoria();
        while (rs.next()) {
            Objeto obj = new Objeto();
            obj.setIdobjeto(rs.getInt("idObjeto"));
            obj.setNombre(rs.getString("nombre"));
            categoria = rasgosDAO.getCategoriaByName(rs.getString("categoria"));
            obj.setCategoria(categoria);
            obj.setDescripcion(rs.getString("descripcion"));
            obj.setNivel(rs.getInt("nivel"));
            objetos.add(obj);
        }
        rs.close();
        st.close();
        desconectar();
        return objetos;
    }

    public List<Caracteristica> getCaracteristicasObjeto(Objeto obj) throws SQLException {
        conectar();
        RasgosDAO rasgosDAO = new RasgosDAO();
        String query = "select * from caracteristicaobjeto where idObjeto=" + obj.getIdobjeto();
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        List<Caracteristica> caracteristicas = new ArrayList<>();
        while (rs.next()) {
            Caracteristica caracteristica = rasgosDAO.getCaracteristicaByID(rs.getInt("idCaracteristica"));
            caracteristicas.add(caracteristica);
        }
        rs.close();
        st.close();
        desconectar();
        return caracteristicas;
    }

    //FUNCIONES AUXILIARES
    public int getLastID() throws SQLException {
        conectar();
        String query = "select * from objeto";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        int lastID = 0;
        while (rs.next()) {
            lastID = rs.getInt("idObjeto");
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
