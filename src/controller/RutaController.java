/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techlogistics.backend.controller;

/**
 *
 * @author pipe7
 */
import com.techlogistics.backend.model.Ruta;
import com.techlogistics.backend.service.RutaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/rutas")
@CrossOrigin(origins = "*")
public class RutaController {

    @Autowired
    private RutaService rutaService;

    @GetMapping
    public List<Ruta> listar() {
        return rutaService.listar();
    }

    @PostMapping
    public Ruta crear(@RequestBody Ruta ruta) {
        return rutaService.guardar(ruta);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Ruta> obtener(@PathVariable Long id) {
        return rutaService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public void eliminar(@PathVariable Long id) {
        rutaService.eliminar(id);
    }
}
