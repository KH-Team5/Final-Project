package com.kh.model;

import java.util.List;

import com.kh.model.domain.BoardReplyDTO;

public interface BoardReplyRepository {
 
	 //댓글 조회
	 public List<BoardReplyDTO> list(int q_index) throws Exception;
	 
	 //댓글 작성
	 public void write(BoardReplyDTO dto) throws Exception;
	 
	 //댓글 조회
     public void modify(BoardReplyDTO dto) throws Exception;
		 
	 //댓글 삭제
	 public void delete(BoardReplyDTO dto) throws Exception;
	 
	 // 단일 댓글 조회
	 public BoardReplyDTO replySelect(BoardReplyDTO dto)throws Exception;
	 
	 
	 
	 
}
