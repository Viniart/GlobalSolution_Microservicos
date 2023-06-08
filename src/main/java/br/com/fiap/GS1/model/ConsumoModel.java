package br.com.fiap.GS1.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "TB_CONSUMO")
public class ConsumoModel {

	private long id;
	private long ano;
	private long quantidade;
	private CulturaModel cultura;

	public ConsumoModel() {
	}

	
	public ConsumoModel(long id, long ano, long quantidade) {
		super();
		this.id = id;
		this.ano = ano;
		this.quantidade = quantidade;
	}


	@Id
	@Column(name = "ID_CONSUMO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CONSUMO_SEQ")
	@SequenceGenerator(name = "CONSUMO_SEQ", sequenceName = "CONSUMO_SEQ", allocationSize = 1)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	@Column(name = "ANO")
	@NotNull(message = "Ano obrigatório")
	@Range(min = 1, max = 2023)
	public long getAno() {
		return ano;
	}

	public void setAno(long ano) {
		this.ano = ano;
	}

	@Column(name = "QUANTIDADE")
	@NotNull(message = "Quantidade obrigatória")
	public long getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(long quantidade) {
		this.quantidade = quantidade;
	}

	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_CULTURA", nullable = false)
	public CulturaModel getCultura() {
		return cultura;
	}

	public void setCultura(CulturaModel cultura) {
		this.cultura = cultura;
	}

}
