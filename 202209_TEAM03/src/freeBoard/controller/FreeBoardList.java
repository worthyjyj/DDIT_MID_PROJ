package freeBoard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeBoardVO;


@WebServlet("/freeboard/freeBoardList.do")
public class FreeBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String sort = request.getParameter("sort");
		
		
		// 서비스 객체 
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// 리스트요청
		List<FreeBoardVO> boardList = service.getAllFreeBoard();
		
//		System.out.println(boardList.size());
		// gson 라이브러리는 ajax로 할 경우에 사용하자
//		Gson gson = new Gson();
//		String jsonData = null; 
		
//		jsonData = gson.toJson(boardList);
		
//		PrintWriter out = response.getWriter();
//		out.write(jsonData);
//		response.flushBuffer();
		
		// 키에 담아
		request.setAttribute("boardList", boardList);
		request.setAttribute("sort", sort);
//		request.setAttribute("selectList", selectList);
		
		// 전송하기
		request.getRequestDispatcher("/WEB-INF/view/free/freeBoardList.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String searchId = request.getParameter("serchId");
		
		// 서비스 객체
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sword", searchId); // 키에 searchWord값을 담기
		
		// 리스트 요청하여 결과값 얻기
		List<FreeBoardVO> searchList = service.selectByTotal(map);
		
		// json 타입 데이터
		Gson gson = new Gson();
		String jsonData = null; // json으로 변환된 데이터가 저장될 변수 선언
		
		jsonData = gson.toJson(searchList);
		System.out.println("검색데이타jsonData ==> " + jsonData);
		
		// 변환된 데이터를 응답으로 보내준다.
		response.getWriter().write(jsonData);
		response.flushBuffer();
	}

	}
