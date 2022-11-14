package com.kh.controller;

import java.awt.Graphics2D;  
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.model.domain.AttachImageDTO;
import com.kh.model.domain.CategoryDTO;
import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.PageDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.model.domain.userPagingDTO;
import com.kh.service.AdminService;
import com.kh.service.ProductService;

import lombok.AllArgsConstructor;
import net.coobird.thumbnailator.Thumbnails;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.model.domain.Criteria;
import com.kh.model.domain.MemberDTO;
import com.kh.model.domain.ProductDTO;
import com.kh.service.MemberService;



@Controller
@RequestMapping(value = "/admin/*")
@AllArgsConstructor
public class AdminController {
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   private AdminService adminService;
   
   @Autowired
   private ProductService productService;

   //관리자 메인페이지로 이동
      @RequestMapping(value = "/adminMain", method = RequestMethod.GET)
      public String getpage( Model model) throws Exception {
          
          //게시물 총 갯수
          int count = adminService.count();

          
          //한 페이지에 출력할 게시물 갯수
          int postNum = 10;
          
          //하단 페이징 번호 ([ 게시물 총 갯수 / 한 페이지에 출력할 갯수]의 올림)
          int pageNum = (int)Math.ceil((double) count/postNum);
          
          
          int num= 1;
          model.addAttribute("num", num);

          model.addAttribute("pageNum", pageNum);
          
          //시작 및 끝 번호
          
         
       

         return "admin/adminMain";
}
      
     
      

      @RequestMapping(value = "/usersManage", method = RequestMethod.GET)
      public void usersManage(Criteria cri, Model model,
      
    		@RequestParam("num")int num,
            @RequestParam(value="searchType",required = false, defaultValue = "m_Id") String searchType,
            @RequestParam(value="keyword",required = false, defaultValue = "") String keyword) throws Exception{      
         String searchTypeKeyword;
         

         //게시물 총 갯수
         int count = adminService.searchCount(searchType, keyword);


         if(searchType.equals("") || keyword.equals("")) {
            searchTypeKeyword = "";
         }else {
            searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword;
         }
         
         
         
         //한 페이지에 출력할 게시물 갯수
         int postNum = 10;
         
         //하단 페이징 번호 ([ 게시물 총 갯수 / 한 페이지에 출력할 갯수]의 올림)
         int pageNum = (int)Math.ceil((double) count/postNum);
         
         
         //한 번에 표시할 페이징 번호의 갯수
         int pageNum_cnt = 10;
         
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
         
         userPagingDTO vo = new userPagingDTO(count, num, postNum);
         List<MemberDTO> userList = null;
         userList = adminService.listPageSearch(vo, searchType, keyword);   
         
         model.addAttribute("list", userList);
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
         model.addAttribute("listCheck","empty");
         
         
      }
      
      /* 유저조회페이지 */
         
         @RequestMapping(value = "/userInfo/{m_Id}", method = RequestMethod.GET)
         public String productInfo(@PathVariable("m_Id")String m_Id, Model model) {
            model.addAttribute("u_list", adminService.getUserInfo(m_Id));

            return "/admin/userInfo";
            
         }
         
         
         
         
         
      
      /* 유저 아이디 삭제 */
      @RequestMapping(value = "/userDelete/{m_Id}", method = RequestMethod.GET)
      public String userDelete(@PathVariable("m_Id") String m_Id) { 
         
      adminService.userDelete(m_Id); 
      logger.info("아이디 삭제 성공");
      
      
      
      return "redirect:/admin/usersManage?num=1";
      
      }
    
      
      
      
      
      

      
      
      
      /* 상품조회페이지 */
      @RequestMapping(value = "/adminProductInfo/{p_Id}", method = RequestMethod.GET)
      public String productInfo(@PathVariable("p_Id") int p_Id, Model model) {
         model.addAttribute("productInfo", productService.getProductInfo(p_Id));
         return "/admin/adminProductInfo";
         
      }
      
     
      
      
      
      
      
      
      
   // 상품관리 
      
      @RequestMapping(value = "/productsManage", method = RequestMethod.GET)
      public void productManage(Criteria cri, Model model) {
         List<ProductDTO> list = productService.productGetList(cri);
         if (!list.isEmpty())
            model.addAttribute("list", list);
         else {
            model.addAttribute("listCheck", "empty");
            return;
         }
         model.addAttribute("paging", new PageDTO(cri, productService.productGetTotal(cri)));
      }
      
      
      /* 상품조회 및 수정 */
      
      @RequestMapping(value = "/productModify/{p_Id}", method = RequestMethod.GET)
       public String productModify(@PathVariable("p_Id") int p_Id, Model model) throws Exception {
         List<CategoryDTO> list = productService.categoryList();
         ObjectMapper obj = new ObjectMapper();
         String categoryList = obj.writeValueAsString(list);
         model.addAttribute("categoryList", categoryList);
         
   
         
         /* 조회 페이지 정보 */
         model.addAttribute("productInfo", productService.getProductInfo(p_Id));
         return "admin/productModify";
      }
      
      /* 상품 정보 수정 */
      @RequestMapping(value = "/productModify/{p_Id}", method = RequestMethod.POST)
      public String productModifyPOST(ProductDTO productDTO, Model model,RedirectAttributes redirect)  {
    	  
//    	  if (productDTO.getImageList() != null) {
    	  
//    	  }
    	  adminService.deleteImageAll(productDTO.getP_Id()); //상품번호 이미지 전체삭제
    	  
    	  adminService.productModify(productDTO);	//상품정보 업데이트 & 이미지 등록

//    	  int result = adminService.productModify(productDTO);	//상품정보 업데이트 & 이미지 등록
//    	  
//    	  if(result == 1 && productDTO.getImageList() != null && productDTO.getImageList().size() > 0) {
//    		  
//    		  //adminService.deleteImageAll(productDTO.getP_Id());
//    		  
    		  //adminService.regProduct(productDTO);
//    		  
//    		  redirect.addFlashAttribute("registration_result", productDTO.getP_Name());
//    		   		  
//    	  }else {
//      
//          adminService.regProduct(productDTO);
//		  redirect.addFlashAttribute("registration_result", productDTO.getP_Name());
//    	  }
         return "redirect:/admin/productsManage";
      }
   
    
      

      @ResponseBody
      @PostMapping(value = "/productModify/{p_Id}/fileUpload")
      public ResponseEntity<List<AttachImageDTO>> modifyFileUploadPOST1(@RequestParam("imageFile") MultipartFile[] uploadFile) {
         
    	  System.out.println("modifyFileUploadPOST1()");
    	  for (MultipartFile multipartFile : uploadFile) {
            File checkfile = new File(multipartFile.getOriginalFilename());
            String type = null;
            try {
               type = Files.probeContentType(checkfile.toPath());
               logger.info("MIME TYPE : " + type);
            } catch (IOException e) {
               e.printStackTrace();
            }
            if (!type.startsWith("image")) {
               List<AttachImageDTO> list = null;
               return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
            }
         }
         String uploadFolder = "C:\\upload";
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         Date date = new Date();
         String str = sdf.format(date);
         String datePath = str.replace("-", File.separator);
         File uploadPath = new File(uploadFolder, datePath);
         if (uploadPath.exists() == false)
            uploadPath.mkdirs();

         List<AttachImageDTO> list = new ArrayList<>();
         for (MultipartFile multipartFile : uploadFile) {
            AttachImageDTO image = new AttachImageDTO();
            String uploadFileName = multipartFile.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            uploadFileName = uuid + "_" + uploadFileName;

            image.setFileName(uploadFileName);
            image.setFilePath(datePath);
            image.setUuid(uuid);

            File saveFile = new File(uploadPath, uploadFileName);
            try {
               multipartFile.transferTo(saveFile);
               File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
               BufferedImage bo_image = ImageIO.read(saveFile);
               double ratio = 3;
               int width = (int) (bo_image.getWidth() / ratio);
               int height = (int) (bo_image.getHeight() / ratio);
               Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
            } catch (Exception e) {
               e.printStackTrace();
            }
            list.add(image);
         }
         return new ResponseEntity<List<AttachImageDTO>>(list, HttpStatus.OK);
      }

      @RequestMapping(value = "/productModify/{p_Id}/deleteFile", method = RequestMethod.POST)
      public ResponseEntity<String> modifyDeleteFile(String fileName) {
         File file = null;
         try {
            file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
            file.delete();
            String originFileName = file.getAbsolutePath().replace("s_", "");
            file = new File(originFileName);
            file.delete();
         } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
         }
         return new ResponseEntity<String>("success", HttpStatus.OK);
      }
      
      
      
      
      
      
      
         
      
   // 상품삭제

        @RequestMapping(value = "/productDelete/{p_Id}", method = RequestMethod.GET)
        public String productDelete(@PathVariable("p_Id") int p_Id) { 
           
        adminService.productDelete(p_Id); 
        logger.info("상품 삭제 성공");
        
        
        
        return "redirect:/admin/productsManage";
        
        }
      
      
      
      
      
   // 상품 등록
   @RequestMapping(value = "/productRegistration", method = RequestMethod.GET)
   public String productRegistration(Model model) throws Exception {

      List<CategoryDTO> list = productService.categoryList();
      ObjectMapper obj = new ObjectMapper();
      String categoryList = obj.writeValueAsString(list);
      model.addAttribute("categoryList", categoryList);

      return "/admin/productRegistration";
   }

   
   @PostMapping("/productRegistration")
   public String productRegistrationPOST(ProductDTO productDTO, RedirectAttributes redirec) {
      adminService.regProduct(productDTO);
      redirec.addFlashAttribute("registration_result", productDTO.getP_Name());
      return "redirect:/admin/productsManage";
   }
   
   
   

   @ResponseBody
//   @PostMapping(value = {"/productRegistration/fileUpload","/productModify/{p_Id}/fileUpload"} )
   @PostMapping(value = "/productRegistration/fileUpload")
   public ResponseEntity<List<AttachImageDTO>> fileUploadPOST(@RequestParam("imageFile") MultipartFile[] uploadFile) {
      for (MultipartFile multipartFile : uploadFile) {
         File checkfile = new File(multipartFile.getOriginalFilename());
         String type = null;
         try {
            type = Files.probeContentType(checkfile.toPath());
            logger.info("MIME TYPE : " + type);
         } catch (IOException e) {
            e.printStackTrace();
         }
         if (!type.startsWith("image")) {
            List<AttachImageDTO> list = null;
            return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
         }
      }
      String uploadFolder = "C:\\upload";
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date date = new Date();
      String str = sdf.format(date);
      String datePath = str.replace("-", File.separator);
      File uploadPath = new File(uploadFolder, datePath);
      if (uploadPath.exists() == false)
         uploadPath.mkdirs();

      List<AttachImageDTO> list = new ArrayList<>();
      for (MultipartFile multipartFile : uploadFile) {
         AttachImageDTO image = new AttachImageDTO();
         String uploadFileName = multipartFile.getOriginalFilename();
         String uuid = UUID.randomUUID().toString();
         uploadFileName = uuid + "_" + uploadFileName;

         image.setFileName(uploadFileName);
         image.setFilePath(datePath);
         image.setUuid(uuid);

         File saveFile = new File(uploadPath, uploadFileName);
         try {
            multipartFile.transferTo(saveFile);
            File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
            BufferedImage bo_image = ImageIO.read(saveFile);
            double ratio = 3;
            int width = (int) (bo_image.getWidth() / ratio);
            int height = (int) (bo_image.getHeight() / ratio);
            Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
         } catch (Exception e) {
            e.printStackTrace();
         }
         list.add(image);
      }
      return new ResponseEntity<List<AttachImageDTO>>(list, HttpStatus.OK);
   }

   @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
   public ResponseEntity<String> deleteFile(String fileName) {
      File file = null;
      try {
         file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
         file.delete();
         String originFileName = file.getAbsolutePath().replace("s_", "");
         file = new File(originFileName);
         file.delete();
      } catch (Exception e) {
         e.printStackTrace();
         return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
      }
      return new ResponseEntity<String>("success", HttpStatus.OK);
   }
}