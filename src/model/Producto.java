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
@Table(name = "Productos")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_producto;

    private String nombre;
    private String descripcion;
    private double precio;

    @OneToMany(mappedBy = "producto", cascade = CascadeType.ALL)
    private List<PedidoProducto> pedidos;

    // Getters y Setters
}