package br.com.fiap.GS1.repository.criteria.impl;

import br.com.fiap.GS1.model.ProducaoModel;
import br.com.fiap.GS1.repository.criteria.ProducaoCriteria;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.data.jpa.provider.HibernateUtils;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProducaoCriteriaImpl implements ProducaoCriteria {

    private EntityManager entityManager;

    public ProducaoCriteriaImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<ProducaoModel> listarPorAno(Integer ano) {

        CriteriaBuilder criteriaBuilder = this.entityManager.getCriteriaBuilder();


        CriteriaQuery<ProducaoModel> cr = criteriaBuilder.createQuery(ProducaoModel.class);
        Root<ProducaoModel> root = cr.from(ProducaoModel.class);
        cr.select(root).where(criteriaBuilder.gt(root.get("ano"), ano));

        TypedQuery query =  this.entityManager.createQuery(cr);
        List<ProducaoModel> results = query.getResultList();

        return results;
    }
}
