/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.ObjetoDAO;
import daos.RasgosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Caracteristica;
import modelo.Categoria;
import modelo.Raza;

/**
 *
 * @author THOR
 */
public class Rasgos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RasgosDAO rasgosDAO = new RasgosDAO();
        ObjetoDAO objetoDAO = new ObjetoDAO();
        String errorMessage = "";

        //CATEGORIA
        String nombreCategoria = request.getParameter("nombreCategoria");
        if ("CREAR CATEGORIA".equals(request.getParameter("CREAR CATEGORIA"))) {
            try {
                Categoria categoria = new Categoria();
                categoria.setNombre(nombreCategoria);
                rasgosDAO.crearCategoria(categoria);
            } catch (Exception ex) {
                errorMessage = "Error al crear la categoria";
            }
            errorMessage = "Categoria  " + nombreCategoria + " creada con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/crearCategoria.jsp");
        }
        if ("ELIMINAR CATEGORIA".equals(request.getParameter("ELIMINAR CATEGORIA"))) {
            try {
                rasgosDAO.eliminarCategoria(nombreCategoria);
            } catch (Exception ex) {
                errorMessage = "No se puede eliminar la categoria si está asignada a un objeto. Borra primero el objeto.";
            }
            errorMessage = "Categoria " + nombreCategoria + " eliminada con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/eliminarCategoria.jsp");
        }

        //RAZA
        String nombreRaza = request.getParameter("nombreRaza");
        if ("CREAR RAZA".equals(request.getParameter("CREAR RAZA"))) {
            try {
                Raza raza = new Raza();
                raza.setNombre(nombreRaza);
                rasgosDAO.crearRaza(raza);
            } catch (Exception ex) {
                errorMessage = "Error al crear la raza";
            }
            errorMessage = "Raza  " + nombreRaza + " creada con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/crearRaza.jsp");
        }
        if ("ELIMINAR RAZA".equals(request.getParameter("ELIMINAR RAZA"))) {
            try {
                rasgosDAO.eliminarRaza(nombreRaza);
            } catch (Exception ex) {
                errorMessage = "Error al eliminar la raza";
            }
            errorMessage = "Raza " + nombreRaza + " eliminada con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/eliminarRaza.jsp");
        }

        //TIPO
        String nombreTipo = request.getParameter("nombreTipo");
        if ("CREAR TIPO".equals(request.getParameter("CREAR TIPO"))) {
            try {
                modelo.Tipo tipo = new modelo.Tipo();
                tipo.setNombre(nombreTipo);
                rasgosDAO.crearTipo(tipo);
            } catch (Exception ex) {
                errorMessage = "Error al crear la raza";
            }
            errorMessage = "Raza  " + nombreRaza + " creada con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/crearTipo.jsp");
        }
        if ("ELIMINAR TIPO".equals(request.getParameter("ELIMINAR TIPO"))) {
            try {
                rasgosDAO.eliminarTipo(nombreTipo);
            } catch (Exception ex) {
                errorMessage = "Error al eliminar el tipo";
            }
            errorMessage = "Tipo " + nombreTipo + " eliminado con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/eliminarTipo.jsp");
        }

        //CARACTERISTICA
        String nombreCaracteristica = request.getParameter("nombreCaracteristica");
        if ("CREAR CARACTERISTICA".equals(request.getParameter("CREAR CARACTERISTICA"))) {
            try {
                modelo.Caracteristica caracteristica = new modelo.Caracteristica();
                caracteristica.setNombre(nombreCaracteristica);
                boolean isPrimaria = false;
                if (request.getParameter("isPrimaria") != null) {
                    if (request.getParameter("isPrimaria").toLowerCase().equals("on")) {
                        isPrimaria = true;
                    }
                }
                caracteristica.setIsPrimaria(isPrimaria);
                caracteristica.setValor(Integer.parseInt(request.getParameter("valorCaracteristica")));
                rasgosDAO.crearCaracteristica(caracteristica);
            } catch (Exception ex) {
                errorMessage = "Error al crear la caracteristica";
            }
            errorMessage = "Caracteristica  " + nombreCaracteristica + " creada con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/crearCaracteristica.jsp");
        }
        if ("ELIMINAR CARACTERISTICA".equals(request.getParameter("ELIMINAR CARACTERISTICA"))) {
            try {
                Caracteristica caracteristica = rasgosDAO.getCaracteristicaByName(nombreCaracteristica);
                rasgosDAO.eliminarCaracteristica(caracteristica);
                rasgosDAO.eliminarCaracteristicaObjeto(caracteristica);
            } catch (Exception ex) {
                errorMessage = "Error al eliminar la caracteristica";
            }
            errorMessage = "Caracteristica " + nombreCaracteristica + " eliminada con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/eliminarCaracteristica.jsp");
        }
        if ("ANYADIR CARACTERISTICA".equals(request.getParameter("ANYADIR CARACTERISTICA"))) {
            try {
                modelo.Caracteristica caracteristica = rasgosDAO.getCaracteristicaByName(nombreCaracteristica);
                String nombreObjeto = request.getParameter("nombreObjeto");
                modelo.Objeto objeto = objetoDAO.getObjetoByNombre(nombreObjeto);
                objetoDAO.anyadirObjetoCaracteristica(objeto, caracteristica);
            } catch (Exception ex) {
                errorMessage = "Error al anyadir la caracteristica";
            }
            errorMessage = "Caracteristica  " + nombreCaracteristica + " anyadida con éxito";
            request.getSession(true).setAttribute("status", errorMessage);
            response.sendRedirect(request.getContextPath() + "/anyadirCaracteristicaObjeto.jsp");
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
