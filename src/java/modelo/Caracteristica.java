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
public class Caracteristica {
    private String nombre;
    private int valor;
    private boolean isPrimaria;
  

    public Caracteristica(String nombre, int valor, boolean isPrimaria) {
        this.nombre = nombre;
        this.valor = valor;
        this.isPrimaria = true;
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public boolean isIsPrimaria() {
        return isPrimaria;
    }

    public void setIsPrimaria(boolean isPrimaria) {
        this.isPrimaria = isPrimaria;
    }   
}
