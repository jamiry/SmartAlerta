/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.servico;

import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.EmailException;

import com.maisamo.smartalerta.modelo.entidade.Usuario;
import com.maisamo.smartalerta.modelo.entidade.Contato;
import com.maisamo.smartalerta.modelo.entidade.Alerta;

/**
 *
 *
 */
public class Enviador {

    private HtmlEmail email;
    private final Usuario usuario;
    private Contato contato;
    private final Alerta alerta;
    private final String emailFrom, nomeFrom;
    private String emailTo, foneTo, nomeTo;
    private final String titulo, assunto;
    private String url;
    
    public Enviador(Usuario usuario, Alerta alerta) {
        this.usuario = usuario;
        emailFrom = usuario.getEmail();
        nomeFrom = usuario.getNome();
        this.alerta = alerta;
        titulo = alerta.getTitulo();
        assunto = alerta.getCategoria();
    }
    
    public void setContato(Contato contato) {
        this.contato = contato;
        nomeTo = contato.getNome().split(" ")[0];
        emailTo = contato.getEmail();
        foneTo = contato.getFone();
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    public void enviarEmail() {
        email = new HtmlEmail();
        try {
            email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
            email.setAuthentication("maisamoalerta@gmail.com", "maisAmo)%)#");
            email.addTo(emailTo); // destinatario
            email.setFrom(emailFrom, nomeFrom); // remetente
            email.setSubject(assunto + " - " + titulo); // assunto do e-mail
            
            /* conteudo do e-mail */
            email.setHtmlMsg("<html>"
                    + "     <head>"
                    + "         <meta charset=\"utf-8\">"
                    + "         <style>"
                    + "             h3{ margin-bottom: 25px }"
                    + "             h1{ text-align: center }"
                    + "             p, a{ font-size: 20px }"
                    + "             .body{"
                    + "                 width: 65%;"
                    + "                 margin: 1.5% 17.5% 1.5% 17.5%;"
                    + "			border: 1px solid #c3c3c3;"
                    + "			background-color: #F4F7FA;"
                    + "			text-align: justify;"
                    + "			line-height: 25px"
                    + "             }"
                    + "             .header {"
                    + "			margin-bottom: 5px;"
                    + "			padding: 20px"
                    + "             }"
                    + "             hr{ color: 0 }"
                    + "             h1{ text-align: center }"
                    + "             .msgBody{"
                    + "			margin-top: 5px;"
                    + "			text-align: center;"
                    + "                 border: 1px solid #c3c3c3;"
                    + "			padding: 15px;"
                    + "			margin: 20px"
                    + "             }"
                    + "             b{"
                    + "		        color: #C93756;"
                    + "			font-size: 22px"
                    + "             }"
                    + "         </style>"
                    + "         <meta charset=\"utf-8\"/>"
                    + "     </head>"
                    + "     <body>"
                    + "		<div class=\"body\">"
                    + "			<div class=\"header\">"
                    + "				<h1>Olá, " + nomeTo + ".</h1>"
                    + "				<hr>"
                    + "				<p>"
                    + "					Esta mensagem foi enviada por <b>" + nomeFrom + "</b> para avisá-lo de que você tem algo importante, sobre um(a) <b>" + assunto + "</b>, do(a) qual deve se lembrar."
                    + "				</p>"
                    + "			</div>"
                    + "			<div class=\"msgBody\">"
                    + "				<h1>" + titulo + "</h1>"
                    + "				<hr>"
                    + "				<p>Para mais detalhes, clique sobre o link a seguir.</p>"
                    + "                         <p><a href=\"http://" + url + "\">smal.rt/AuHk21</a></p>"
                    + "			</div>"
                    + "		</div>"
                    + "     </body>"
                    + "</html>");
            
            /* caso o e-mail não suporte mensagens no formato html */
            email.setTextMsg("Olá, " + nomeTo + ".\n"
                    + "Esta mensagem foi enviada por " + nomeFrom
                    + "para avisá-lo de que você tem algo importante sobre um(a) "
                    + assunto + " da qual deve se lembrar.\n"
                    + "\nPara mais detalhes, acesse o link a seguir.\n" + url);
            
            email.setSSLOnConnect(true);
            email.send(); // envia o e-mail
            System.out.println("E-mail enviado!");
        } catch (EmailException e) {
            System.out.println(e);
        }
    }
}
