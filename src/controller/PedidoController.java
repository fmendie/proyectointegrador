/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techlogistics.backend.controller;

/**
 *
 * @author pipe7
 */
import com.techlogistics.backend.model.Pedido;
import com.techlogistics.backend.model.Cliente;
import com.techlogistics.backend.service.PedidoService;
import com.techlogistics.backend.repository.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pedidos")
@CrossOrigin(origins = "*")
public class PedidoController {

    @Autowired
    private PedidoService pedidoService;

    @Autowired
    private ClienteRepository clienteRepository;  // Asegúrate de tener este repositorio para buscar clientes

    @GetMapping
    public List<Pedido> listar() {
        return pedidoService.listar();
    }

    @PostMapping
    public Pedido crear(@RequestBody Pedido pedido) {
        // Buscar el cliente por su ID
        Cliente cliente = clienteRepository.findById(pedido.getCliente().getId())  // Usar getId()
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));

        // Establecer el cliente al pedido
        pedido.setCliente(cliente);

        // Guardar el pedido
        return pedidoService.guardar(pedido);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Pedido> obtener(@PathVariable Long id) {
        return pedidoService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public void eliminar(@PathVariable Long id) {
        pedidoService.eliminar(id);
    }
}