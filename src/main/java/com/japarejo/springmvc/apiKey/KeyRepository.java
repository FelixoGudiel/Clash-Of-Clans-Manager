package com.japarejo.springmvc.apiKey;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;





@Repository
public interface KeyRepository extends CrudRepository<apiKey, Integer> {
    List<apiKey> findAll();
@Query ("SELECT k from apiKey k WHERE k.ip = ?1")
    Optional<apiKey> findByIp(String ip);
}


