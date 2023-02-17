package com.example.springex.mapper;

import com.example.springex.domain.TodoVO;

import java.util.List;

public interface TodoMapper {
    String getTime();

    void insert(TodoVO todoVO);

    List<TodoVO> selectAll();
}
