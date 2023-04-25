package member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import vo.Profile;

/**
 * 
 * 프로필 정보를 저장할 서블릿
 * 
 * @author 신동준
 *
 */
@WebServlet("/proJoin.do")
@MultipartConfig(
fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 100
)
public class ProJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/profile";
		//String uploadPath = "192.168.145.32/공유폴더/자바고급과제/조별과제/3조이미지/";
		String picname=request.getParameter("picname");
		String picture=request.getParameter("picture");
		String introduce=request.getParameter("introduce");
		String id=request.getParameter("mem_id");
		
		IMemberService service=MemberServiceImpl.getService();
		int reg=0;
		try {
			reg=service.searchReg(id);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		Date date=new Date();
		SimpleDateFormat simple=new SimpleDateFormat("yyyy");
		int year=Integer.parseInt(simple.format(date));
		//System.out.println("현재 년도 : "+year);
		
		//System.out.println("주민번호 : "+reg);
		
		String regg=""+reg;//주민번호 숫자를 문자열로 치환
		String reg1="";//나이값 구할려고함
		String gender="";//성별값 구할려고함
		
		//System.out.println("주민번호 년도 : "+regg.substring(0, 2));
		
		String myYear="";
		if(Integer.parseInt(regg.substring(0, 2))<100){
			myYear="19"+Integer.parseInt(regg.substring(0, 2));
		}
		
		
		if(regg.substring(6).equals("1")) {
			gender="남자";
		}else if(regg.substring(6).equals("2")) {
			gender="여자";
		}
		int myAge=0;
		System.out.println("현재연도 : "+year);
		System.out.println("내가 태어난 연도 : "+myYear);
		System.out.println("성별 : "+gender);
		myAge=(year-Integer.parseInt(myYear))+1;
		System.out.println("내 나이 : "+(myAge));
		
		// 프로필
		Profile pro = new Profile(); 
		
		pro.setP_name(picname);
		pro.setMem_id(id);
		pro.setP_gen(gender);//성별
		pro.setP_age(myAge);//나이
		pro.setP_info(introduce);
		
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		Part part = request.getPart("picture");
		
		if(part != null) {
			String fileName = extractFileName(part);	// 파일명 구하기
			String saveFileName = "";
			// 찾는 파일명이 빈문자열("")이면 이것은 파일이 아닌 일반 파라미터라는 의미이다.
			if(!"".equals(fileName)) {	// 파일인지 검사
				
				saveFileName = picname + fileName.substring(fileName.indexOf("."));
				
				// 파일 저장하기
				try {
					// part.write()메서드를 이용하여 upload된 파일을 저장한다.
					// 형식) part.write("저장할 경로/저장할 파일명")
					part.write(uploadPath + File.separator + saveFileName);	// 파일 저장
				} catch (IOException e) {
					pro.setP_pic(null);	// 프로필 사진에 오류가 생기면 null
				}
				
			} // if문 끝
			
			pro.setP_pic(saveFileName);
		}
		
		Object obj=null;
		int ans=0;
		try {
			obj=service.proInsert(pro);
			if(obj==null) {
				ans=0;
				System.out.println("프로필 성공!");
			}else {
				ans=1;
				System.out.println("프로필 실패 ㅠㅠ");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String answer=String.valueOf(ans);
		request.setAttribute("answer", answer);
		request.getRequestDispatcher("log/profil.jsp").forward(request, response);
		//response.sendRedirect("log/profil.jsp?answer="+answer);
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
