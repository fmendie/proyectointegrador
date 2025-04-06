/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techlogistics.backend.model;

/**
 *
 * @author pipe7
 */
import jakarta.persistence.*;

@Entity
@Table(name = "Rutas")
public class Ruta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_ruta;

    private String origen;
    private String destino;
    private double distancia;
    private double tiempoEstimado;

    @ManyToOne
    @JoinColumn(name = "id_transportista")
    private Transportista transportista;

    // Getters y Setters
}
