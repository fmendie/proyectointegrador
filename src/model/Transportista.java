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
import java.util.List;

@Entity
@Table(name = "Transportistas")
public class Transportista {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_transportista;

    private String nombre;
    private String telefono;
    private String email;

    @OneToMany(mappedBy = "transportista")
    private List<Ruta> rutas;

    // Getters y Setters
}
