package mainBoard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainBoardVO;

/**
 * Servlet implementation class Maininsert
 */
@WebServlet("/mainboard/mainBoardinsert.do")
@MultipartConfig(
fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 100
)
public class Maininsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/mainboard";
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		request.setCharacterEncoding("utf-8");
		
		
		System.out.println("왜 이것도 안와 ???????????");
		
		
		String mb_sdate = request.getParameter("mb_sdate"); 
		System.out.println("값 잘 넘어오니?" + mb_sdate);
		String mb_edate = request.getParameter("mb_edate"); 
		System.out.println("값 잘 넘어오니?" + mb_edate);
		String mb_title = request.getParameter("mb_title");
		System.out.println("값 잘 넘어오니?" + mb_title);
		String mb_content = request.getParameter("mb_content");
		System.out.println("값 잘 넘어오니?" + mb_content);
		mb_content = mb_content.replace("\r\n", "<br>");
		System.out.println("값 잘 넘어오니?" + mb_content);
		int reg_no = Integer.parseInt(request.getParameter("reg_no"));
		System.out.println("값 잘 넘어오니?" + reg_no);
		String mb_pic = request.getParameter("mb_pic");
		System.out.println("값 잘 넘어오니?" + mb_pic);
		
		
		HttpSession session = request.getSession();  
		String p_name = (String) session.getAttribute("PNAME");
		System.out.println("값 잘 넘어오니?" + p_name);
		
		MainBoardVO vo = new MainBoardVO();
		vo.setMb_sdate(mb_sdate);
		vo.setMb_edate(mb_edate);
		vo.setMb_title(mb_title);
		vo.setMb_content(mb_content);
		vo.setP_name(p_name);
		vo.setReg_no(reg_no);
		
		Part part = request.getPart("mb_pic");
		System.out.println("part는 " + part);

		
		String fileName;
		
		if(part!=null) {
			fileName = extractFileName(part);
			
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
					vo.setMb_pic(fileName);
				} catch (Exception e) {
					vo.setMb_pic(null);
				}
			}
		}
		
		if(vo.getMb_pic() == null) {
			fileName = "꽃.jpg";
			vo.setMb_pic(fileName);
		}
		
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		//메인게시판 insert
		service.maininsert(vo);
	
		//withme 테이블 insert
	    int check1 = service.withmeinsert(vo);
	    System.out.println("인서트가 되면 리턴값이 1이어야함--------------------------------------------- " + check1 );
	    
	    //withmejoin 테이블 insert
	    int check2 = service.withmejoininsert(vo);
	
		
		response.sendRedirect(request.getContextPath() + "/mainboard/mainBoardList.do");
	}
	
	private String extractFileName(Part part) {
	      String fileName = "";
	      
	      String contentDisposition = part.getHeader("content-disposition");
	      String[] items = contentDisposition.split(";");
	      for(String item : items) {
	         if(item.trim().startsWith("filename")) { 
	            // filename = "test1.txt"
	            fileName = item.substring(item.indexOf("=")+2, item.length()-1);
	         }
	         
	      }
	      return fileName;
	   }
	}

	

