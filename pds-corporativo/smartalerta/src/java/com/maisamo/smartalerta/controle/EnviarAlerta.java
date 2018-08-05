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

import java.time.LocalDateTime;

import com.maisamo.smartalerta.modelo.servico.Seguranca;
import com.maisamo.smartalerta.modelo.fachada.AlertaFacede;
import com.maisamo.smartalerta.modelo.fachada.ContatoFacede;
import com.maisamo.smartalerta.modelo.fachada.PaginaFacede;
import com.maisamo.smartalerta.modelo.fachada.EnvioAlertaFacede;
import com.maisamo.smartalerta.modelo.fachada.EnvioAlertaContatoFacede;
import com.maisamo.smartalerta.modelo.entidade.Usuario;
import com.maisamo.smartalerta.modelo.entidade.Alerta;
import com.maisamo.smartalerta.modelo.entidade.Contato;
import com.maisamo.smartalerta.modelo.entidade.Pagina;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlerta;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlertaContato;

import com.maisamo.smartalerta.modelo.servico.Enviador;

/**
 *
 * 
 */
@WebServlet(name = "EnviarAlerta", urlPatterns = {"/EnviarAlerta"})
public class EnviarAlerta extends HttpServlet {

    private HttpSession sessao = null;
    private final AlertaFacede af = new AlertaFacede();
    private final ContatoFacede cf = new ContatoFacede();
    private final EnvioAlertaFacede eaf = new EnvioAlertaFacede();
    private final EnvioAlertaContatoFacede eacf = new EnvioAlertaContatoFacede();
    private final PaginaFacede pf = new PaginaFacede();
    
    private Pagina pag = null;
    private Enviador env = null;
    
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
            out.println("<title>Servlet EnviarAlerta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnviarAlerta at " + request.getContextPath() + "</h1>");
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
        sessao.setAttribute("contatos", cf.listar(u));
        sessao.setAttribute("categorias", af.listarCategorias(u));
        
        String sel_categoria = request.getParameter("sel_categoria");
        if (sel_categoria != null) {
            request.setAttribute("sel_categoria", sel_categoria);
            request.setAttribute("titulos", af.listarTitulosPorCategoria(sel_categoria));
        }
        request.getServletContext().getRequestDispatcher("/enviar_alerta.jsp").forward(request, response);
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
        String url;
        
        Usuario u = (Usuario) sessao.getAttribute("usuario");
        String[] enviarParaId = request.getParameterValues("enviarPara");
        Alerta a = af.procurarPorTitulo(request.getParameter("sel_titulo"), u);
        
        if (enviarParaId == null) {    
            valido = false;
        } else {
            System.out.println(enviarParaId.length);
            
            EnvioAlerta ea = new EnvioAlerta(a);
            ea.setDataHoraEnvio(LocalDateTime.now());
            eaf.inserir(ea);
            ea = eaf.procurarRecente(a);
            
            env = new Enviador(u, a);
            
            for (String id: enviarParaId) {
                //Recupera um contato
                Contato c = cf.procurarPorId(Long.parseLong(id));

                //Registro de contatos que receberam este alerta 
                EnvioAlertaContato eac = new EnvioAlertaContato(c, ea);
                eacf.inserir(eac);

                //Cria uma página por contato
                pag = new Pagina(a, u, c);
                pf.inserir(pag);
                pag = pf.procurarRecente(a, u, c);

                //Para quem?
                env.setContato(c);

                //Link para acessar a página
                String token = Seguranca.paraB64(pag.getId().toString());
                url = request.getServerName() + ":" + request.getServerPort() + pag.getUrl() + token;
                env.setUrl(url);

                //Envia o email
                env.enviarEmail();
            }
        }
        
        request.setAttribute("valido", valido);
        request.getServletContext().getRequestDispatcher("/enviar_alerta.jsp").forward(request, response);
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
