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
public class ObjetoPersonaje {
    private Personaje personaje;
    private Objeto objeto;

    public ObjetoPersonaje(Personaje personaje, Objeto objeto) {
        this.personaje = personaje;
        this.objeto = objeto;
    }

    public Personaje getPersonaje() {
        return personaje;
    }

    public void setPersonaje(Personaje personaje) {
        this.personaje = personaje;
    }

    public Objeto getObjeto() {
        return objeto;
    }

    public void setObjeto(Objeto objeto) {
        this.objeto = objeto;
    }
    
    
}
