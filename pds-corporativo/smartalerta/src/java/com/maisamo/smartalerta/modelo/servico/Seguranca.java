/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.servico;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.io.UnsupportedEncodingException;

/**
 *
 * 
 */
public class Seguranca {

    public static String paraMD5(String mensagem) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(mensagem.getBytes(), 0, mensagem.length());
            return new BigInteger(1, md.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
        }
        return null;
    }
    
    public static String paraB64(String mensagem) {
        String b64encoded = null;
        try {
            b64encoded = Base64.getUrlEncoder().encodeToString(mensagem.getBytes("utf-8"));
        } catch (UnsupportedEncodingException ex) {
            ex.getStackTrace();
        }
        return b64encoded;
    }
        
    public static String deB64(String b64encoded) {
        String decoded = null;
        try {
            byte[] b64decoded = Base64.getUrlDecoder().decode(b64encoded);
            decoded = new String(b64decoded, "utf-8");
        } catch (UnsupportedEncodingException ex) {
            ex.getStackTrace();
        }
        return decoded;
    }
}
