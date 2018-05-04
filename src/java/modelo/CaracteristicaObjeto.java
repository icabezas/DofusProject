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
public class CaracteristicaObjeto {
    private Caracteristica caracteristica;
    private Objeto objeto;

    public CaracteristicaObjeto(Caracteristica caracteristica, Objeto objeto) {
        this.caracteristica = caracteristica;
        this.objeto = objeto;
    }

    public Caracteristica getCaracteristica() {
        return caracteristica;
    }

    public void setCaracteristica(Caracteristica caracteristica) {
        this.caracteristica = caracteristica;
    }

    public Objeto getObjeto() {
        return objeto;
    }

    public void setObjeto(Objeto objeto) {
        this.objeto = objeto;
    }

}