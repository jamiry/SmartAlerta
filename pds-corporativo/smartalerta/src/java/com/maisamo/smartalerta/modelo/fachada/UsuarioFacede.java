/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.fachada;

import java.util.List;

import com.maisamo.smartalerta.modelo.dao.UsuarioDAO;
import com.maisamo.smartalerta.modelo.entidade.Usuario;


public class UsuarioFacede {
	private final UsuarioDAO udao = new UsuarioDAO();
	
	public boolean inserir(Usuario usuario) {
		return udao.inserir(usuario);
	}
	public boolean atualizar(Usuario usuario) {
		return udao.atualizar(usuario);
	}
	public boolean excluir(Usuario usuario) {
		return udao.excluir(usuario);
	}
	public List<Usuario> listar() {
		return udao.listar();
	}
	public boolean procurar(String valor, String coluna) {
		return udao.procurar(valor, coluna);
	}
	public Usuario autenticar(String login, String senha) {
		return udao.autenticar(login, senha);
	}
}
