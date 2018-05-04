/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author alu2016164
 */
public class Personaje {
    private int idpersonaje;
    private String nombre;
    private int nivel;
    private Raza raza;
    private Tipo tipo;
    private User user;

    public Personaje(int idpersonaje, String nombre, int nivel, Raza raza, Tipo tipo, User user) {
        this.idpersonaje = idpersonaje;
        this.nombre = nombre;
        this.nivel = nivel;
        this.raza = raza;
        this.tipo = tipo;
        this.user = user;
    }

    public int getIdpersonaje() {
        return idpersonaje;
    }

    public void setIdpersonaje(int idpersonaje) {
        this.idpersonaje = idpersonaje;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public Raza getRaza() {
        return raza;
    }

    public void setRaza(Raza raza) {
        this.raza = raza;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    
}
