package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board,Long> {
		
	//find + By + 컬럼이름 으로 할수있음
	public Board findByWriter(String write);
}
