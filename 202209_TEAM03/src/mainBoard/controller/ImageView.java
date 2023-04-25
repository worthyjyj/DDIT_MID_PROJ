package mainBoard.controller;

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

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainBoardVO;
import vo.MainJoinVO;

/**
 * 메인게시판사진
 */
@WebServlet("/images/imageView.do")
public class ImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		
		
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		MainJoinVO vo = service.getOneMainBoard(mb_no);
		
		String imageFile = vo.getMb_pic();
		System.out.println(imageFile);
		if(imageFile==null) imageFile = "하늘.png";
		
		// 이미지가 저장된 폴더 설정 
		// 이거 우리 프로젝트 images 파일에 저장하는건가...? 경로 설정은? 질문!!! 
		String filepath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/mainboard";
		File file = new File(filepath, imageFile);
		
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		if(file.exists()) {	// 이미지 파일이 있을 때...
			try {
				// 출력용 스트림
				bout = new BufferedOutputStream(response.getOutputStream());
				
				// 파일 입력용 스트림
				bin = new BufferedInputStream(new FileInputStream(file));
				
				byte[] temp = new byte[1024];
				int len = 0;
				
				while( (len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
				
				
			} catch (Exception e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if(bin!=null) try { bin.close(); }catch(IOException e) {}
				if(bout!=null) try { bout.close(); }catch(IOException e) {}
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
