package reviewBoard.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewBoardVO;

/**
 * Servlet implementation class ReviewImage
 */
@WebServlet("/reviewBoard/ReviewImage.do")
public class ImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		IReviewService service = ReviewServiceImpl.getService();
		
		ReviewBoardVO rvo = service.getDetailReview(rev_no);
		

		String imageFile = rvo.getRev_pic();
		
		if(imageFile == null) imageFile = "noImage.jpg";
		// 이미지가 저장된 폴더 설정
		
		String filepath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/reviewboard";
		/* String filepath = "c:/freeBoardPic"; */
		File file = new File(filepath, imageFile);
		
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		if(file.exists()) {
		
		try {
			
			// 파일 입력용 스트림 객체 생성
			bin = new BufferedInputStream(new FileInputStream(file));
			
			
			// 출력용 스트림 객체 생성
			bout = new BufferedOutputStream(response.getOutputStream());
			
			
			byte[ ] temp = new byte[1024];
			int len = 0;
			
			while( (len = bin.read(temp) ) > 0) {
				bout.write(temp, 0, len);
			}
			bout.flush();
			
			
		} catch (Exception e) {
			System.out.println("입출력 오류 : " + e.getMessage());
		}finally {
			if(bin != null) try { bin.close(); } catch(IOException e) { }
			if(bout != null) try { bout.close(); } catch(IOException e) { }
			}
		
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
