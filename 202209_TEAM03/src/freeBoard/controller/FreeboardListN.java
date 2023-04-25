package freeBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeBoardVO;

/**
 * 메인페이지로 이동시 자유게시판 리스트 불러옥; 
 */
@WebServlet("/freeboard/freeboardListN.do")
public class FreeboardListN extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 서비스 객체 불러오기
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// mainindex에 자유게시글 등록순으로 db에서 리스트 불러오기
		List<FreeBoardVO> mainList = service.getAllFreeBoard();
		
		// JSON라이브러리 객체 생성  - ajax 사용시
		Gson gson = new Gson(); 
		
		// json으로 변환된 데이터가 저장될 변수 선언
		String jsonData = null;  
		
		jsonData = gson.toJson(mainList);
		
		System.out.println("jsonData ==> " + jsonData);
		
		PrintWriter out = response.getWriter();
		out.write(jsonData); // JSON데이터를 응답으로 보내준다. 
		response.flushBuffer();
	}

}
