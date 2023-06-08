package br.com.fiap.GS1.repository.criteria;

import br.com.fiap.GS1.model.ProducaoModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProducaoCriteria {

    List<ProducaoModel> listarPorAno(Integer ano);

}
