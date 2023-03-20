package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.Board;
import com.example.demo.service.BoardServiceImpl;

@Controller
public class BoardController {
	
	
	  @Autowired 
	  BoardServiceImpl BoardService;
	 

	@GetMapping("/list")
	public String list(Model model) {
		
		
		  List<Board> list = BoardService.getList();
		  
		  System.out.println("==============");
		  System.out.println(list);
		  System.out.println("==============");
		  		  
		  model.addAttribute("boardlist", list);
		  
		return "list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	@ResponseBody
	@GetMapping("/get")
	public Board detailBoard(Board board) {
		return BoardService.findById(board);
	}
	
	@GetMapping("/remove")
	public String remove(Board board) {
		BoardService.remove(board);
		
		return "redirect:/list";
	}
	
	@PostMapping("/register")
	public String register(Board vo) {
		BoardService.register(vo);
		
		return "redirect:/list";
	}
	
	@PostMapping("/modify")
	public String modify(Board board) {
		BoardService.modify(board);
		
		return "redirect:/list";
	}
	
}
