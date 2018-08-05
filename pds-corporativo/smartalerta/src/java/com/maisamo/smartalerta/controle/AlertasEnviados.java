/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.maisamo.smartalerta.modelo.fachada.EnvioAlertaFacede;
import com.maisamo.smartalerta.modelo.fachada.EnvioAlertaContatoFacede;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlerta;
import com.maisamo.smartalerta.modelo.entidade.Usuario;

/**
 *
 * 
 */
@WebServlet(name = "AlertasEnviados", urlPatterns = {"/AlertasEnviados"})
public class AlertasEnviados extends HttpServlet {
    
    private HttpSession sessao = null;
    private final EnvioAlertaFacede eaf = new EnvioAlertaFacede();
    private final EnvioAlertaContatoFacede eacf = new EnvioAlertaContatoFacede();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlertasEnviados</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AlertasEnviados at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        verificarSessao(request, response);
        
        Usuario u = (Usuario) sessao.getAttribute("usuario");
        sessao.setAttribute("alertas_enviados", eaf.listar(u));
        
        String eaid = request.getParameter("eaid");
        if (eaid != null) {
            EnvioAlerta ea = eaf.procurarPorId(Long.parseLong(eaid));
            
            request.setAttribute("contatos_por_envio", eacf.listar(ea));
            request.getServletContext().getRequestDispatcher("/contatos_por_envio.jsp").forward(request, response);
        } else {
            response.sendRedirect("alertas_enviados.jsp");
        }
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
        verificarSessao(request, response);
    }
    
    private void verificarSessao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sessao = request.getSession(false);
        if (sessao == null) {
            response.sendRedirect("acesso_negado.jsp");
        }
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
