package com.japarejo.springmvc.apiKey;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KeyService {

    @Autowired
    private KeyRepository keyRepo;

    public apiKey keyByIp(String ip){
        return keyRepo.findByIp(ip).orElse(null);
    }

    public List<apiKey> findAll(){
        return keyRepo.findAll();
    }
    
    public void deleteById(Integer id) {
        keyRepo.deleteById(id); // Método que elimina la API Key del repositorio
    }

    @Transactional
    public void save(apiKey apiKey) {
        keyRepo.save(apiKey);
    }
}
