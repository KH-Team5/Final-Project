package com.kh.model;

import java.security.Principal;
import java.util.List;

import com.kh.model.domain.BoardDTO;
import com.kh.model.domain.PagingDTO;

public interface BoardRepository {
    //게시물 목록
	public List<BoardDTO> list() throws Exception;
	//게시물 작성
	public void write(BoardDTO dto) throws Exception;
	//게시물 조회
	public BoardDTO view(int index) throws Exception;	
	//게시물 수정
	public void modify(BoardDTO dto) throws Exception;
	//게시물 삭제
	public void delete(int q_index) throws Exception;
	//게시물 총 갯수
	public int count() throws Exception;
	//게시물 목록 + 페이징
	public List<BoardDTO> listPage(PagingDTO vo) throws Exception;
	//게시물 목록 + 페이징 + 검색
	public List<BoardDTO> listPageSearch(PagingDTO vo,String searchType, String keyword) throws Exception;
	//게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
}

