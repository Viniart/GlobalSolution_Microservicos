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

import br.com.fiap.GS1.model.CulturaModel;
import br.com.fiap.GS1.repository.CulturaRepository;

@Controller
@RequestMapping("/cultura")
public class CulturaController {
	
	private static final String CULTURA_FOLDER = "cultura/";

	@Autowired(required = false)
	public CulturaRepository repository;
	
	@GetMapping("/form")
	public String open(@RequestParam String page, 
					   @RequestParam(required = false) Long id,
					   @ModelAttribute("culturaModel") CulturaModel culturaModel, 
					   Model model) {
		
		if("cultura-editar".equals(page)) {
			model.addAttribute("culturaModel", repository.findById(id).get());
		}
		
		return CULTURA_FOLDER + page;
	}
	
	@GetMapping()
	public String findAll(Model model) {

		model.addAttribute("culturas", repository.findAll());
		return CULTURA_FOLDER +  "culturas";
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable("id") long id, Model model) {
		
		model.addAttribute("cultura", repository.findById(id).get());
		return CULTURA_FOLDER +  "cultura-detalhe";
	}
	
	@PostMapping()
	public String save(@Valid CulturaModel culturaModel, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if(bindingResult.hasErrors()) {
			return CULTURA_FOLDER + "cultura-nova";
		}
		
		repository.save(culturaModel);
		redirectAttributes.addFlashAttribute("messages", "Cultura cadastrada com sucesso!");
		
		return "redirect:/cultura";
	}
	
	@PutMapping("/{id}")
	public String update(@PathVariable("id") long id, @Valid CulturaModel culturaModel, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if(bindingResult.hasErrors()) {
			return CULTURA_FOLDER + "cultura-editar";
		}
		
		culturaModel.setIdCultura(id);
		repository.save(culturaModel);
		redirectAttributes.addFlashAttribute("messages", "Cultura alterado com sucesso!");
		
		return "redirect:/cultura";
	}
	
	@DeleteMapping("/{id}")
	public String deleteById(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		
		repository.deleteById(id);
		redirectAttributes.addFlashAttribute("messages", "Cultura excluída com sucesso!");

		return "redirect:/cultura";
	}
	
}
