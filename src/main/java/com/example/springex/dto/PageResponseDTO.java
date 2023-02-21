package com.example.springex.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
public class PageResponseDTO<E> {
    private int page;
    private int size;
    private int total;

    // 시작 페이지 번호
    private int start;
    // 끝 페이지 번호
    private int end;

    // 이전 페이지의 존재 여부
    private boolean prev;
    // 다음 페이지의 존재 여부
    private boolean next;

    private List<E> dtoList;

    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {
        this.page = pageRequestDTO.getPage();
        this.size = pageRequestDTO.getSize();

        this.total = total;
        this.dtoList = dtoList;

        // 페이징 연산 순서
        //1. 마지막 페이지 번호의 계산. end는 현재 페이지 번호를 기준으로 계산
        // page를 10으로 나눈 값을 올림처리한 후 * 10
        this.end = (int) (Math.ceil(this.page / 10.0)) * 10;
        //2. 시작 페이지 번호의 계산. start는 마지막 페이지에서 9를 뺴면 됨.
        this.start = this.end - 9;

        //3. 마지막 페이지의 전체 개수 total을 고려한 예외사항 계산
        int last = (int)(Math.ceil((total/(double)size)));

        //4.
        this.end = end > last ? last :  end;

        // 이전 페이지 버튼의 존재 여부는 시작 페이지 start가 1이 아니라면 무조건 true
        this.prev = this.start > 1;
        // 다음 페이지는 마지막 페이지 end와 페이지당 개수 size를 곱한 값보다 total이 더 많은지 보고 판단
        this.next = total > this.end * this.size;
    }
}

