package br.com.fiap.GS1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.fiap.GS1.model.ConsumoModel;

@Repository
public interface ConsumoRepository extends JpaRepository<ConsumoModel, Long>{

}
