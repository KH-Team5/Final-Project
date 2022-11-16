package com.kh.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.model.BoardReplyRepository;
import com.kh.model.domain.BoardReplyDTO;
@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	Logger logger = Logger.getLogger(BoardReplyServiceImpl.class);
	@Autowired
	private BoardReplyRepository dao;
    //댓글 조회
	@Override
	public List<BoardReplyDTO> list(int q_index) throws Exception {
		return dao.list(q_index);
	}
    //댓글  작성
	@Override
	public void write(BoardReplyDTO dto) throws Exception {
		dao.write(dto);

	}
    //댓글 수정
	@Override
	public void modify(BoardReplyDTO dto) throws Exception {
		dao.modify(dto);

	}
    //댓글 삭제
	@Override
	public void delete(BoardReplyDTO dto) throws Exception {
		dao.delete(dto);

	}
	//단일 댓글 조회
	@Override
	public BoardReplyDTO replySelect(BoardReplyDTO dto) throws Exception {
		return dao.replySelect(dto);
	}

}
