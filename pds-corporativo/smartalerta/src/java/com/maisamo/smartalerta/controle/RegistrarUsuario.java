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

import com.maisamo.smartalerta.modelo.fachada.UsuarioFacede;
import com.maisamo.smartalerta.modelo.entidade.Usuario;

/**
 *
 * 
 */
@WebServlet(name = "RegistrarUsuario", urlPatterns = {"/RegistrarUsuario"})
public class RegistrarUsuario extends HttpServlet {

    private UsuarioFacede uf = new UsuarioFacede();

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
            out.println("<title>Servlet RegistrarUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarUsuario at " + request.getContextPath() + "</h1>");
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
        boolean nome_valido = true;
        boolean login_valido = true;
        boolean email_valido = true;

        String nome = request.getParameter("registroNome");
        String email = request.getParameter("registroEmail");
        String login = request.getParameter("registroUsuario");
        String senha = request.getParameter("registroSenha");

        if (uf.procurar(nome, "nome")) {
            nome_valido = false;
        }
        if (uf.procurar(login, "login")) {
            login_valido = false;
        }
        if (uf.procurar(email, "email")) {
            email_valido = false;
        }

        if (nome_valido && login_valido && email_valido) {
            Usuario u = new Usuario();
            u.setNome(nome);
            u.setLogin(login);
            u.setSenha(senha);
            u.setEmail(email);

            uf.inserir(u);
        }
        request.setAttribute("nome_valido", nome_valido);
        request.setAttribute("login_valido", login_valido);
        request.setAttribute("email_valido", email_valido);
        request.getServletContext().getRequestDispatcher("/registro.jsp").forward(request, response);
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
