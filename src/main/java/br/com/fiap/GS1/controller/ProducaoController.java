package br.com.fiap.GS1.controller;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.fiap.GS1.model.ConsumoModel;
import br.com.fiap.GS1.model.ProducaoModel;
import br.com.fiap.GS1.repository.CulturaRepository;
import br.com.fiap.GS1.repository.ConsumoRepository;
import br.com.fiap.GS1.repository.ProducaoRepository;


@Controller
@RequestMapping({"/", "/producao"})
public class ProducaoController {
	
	private static final String PRODUCAO_FOLDER = "producao/";
	
	@Autowired
	public ProducaoRepository producaoRepository;
	
	@Autowired
	public CulturaRepository culturaRepository;
	
	@Autowired
	public ConsumoRepository consumoRepository;
	
	@GetMapping("/form")
	public String open(@RequestParam String page, 
					   @RequestParam(required = false) Long id,
					   @ModelAttribute("producaoModel") ProducaoModel producaoModel, 
					   Model model) {
		
		if("producao-editar".equals(page)) {
			ProducaoModel producaoModelo = producaoRepository.findById(id).get();
			producaoModelo.setConsumo(consumoRepository.findById(id).get().getQuantidade());
			model.addAttribute("producaoModel", producaoModelo);
		}
		
		model.addAttribute("culturas", culturaRepository.findAll());
		
		
		return PRODUCAO_FOLDER + page;
	}

	@GetMapping()
	public String findAll(Model model) {

		model.addAttribute("producoes", producaoRepository.findAll());
		model.addAttribute("consumos", consumoRepository.findAll());
		return PRODUCAO_FOLDER +  "producoes";
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable("id") long id, Model model) {
		
		model.addAttribute("producao", producaoRepository.findById(id).get());
		return PRODUCAO_FOLDER +  "producao-detalhe";
	}
	
	@GetMapping("/consumo/{id}")
	public String findByConsumoId(@PathVariable("id") long id, Model model) {
		
		model.addAttribute("consumo", consumoRepository.findById(id).get());
		return PRODUCAO_FOLDER +  "consumo-detalhe";
	}
	
	@PostMapping()
	public String save(@Valid ProducaoModel producaoModel,BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("culturas", culturaRepository.findAll());
			return PRODUCAO_FOLDER + "producao-nova";
		}
		
		producaoRepository.save(producaoModel);
		ConsumoModel consumoModel = new ConsumoModel();
		consumoModel.setAno(producaoModel.getAno());
		consumoModel.setCultura(producaoModel.getCultura());
		consumoModel.setQuantidade(producaoModel.getConsumo());
		consumoRepository.save(consumoModel);
		redirectAttributes.addFlashAttribute("messages", "Producao cadastrada com sucesso!");
		
		return "redirect:/producao";
	}
	
	@PutMapping("/{id}")
	public String update(@PathVariable("id") long id, @Valid ProducaoModel producaoModel, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("culturas", culturaRepository.findAll());
			return PRODUCAO_FOLDER + "producao-editar";
		}
		
		producaoModel.setId(id);
		ConsumoModel consumoModel = new ConsumoModel();
		consumoModel.setId(id);
		consumoModel.setAno(producaoModel.getAno());
		consumoModel.setCultura(producaoModel.getCultura());
		consumoModel.setQuantidade(producaoModel.getConsumo());
		producaoRepository.save(producaoModel);
		consumoRepository.save(consumoModel);
		redirectAttributes.addFlashAttribute("messages", "Producao alterada com sucesso!");
		
		return "redirect:/producao";
	}
	
	@DeleteMapping("/{id}")
	public String deleteById(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		
		producaoRepository.deleteById(id);
		consumoRepository.deleteById(id);
		redirectAttributes.addFlashAttribute("messages", "Producao excluída com sucesso!");

		return "redirect:/producao";
	}

}
