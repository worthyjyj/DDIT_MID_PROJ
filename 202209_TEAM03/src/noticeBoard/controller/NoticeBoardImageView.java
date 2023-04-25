package noticeBoard.controller;

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

import noticeBoard.service.INoticeBoardService;
import noticeBoard.service.NoticeBoardServiceImpl;
import vo.noticeBoardVO;

/**
 * Servlet implementation class NoticeBoardImageView
 */
@WebServlet("/noticeBoardImageView.do")
public class NoticeBoardImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("notice_no"));
		
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
		noticeBoardVO nvo = service.detailNotice(no);
		
		String imageFile = nvo.getNotice_pic();
		
		if(imageFile == null) imageFile = "프으사아.jpg";
		
		String filepath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/profile";
		File file = new File(filepath, imageFile);
		
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		if(file.exists()) {
			try {
				bout = new BufferedOutputStream(response.getOutputStream());
				bin = new BufferedInputStream(new FileInputStream(file));
				
				byte[] temp = new byte[1024];
				int len = 0;
				
				while( (len = bin.read(temp)) > 0 ) {
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
	}

}
