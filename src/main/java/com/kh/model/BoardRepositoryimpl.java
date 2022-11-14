package com.kh.model;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.BoardDTO;
import com.kh.model.domain.PagingDTO;
@Repository
public class BoardRepositoryimpl implements BoardRepository {

	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.kh.model.domain.BoardDTO";
	
	
	//게시물 목록
	@Override
	public List<BoardDTO> list() throws Exception {return sql.selectList(namespace +".list");}


    //게시물 작성
	@Override
	public void write(BoardDTO dto) throws Exception {
		sql.insert(namespace + ".write", dto);
	}

    
	//게시물 조회
	@Override
	public BoardDTO view(int index) throws Exception {return sql.selectOne(namespace + ".view", index);}

    //게시물 수정
	@Override
	public void modify(BoardDTO dto) throws Exception {sql.update(namespace + ".modify", dto);}

    //게시물 삭제
	@Override
	public void delete(int q_index) throws Exception {sql.delete(namespace + ".delete", q_index);}

    //게시물 총 갯수
	@Override
	public int count() throws Exception {return sql.selectOne(namespace + ".count");}

    //게시물 목록 + 페이징
	@Override
	public List<BoardDTO> listPage(PagingDTO vo) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("start", vo.getStart());
		data.put("end", vo.getEnd());
		return sql.selectList(namespace + ".listPage", data);
	}


	@Override
	public List<BoardDTO> listPageSearch(PagingDTO vo,String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("start", vo.getStart());
		data.put("end", vo.getEnd());
		
		data.put("searchType",searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPageSearch", data);
	}


	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);
		data.put("keyword",keyword);
		return sql.selectOne(namespace + ".searchCount", data);
	}

	
}
