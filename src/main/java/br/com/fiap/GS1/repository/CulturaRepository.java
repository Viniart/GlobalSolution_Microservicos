package br.com.fiap.GS1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.fiap.GS1.model.CulturaModel;

@Repository
public interface CulturaRepository extends JpaRepository<CulturaModel, Long>{

}
