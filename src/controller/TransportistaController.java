/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techlogistics.backend.controller;

/**
 *
 * @author pipe7
 */
import com.techlogistics.backend.model.Transportista;
import com.techlogistics.backend.service.TransportistaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/transportistas")
@CrossOrigin(origins = "*")
public class TransportistaController {

    @Autowired
    private TransportistaService transportistaService;

    @GetMapping
    public List<Transportista> listar() {
        return transportistaService.listar();
    }

    @PostMapping
    public Transportista crear(@RequestBody Transportista transportista) {
        return transportistaService.guardar(transportista);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Transportista> obtener(@PathVariable Long id) {
        return transportistaService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public void eliminar(@PathVariable Long id) {
        transportistaService.eliminar(id);
    }
}