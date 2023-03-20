package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Board;
import com.example.demo.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
	@Override
	public List<Board> getList() {
		List<Board> list =  boardRepository.findAll();
		return list;
	}

	@Override
	public void register(Board vo) {
		boardRepository.save(vo);		
	}

	@Override
	public Board findById(Board vo) {
		Optional<Board> detailBoard = boardRepository.findById(vo.getIdx());
		return detailBoard.get();
	}

	@Override
	public void remove(Board vo) {
		boardRepository.delete(vo);	
	}

	@Override
	public void modify(Board vo) {
		boardRepository.save(vo);		
	}
	

}
