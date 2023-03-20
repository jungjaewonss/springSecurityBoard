package com.example.demo.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Board;

@Service
public interface BoardService {	
	public List<Board> getList();
	public void register(Board vo);
	public Board findById(Board vo);
	public void remove(Board vo);
	public void modify(Board vo);
}
