package reviewBoard.controller;

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

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewBoardVO;

@WebServlet("/reviewBoardInsert.do")
@MultipartConfig
public class ReviewBoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
		String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/reviewboard";
		
		// 저장될 폴더가 없으면 폴더를 만들어준다.
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		request.setCharacterEncoding("UTF-8");
		
		// 회원 정보를 받는다.
		String rev_title = request.getParameter("rev_title");
		
		String rev_content = request.getParameter("rev_content");
		rev_content = rev_content.replace("\r\n", "<br>");
		
		HttpSession session = request.getSession();
		String p_name = (String) session.getAttribute("PNAME");  //????
		
		int reg_no = Integer.parseInt(request.getParameter("cityNoHidden"));
		
		// 회원 정보를 DB에 저장한다.
		ReviewBoardVO rvo = new ReviewBoardVO();
		rvo.setRev_title(rev_title);
		rvo.setRev_content(rev_content);
		rvo.setP_name(p_name);
		rvo.setReg_no(reg_no);
		
//		System.out.println(rvo);
		
		// form의 file입력요소의 name값은 Part객체의 이름역할을 한다.
		// 이 이름을 이용하여 Part객체를 구한다.
		Part part = request.getPart("rev_pic");
		
		if(part != null) {
			String fileName = extractFilename(part);
			
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath+File.separator +fileName);  //=> 'uploadPath'에 'File.separator + fileName'이름으로 저장하라
				
					rvo.setRev_pic(fileName);		//DB에 저장할 파일명을 VO객체에 저장
				} catch (Exception e) {
					rvo.setRev_pic(null);				// 프로필 사진에 오류가 있을 경우
				}
			}
		}
		
		// 회원 정보를 DB에 insert
		IReviewService service = ReviewServiceImpl.getService();
		service.insertReview(rvo);
		
		// 작업이 완료되면 ReviewList페이지로 이동
		response.sendRedirect(request.getContextPath() + "/reviewboard/reviewBoardList.do");

		
	}
	
	// Part구조 안에서 파일명을 찾는 메서드
		private String extractFilename(Part part) {
		String fileName = "";
		
		String contentDisposition = part.getHeader("content-disposition");		//=> 위의 content-disposition :  ,content-type : 등(':'왼쪽편에 있는 것)이 Header이다. 
		String[] items = contentDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				// filename="test1.txt"
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		return fileName;
		}
}
