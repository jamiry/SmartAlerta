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

import com.maisamo.smartalerta.modelo.fachada.AlertaFacede;
import com.maisamo.smartalerta.modelo.entidade.Alerta;
import com.maisamo.smartalerta.modelo.entidade.Usuario;

/**
 *
 * 
 */
@WebServlet(name = "CadastrarAlerta", urlPatterns = {"/CadastrarAlerta"})
public class CadastrarAlerta extends HttpServlet {

    private HttpSession sessao = null;
    private final AlertaFacede af = new AlertaFacede();

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
            out.println("<title>Servlet CadastrarAlerta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CadastrarAlerta at " + request.getContextPath() + "</h1>");
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

        boolean valido = true;
        
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        String mensagem = request.getParameter("mensagem");
        
        Usuario u = (Usuario) sessao.getAttribute("usuario");
        
        if (af.procurar(titulo, "titulo", u)) {
            valido = false;
        } else {
            Alerta a = new Alerta(u);
            a.setTitulo(titulo);
            a.setCategoria(categoria);
            a.setMensagem(mensagem);
            af.inserir(a);
        }
        request.setAttribute("valido", valido);
        request.getServletContext().getRequestDispatcher("/cadastrar_alerta.jsp").forward(request, response);
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
