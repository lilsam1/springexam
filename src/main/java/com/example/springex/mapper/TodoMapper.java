package com.example.springex.mapper;

import com.example.springex.domain.TodoVO;
import com.example.springex.dto.PageRequestDTO;

import java.util.List;

public interface TodoMapper {
    String getTime();

    void insert(TodoVO todoVO);

    List<TodoVO> selectAll();

    TodoVO selectOne(Long tno);

    void delete(Long tno);
    void update(TodoVO todoVO);

    List<TodoVO> selectList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);
    //화면에 페이지 번호들을 구성하기 위해서는 전체 데이터의 수를 알아야만 가능
    //예를 들어 마지막 페이지가 7에서 끝나야 하는 상황이 생긴다면 화면상에서도 페이지 번호를 조정해야 하기 때문
    //나중에 검색에 대비해서 PageRequestDTO를 파라미터로 받도록 설계
}
