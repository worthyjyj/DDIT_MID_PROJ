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
import member.service.IMemberService;
import member.service.MemberServiceImpl;
import vo.MainJoinVO;
import vo.MemberVO;

/**
 * 게시글 수정하여 리스트 창으로 보내는 서블릿 
 */
@WebServlet("/mainboard/mainBoardupdate.do")
@MultipartConfig(
fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 100
)
public class MainBoardupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST방식으로 요청할 때는 수정한 회원 정보를 받아서 프로필 사진을 저장하고
				// DB의 회원 정보를 수정한다.
				
				// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
				String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/mainboard";
				
				// 저장될 폴더가 없으면 폴더를 만들어 준다.
				File uploadDir = new File(uploadPath);
				if(!uploadDir.exists()) {
					uploadDir.mkdirs();
				}
				
				request.setCharacterEncoding("utf-8");
				
				int mb_no = Integer.parseInt(request.getParameter("mb_no"));
				System.out.println("값 잘 넘어오니?" + mb_no);
				
				String mb_title = request.getParameter("mb_title");
				System.out.println("값 잘 넘어오니?" + mb_title);
				
				String mb_content = request.getParameter("mb_content");
				System.out.println("값 잘 넘어오니?" + mb_content);
				
				mb_content = mb_content.replace("\r\n", "<br>");
				System.out.println("값 잘 넘어오니?" + mb_content);
				
				String mb_sdate = request.getParameter("mb_sdate"); 
				System.out.println("값 잘 넘어오니?" + mb_sdate);
				
				String mb_edate = request.getParameter("mb_edate"); 
				System.out.println("값 잘 넘어오니?" + mb_edate);
				
				int reg_no = Integer.parseInt(request.getParameter("reg_no"));
				System.out.println("값 잘 넘어오니?" + reg_no);
				
				
				String old_pic = request.getParameter("old_mbpic");
				
				MainJoinVO vo = new MainJoinVO(); 
				vo.setMb_no(mb_no);
				vo.setMb_title(mb_title);
				vo.setMb_content(mb_content);
				vo.setMb_sdate(mb_sdate);
				vo.setMb_edate(mb_edate);
				vo.setReg_no(reg_no);
				vo.setMb_pic(old_pic); // 일단 이전 프로필 사진으로 셋팅한다.
				
				
				// form의 file입력요소의 name값은 Part객체의 이름역할을 한다.
				// 이 이름을 이용하여 Part객체를 구한다.
				Part part = request.getPart("mb_pic");
				
				if(part!=null) {
					String fileName = extractFilename(part);
					
					if(!"".equals(fileName)) {
						try {
							part.write(uploadPath + File.separator + fileName);
							
							vo.setMb_pic(fileName);
						} catch (Exception e) {
//							memVo.setMem_photo(null);  // 프로필 사진이 오류가 생기면...
						}
					}
				}
				
				ImainBoardService service = MainBoardServiceImpl.getInstance();
				service.updateMainBoard(vo);
				
				// 메인보드 리스트창으로 이동하는 서블릿 
				request.getRequestDispatcher("/WEB-INF/view/main/withBoardList.jsp")
				.forward(request, response);
						
						
				
	}
	
	// Part구조 안에서 파일명을 찾는 메서드
		private String extractFilename(Part part) {
			String fileName = "";
			
			String contentDisposition = part.getHeader("content-disposition");
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
