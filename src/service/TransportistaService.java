/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techlogistics.backend.service;

/**
 *
 * @author pipe7
 */
import com.techlogistics.backend.model.Transportista;
import com.techlogistics.backend.repository.TransportistaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TransportistaService {

    @Autowired
    private TransportistaRepository transportistaRepository;

    public List<Transportista> listar() {
        return transportistaRepository.findAll();
    }

    public Transportista guardar(Transportista transportista) {
        return transportistaRepository.save(transportista);
    }

    public Optional<Transportista> obtenerPorId(Long id) {
        return transportistaRepository.findById(id);
    }

    public void eliminar(Long id) {
        transportistaRepository.deleteById(id);
    }
}
