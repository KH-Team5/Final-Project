package com.kh.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.model.domain.BoardReplyDTO;
@Repository
public class BoardReplyRepositoryImpl implements BoardReplyRepository {
	
	
	private Logger logger = Logger.getLogger(BoardReplyRepositoryImpl.class);
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.kh.model.domain.BoardReplyDTO";

	//댓글 조회
	@Override
	public List<BoardReplyDTO> list(int q_index) throws Exception {
		return sql.selectList(namespace + ".replyList", q_index);
	}
    //댓글 작성
	@Override
	public void write(BoardReplyDTO dto) throws Exception {
		sql.insert(namespace + ".replyWrite", dto);	
	}
    //댓글 수정
	@Override
	public void modify(BoardReplyDTO dto) throws Exception {
		sql.update(namespace + ".replyModify", dto);
	}
    //댓글 삭제
	@Override
	public void delete(BoardReplyDTO dto) throws Exception {
		sql.delete(namespace + ".replyDelete", dto);
	}
	//단일 댓글 조회
	@Override
	public BoardReplyDTO replySelect(BoardReplyDTO dto) throws Exception {
		return sql.selectOne(namespace + ".replySelect", dto);
	}

}
