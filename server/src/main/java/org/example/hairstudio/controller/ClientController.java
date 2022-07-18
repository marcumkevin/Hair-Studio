package org.example.hairstudio.controller;

import org.example.hairstudio.repository.ClientRepository;
import org.example.hairstudio.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private ClientRepository clientRepository;

    @GetMapping
    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }

    @PostMapping
    public Client createClient(@RequestBody Client client) {
        return clientRepository.save(client);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Client> updateClient(@PathVariable("id") Integer clientId, @Valid @RequestBody Client clientDetails) {
        Client client = clientRepository.findById(clientId).orElseThrow();

        client.setFirstName(clientDetails.getFirstName());
        client.setLastName(clientDetails.getLastName());
        client.setAddress(clientDetails.getAddress());
        client.setAddress2(clientDetails.getAddress2());
        client.setEmail(clientDetails.getEmail());

        final Client updatedClient = clientRepository.save(client);
        return ResponseEntity.ok(updatedClient);
    }
}
