package com.kh.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.model.domain.BoardDTO;
import com.kh.model.domain.BoardReplyDTO;
import com.kh.service.BoardReplyService;
import com.kh.service.BoardService;

@Controller
@RequestMapping("/reply/*")
public class BoardReplyController {
    
	@Inject
	private BoardReplyService replyService;
		
	//댓글 조회
	
	//댓글 작성
	 @RequestMapping(value="/write", method = RequestMethod.POST)
	 public String postWrite(BoardReplyDTO dto, Principal principal) throws Exception{
         dto.setM_Id(principal.getName());
         System.out.println(dto.getM_Id());
         replyService.write(dto);
		 return "redirect:/board/view?q_index=" + dto.getQ_Index();
		 
	 }
	// 댓글 단일 조회 (수정 페이지)
		 @RequestMapping(value = "/modify", method = RequestMethod.GET)
		 public void getMofidy(@RequestParam("q_index") int q_Index, @RequestParam("rno") int rno, Model model,Principal principal) throws Exception {
		 	
		 	BoardReplyDTO dto = new BoardReplyDTO();
		 	dto.setQ_Index(q_Index);
		 	System.out.println("인덱스 값은 : " +  q_Index);
		 	dto.setRno(rno);
		 	BoardReplyDTO reply = replyService.replySelect(dto);
		 	System.out.println("총 값은 : " + reply);
		 	model.addAttribute("reply", reply);
		 }
		 
		 
	//댓글 수정
		 @RequestMapping(value = "/modify", method = RequestMethod.POST)
		 public String postModify(@RequestParam("q_index") int q_index ,@RequestParam("m_id") String m_id ,BoardReplyDTO dto, Principal principal) throws Exception { 			 			 
			 if(m_id.contentEquals(principal.getName())) {
				 dto.setQ_Index(q_index);	  
				 dto.setM_Id(principal.getName());
				 replyService.modify(dto);
			 }else {
				 dto.setQ_Index(q_index);
				 System.out.println("아이디가 다릅니다.");
			 }
			 
           return "redirect:/board/view?q_index=" + dto.getQ_Index();
		 }
	//댓글 삭제
		 @RequestMapping(value = "/delete", method = RequestMethod.GET)
		 public String postDelete(@RequestParam("q_index") int q_index ,@RequestParam("m_id") String m_id ,BoardReplyDTO dto, Principal principal) throws Exception { 
			 if(m_id.contentEquals(principal.getName())) {  
			     dto.setQ_Index(q_index);
				 replyService.delete(dto);
			 }else {
				 dto.setQ_Index(q_index);
				 System.out.println("아이디가 다릅니다.");
			 }

			return "redirect:/board/view?q_index=" + dto.getQ_Index();
	
	 
	 
}
}
