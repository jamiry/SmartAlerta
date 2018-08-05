/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.controle;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.maisamo.smartalerta.consumo.recursos.HttpExemplo;
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
import com.maisamo.smartalerta.modelo.entidade.AlertaNovo;
import com.maisamo.smartalerta.modelo.entidade.Usuario;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * 
 */
@WebServlet(name = "VerAlertas", urlPatterns = {"/VerAlertas"})
public class VerAlertas extends HttpServlet {

    private HttpSession sessao = null;
    private final AlertaFacede af = new AlertaFacede();
 private final String USER_AGENT = "Mozilla/5.0";
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
            out.println("<title>Servlet VerAlertas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerAlertas at " + request.getContextPath() + "</h1>");
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
     /*   HttpExemplo http = new HttpExemplo();
        String chamadaWs;
        chamadaWs = "http://138.68.150.56/apipds/api/notificacao/alertas";
        try { 
            String json = http.sendGet(chamadaWs);
            Gson g = new Gson();
            g = g.fromJson(json, new TypeToken<List<Alerta>>() {}.getType());
        } catch (Exception ex) {
            Logger.getLogger(VerAlertas.class.getName()).log(Level.SEVERE, null, ex);
        }*/
        
        
        
         /*  Gson g = new Gson();*/
           /* Usuario u = new Usuario();
            u = g.fromJson(json, new TypeToken<List<Usuario>>() {}.getType());*/

        
        try {
               // HttpExemplo http = new HttpExemplo();
                //AlertaNovo a = new AlertaNovo();
                String chamadaWs;
                chamadaWs = "http://138.68.150.56/apipds/api/notificacao/alertas";
               // String json = http.sendGet(chamadaWs); 
                String resp = sendGet(chamadaWs);
                System.out.println(resp);
                Gson gson = new Gson();
                //Type ListType = new TypeToken<List<String>>() {}.getType();
                Type listType = new TypeToken<List<AlertaNovo>>() {}.getType();
                List<AlertaNovo> alerta_list = gson.fromJson(resp, listType);
               
                    System.out.println(alerta_list);
                
                Usuario usuario = (Usuario) sessao.getAttribute("usuario");
               sessao.setAttribute("alertas", af.listar(usuario)); 
               //sessao.setAttribute("alertas", alerta_list); 
                
                
        } catch (Exception ex) {
            Logger.getLogger(VerAlertas.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String aid = request.getParameter("aid");
        if (aid != null) {
            Alerta alerta = af.procurarPorId(Long.parseLong(aid));
            if (request.getParameter("edt") != null) {
                request.setAttribute("editar_alerta", alerta);
                request.setAttribute("editar", true); // mostrar modal de edição
            } else {
                sessao.setAttribute("excluir_alerta", alerta);
                request.setAttribute("excluir", true); // mostrar modal de exclusão
            }
        } else if (request.getParameter("del") != null) {
            Alerta excluir_alerta = (Alerta) sessao.getAttribute("excluir_alerta");
            af.excluir(excluir_alerta);
            request.setAttribute("excluido", true); // mostrar modal de excluído
        }
        request.getServletContext().getRequestDispatcher("/visualizar_alertas.jsp").forward(request, response);
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
        
        Long id = Long.parseLong(request.getParameter("alertaId"));
        String categoria = request.getParameter("categoria");
        String titulo = request.getParameter("titulo");
        String mensagem = request.getParameter("mensagem");
        
        Alerta editar_alerta = new Alerta();
        editar_alerta.setId(id);
        editar_alerta.setCategoria(categoria);
        editar_alerta.setTitulo(titulo);
        editar_alerta.setMensagem(mensagem);
        
        af.atualizar(editar_alerta);
        
        request.setAttribute("atualizado", true); // mostrar modal de atualizado/editado
        request.getServletContext().getRequestDispatcher("/visualizar_alertas.jsp").forward(request, response);
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

    public String sendGet(String url) throws Exception {
 
		
 
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
 
		// optional default is GET
		con.setRequestMethod("GET");
 
		//add request header
		con.setRequestProperty("User-Agent", USER_AGENT);
 
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);
 
		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
 
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
 
		//print result
		return response.toString();
 
	}
}
