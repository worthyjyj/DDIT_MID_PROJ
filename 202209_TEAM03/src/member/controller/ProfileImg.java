package member.controller;

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
import javax.servlet.http.HttpSession;

import vo.Profile;

@WebServlet("/profileImg.do")
public class ProfileImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Profile pVo = (Profile) session.getAttribute("profile");
		String imageFile = pVo.getP_pic();
		
		// 이미지가 저장된 폴더 설정
		String filepath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/profile";
		
		// 업로드할 파일경로에 이미지 넣기
		File file = new File(filepath, imageFile); // 프로필경로에 /imageFile을 붙인다.
		
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
