package com.example.springex.service;

import com.example.springex.dto.TodoDTO;

import java.util.List;

public interface TodoService {
    void register(TodoDTO todoDTO);

    List<TodoDTO> getAll();
}
