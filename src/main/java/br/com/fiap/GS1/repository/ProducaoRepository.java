package br.com.fiap.GS1.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.fiap.GS1.model.ProducaoModel;

@Repository
public interface ProducaoRepository extends JpaRepository<ProducaoModel, Long> {
	
}
