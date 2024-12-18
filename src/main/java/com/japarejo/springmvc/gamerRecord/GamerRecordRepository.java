package com.japarejo.springmvc.gamerRecord;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.japarejo.springmvc.asalto.Asalto;
import com.japarejo.springmvc.gamer.Gamer;



@Repository
public interface GamerRecordRepository extends CrudRepository<GamerRecord, Integer> {
    List<GamerRecord> findAll();
    @Query ("SELECT g from GamerRecord g WHERE g.asalto = ?1")
    List<GamerRecord> findByAsalto(Asalto asalto);
    @Query ("SELECT g from GamerRecord g WHERE g.asalto = ?1 OR g.asalto = ?2 OR g.asalto = ?3 ORDER BY g.beneficioObtenido DESC")
    List<GamerRecord> orderGanancia(Asalto asalto1, Asalto asalto2, Asalto asalto3);
    @Query ("SELECT COUNT(g) from GamerRecord g WHERE g.gamer = ?1")
    Integer contarAsaltos(Gamer gamer);
}
