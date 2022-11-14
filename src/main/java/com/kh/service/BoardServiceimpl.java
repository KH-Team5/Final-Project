package com.kh.service;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.BoardRepository;
import com.kh.model.domain.BoardDTO;
import com.kh.model.domain.PagingDTO;
@Service
public class BoardServiceimpl implements BoardService {

	
	
	@Autowired
	private BoardRepository dao;
	
	
	//게시물 목록
	@Override
	public List<BoardDTO> list() throws Exception {return dao.list();}
   
	
	//게시물 작성
	@Override
	public void write(BoardDTO dto) throws Exception {dao.write(dto);}

    //게시물 조회
	@Override
	public BoardDTO view(int index) throws Exception {return dao.view(index);}

    //게시물 수정
	@Override
	public void modify(BoardDTO dto) throws Exception {dao.modify(dto);}

    //게시물 삭제
	@Override
	public void delete(int q_index) throws Exception {dao.delete(q_index);}

    //게시물 총 갯수
	@Override
	public int count() throws Exception {return dao.count();}

    //게시물 목록 + 페이징
	@Override
	public List<BoardDTO> listPage(PagingDTO vo) throws Exception {return dao.listPage(vo);}

	//게시물 목록 + 페이징 + 검색
	@Override
	public List<BoardDTO> listPageSearch(PagingDTO vo, String searchType, String keyword) throws Exception {
		return dao.listPageSearch(vo,searchType,keyword);
	}


	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}

}
