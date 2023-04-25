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

@WebServlet("/reviewboard/reviewBoardModify.do")
@MultipartConfig
public class ReviewBoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원  ID에 맞는 회원 정보를 검색하여 회원 정보 수정폼에 보낸다.
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int rev_num = Integer.parseInt(request.getParameter("revNo"));
		IReviewService service = ReviewServiceImpl.getService();
		ReviewBoardVO rvo = service.getDetailReview(rev_num);
		
		request.setAttribute("rvo", rvo);
		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardModify.jsp")
					.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// POST 방식으로 요청할 때는 입력한 회원 정보를 받아서 프로필 사진을 저장하고
		// DB의 회원 정보를 수정한다.
		
		// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
		String uploadPath = "d:/d_other/uploadFiles";
		
		// 저장될 폴더가 없으면 폴더를 만들어준다.
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		// 회원 정보를 받는다.
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		System.out.println("rev_no : " + rev_no);
		
		String rev_title = request.getParameter("rev_title");
		System.out.println("rev_title : " + rev_title);
				
		String rev_content = request.getParameter("rev_content");
		System.out.println("rev_content : " + rev_content);
				
		HttpSession session = request.getSession();
		String p_name = (String) session.getAttribute("PNAME"); 
		System.out.println(p_name);
		
//		int old_regNo = Integer.parseInt(request.getParameter("old_regNo"));
				
		String old_regNo = request.getParameter("old_regNo");
		System.out.println("old_regNo : " + old_regNo);
		String regNo = request.getParameter("cityNoHidden");
		int reg_no = Integer.parseInt(regNo);
		
//		String regNo="";
//		try {
//				regNo = request.getParameter("cityNoHidden");
//			
//		} catch (NumberFormatException e) {
//				regNo = old_regNo;
//		}
//		int reg_no = Integer.parseInt(regNo);
		System.out.println("reg_no");
//		System.out.println("regNo : " + regNo);
		
//		if(regNo == null || regNo == "") regNo=old_regNo;
//		System.out.println("대체값 regNo : " + regNo);
		
//		int reg_no = Integer.parseInt(regNo);
		
//		System.out.println("Modify의 reg_no" + reg_no);
				
		String old_pic = request.getParameter("old_pic");
		System.out.println("old_pic" + old_pic);
				
		// 회원 정보를 VO에 저장한다.
		ReviewBoardVO rvo = new ReviewBoardVO();
		rvo.setRev_no(rev_no);
		rvo.setRev_title(rev_title);
		rvo.setRev_content(rev_content);
		rvo.setP_name(p_name);
		rvo.setReg_no(reg_no);
		rvo.setRev_pic(old_pic);		// 이전 프로필 사진으로 세팅
		
		// form의 file입력요소의 name값은 Part객체의 이름역할을 한다.
		// 이 이름을 이용하여 Part객체를 구한다.
		Part part = request.getPart("old_pic");
		
		if(part != null) {
			String fileName = extractFilename(part);							//=> 파일 이름을 원본이름으로 저장하라
			
			if(!"".contentEquals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);		//=> 'uploadPath'에 'File.separator + fileName'이름으로 저장하라 
					rvo.setRev_pic(fileName);;	// DB에 저장할 파일명을 VO객체에 저장
				} catch (Exception e) {
					//memVo.setMem_photo(null);  // 프로필 사진이 오류가 있으면...		//=> 오류 발생시 이전 포토가 그대로 나오게 하기 위해 주석처리함
					rvo.setRev_pic(old_pic);
				}
			}
		}
		
		// 회원 정보를 DB에 insert한다.
		IReviewService service = ReviewServiceImpl.getService();
		service.updateReview(rvo);
		
		// 작업이 완료되면 List페이지로 이동  //=> (자동으로 이동하게 하기 위함)
		response.sendRedirect(request.getContextPath()+"/reviewboard/reviewBoardList.do");
				
		
	}
		
		// Pat구조 안에서 파일명을 찾는 메서드
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








