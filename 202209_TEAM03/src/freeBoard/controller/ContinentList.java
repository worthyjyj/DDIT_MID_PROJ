package freeBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeSelectOptionVO;


@WebServlet("/freeContinent.do")
public class ContinentList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 서비스객체불러오기
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// 대륙리스트 띄우기
		List<FreeSelectOptionVO> optionList = service.getContiList();
	
		// json 타입 데이터
		Gson gson = new Gson();
		String jsonData = null; // json으로 변환된 데이터가 저장될 변수 선언
		
		jsonData = gson.toJson(optionList);
		System.out.println("대륙jsonData ==> " + jsonData);
		
		// 변환된 데이터를 응답으로 보내준다.
		response.getWriter().write(jsonData);
		response.flushBuffer();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
