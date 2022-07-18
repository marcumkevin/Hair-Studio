package org.example.hairstudio.repository;

import org.example.hairstudio.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientRepository extends JpaRepository<Client, Integer> {
}