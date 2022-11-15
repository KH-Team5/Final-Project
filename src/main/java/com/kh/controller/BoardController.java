package com.kh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.security.Principal;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.model.domain.BoardDTO;
import com.kh.model.domain.BoardReplyDTO;
import com.kh.model.domain.PagingDTO;
import com.kh.service.BoardReplyService;
import com.kh.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	
	@Inject
	BoardService service;
	
	@Inject
	private BoardReplyService replyService;
	
	
//==================================================================================================	
	
//	//게시물 목록~!
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public void getList(Model model) throws Exception {
//	
//		List<BoardDTO> list = null;
//		list = service.list();	
//		model.addAttribute("list", list);}

//==================================================================================================	
	
	//게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getwrite() throws Exception {
	}
		
	//게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postwrite(Model model, BoardDTO dto, Principal principal) throws Exception {	  
		dto.setM_Id(principal.getName());
		service.write(dto);
		model.addAttribute("key", dto);
	  return "redirect:/board/listPageSearch?num=1";}

//==================================================================================================	
	
	//게시물 조회 GET
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getview(@RequestParam("q_index")int q_index, Model model) throws Exception {	  	 
		BoardDTO dto = service.view(q_index);
		model.addAttribute("view", dto);
		  //댓글 조회
		   List<BoardReplyDTO> reply = null;
		   reply = replyService.list(q_index);
		 
		   model.addAttribute("reply", reply);
	}

//==================================================================================================	
	
	//게시물 수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getmodify(@RequestParam("q_index")int q_index, Model model,Principal principal,@RequestParam("m_id") String m_id ) throws Exception {
		BoardDTO dto = service.view(q_index);
			model.addAttribute("view", dto);	
	}
		
		


	//게시물 수정 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postmodify(@RequestParam("q_index")int q_index, BoardDTO dto, Principal principal,@RequestParam("m_id") String m_id ) throws Exception {			
		
		if(m_id.equals(principal.getName())) {
			dto.setM_Id(principal.getName());
			dto.setQ_Index(q_index);
			service.modify(dto);
        }else {System.out.println("아이디가 다릅니다.");
        return"redirect:/board/listPageSearch?num=1";}

		 return"redirect:/board/view?q_index="+ dto.getQ_Index();}
	 

//==================================================================================================	
	
	//게시물 삭제 GET
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("q_index") int q_index, Principal principal, @RequestParam("m_id") String m_id) throws Exception{
		System.out.println("이름은 : " + m_id);
		BoardDTO dto = service.view(q_index);
		if(dto.getM_Id().contentEquals(principal.getName())) {
			service.delete(q_index);
		}else {
			return "redirect:/board/view?q_index="+ dto.getQ_Index();
		}
		return "redirect:/board/listPageSearch?num=1";}



//==================================================================================================	


	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num")int num,
			@RequestParam(value="searchType",required = false, defaultValue = "q_title") String searchType,
			@RequestParam(value="keyword",required = false, defaultValue = "") String keyword) throws Exception{	   

		String searchTypeKeyword;
		//게시물 총 갯수
		int count = service.searchCount(searchType, keyword);

		if(searchType.equals("") || keyword.equals("")) {
			searchTypeKeyword = "";
		}else {
			searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword;
		}
	
		//한 페이지에 출력할 게시물 갯수
		int postNum = 5;
		
		//하단 페이징 번호 ([ 게시물 총 갯수 / 한 페이지에 출력할 갯수]의 올림)
		int pageNum = (int)Math.ceil((double) count/postNum);
		
		
		//한 번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 5;
		
		// 표시되는 페이징 번호 중 마지막 번호
		int endpageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
	
		
		// 표시되는 페이징 번호 중 첫번째 번호
		int startPageNum = endpageNum - (pageNum_cnt - 1);

		
		 // 마지막 번호 재계산
		int endpageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));

		if(endpageNum > endpageNum_tmp) {
			 endpageNum = endpageNum_tmp;
		}
	
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endpageNum * pageNum_cnt >= count ? false : true;
		
		PagingDTO vo = new PagingDTO(count, num, postNum);
		List<BoardDTO> list = null;
		list = service.listPageSearch(vo, searchType, keyword);	
		
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		//시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endpageNum);
		
		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		//현재 페이지
		model.addAttribute("select", num);	
		//검색 타입과 검색어
		model.addAttribute("searchTypeKeyword", searchTypeKeyword);	
		
		//제목 과 내용 
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
	}
	
}


























































