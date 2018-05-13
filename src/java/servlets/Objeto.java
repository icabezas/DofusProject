/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.RasgosDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author THOR
 */
public class Objeto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String objtName = request.getParameter("objetoBorrar");
        String caracteristicaName = request.getParameter("caracteristicaObjeto");
        daos.ObjetoDAO objetoDAO = new daos.ObjetoDAO();
        daos.RasgosDAO rasgosDAO = new daos.RasgosDAO();
        String errorMessage = "";
        modelo.Objeto objeto = null;
        if ("ELIMINAR OBJETO".equals(request.getParameter("ELIMINAR OBJETO"))) {
            try {
                objeto = objetoDAO.getObjetoByNombre(objtName);
                objetoDAO.eliminarObjeto(objeto);
            } catch (Exception ex) {
                errorMessage = "Error al eliminar el usuario";
            }
            errorMessage = "Objeto " + objtName + " eliminado con éxito";
            request.setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/eliminarObjeto.jsp");
        }
        if ("CREAR OBJETO".equals(request.getParameter("CREAR OBJETO"))) {
            String nombreObjeto = request.getParameter("nombreObjeto");
            modelo.Caracteristica caracteristica = null;
            try {
                objeto = objetoDAO.getObjetoByNombre(nombreObjeto);
                caracteristica = rasgosDAO.getCaracteristicaByName(caracteristicaName);
                if (objeto == null) {
                    try {
                        String descripcion = request.getParameter("descripcion");
                        int nivel = Integer.parseInt(request.getParameter("nivel"));
                        String categoria = request.getParameter("categoria");
                        modelo.Categoria categoriaObjeto = rasgosDAO.getCategoriaByName(categoria);
                        objeto = new modelo.Objeto();
                        objeto.setNombre(nombreObjeto);
                        objeto.setDescripcion(descripcion);
                        objeto.setNivel(nivel);
                        objeto.setCategoria(categoriaObjeto);
                        
                        objetoDAO.crearObjeto(objeto);
                        objetoDAO.crearObjetoCaracteristica(caracteristica);
                    } catch (Exception ex) {
                        System.out.println("ERRORRR" + ex.getMessage());
                        errorMessage = "Error al crear el objeto";
                    }
                    errorMessage = "Objeto  " + nombreObjeto + " creado con éxito";
                }
            } catch (Exception ex) {
            }

            request.setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/crearObjeto.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
