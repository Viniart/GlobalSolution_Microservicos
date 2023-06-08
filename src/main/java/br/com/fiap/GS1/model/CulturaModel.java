package br.com.fiap.GS1.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "TB_CULTURA")
public class CulturaModel {

	private long idCultura;
	private String nomeCultura;
	private String tipo;
	private List<ProducaoModel> producoes;
	private List<ConsumoModel> consumos;

	public CulturaModel() {
	}

	public CulturaModel(long idCultura, String nomeCultura, String tipo) {
		super();
		this.idCultura = idCultura;
		this.nomeCultura = nomeCultura;
		this.tipo = tipo;
	}

	@Id
	@Column(name = "ID_CULTURA")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CULTURA_SEQ")
	@SequenceGenerator(name = "CULTURA_SEQ", sequenceName = "CULTURA_SEQ", allocationSize = 1)
	public long getIdCultura() {
		return idCultura;
	}

	public void setIdCultura(long idCultura) {
		this.idCultura = idCultura;
	}

	@Column(name = "NOME")
	@NotNull(message = "Nome obrigatório")
	@Size(min = 2, max = 50, message = "NOME deve ser entre 2 e 40 caracteres")
	public String getNomeCultura() {
		return nomeCultura;
	}

	public void setNomeCultura(String nomeCultura) {
		this.nomeCultura = nomeCultura;
	}
	
	@Column(name = "TIPO")
	@NotNull(message = "Tipo obrigatório")
	@Size(min = 2, max = 50, message = "tipo deve ser entre 2 e 40 caracteres")
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@OneToMany(mappedBy = "cultura", cascade = CascadeType.ALL)
	public List<ProducaoModel> getProducoes() {
		return producoes;
	}

	public void setProducoes(List<ProducaoModel> producoes) {
		this.producoes = producoes;
	}

	@OneToMany(mappedBy = "cultura", cascade = CascadeType.ALL)
	public List<ConsumoModel> getConsumos() {
		return consumos;
	}

	public void setConsumos(List<ConsumoModel> consumos) {
		this.consumos = consumos;
	}
}
