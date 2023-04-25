package mainBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainJoinVO;

/**
 * 리스트 창의 정렬탭에 검색조건을 달아 리스트를 반환하는 메서드 
 */
@WebServlet("/mainboard/sortList.do")
public class SortList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String reg_no = request.getParameter("reg_no"); 
		String sdate = request.getParameter("sdate"); 
		String edate = request.getParameter("edate");
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		map.put("reg_no", reg_no);
		map.put("sdate", sdate);
		map.put("edate", edate);
		
		System.out.println(sdate);
		System.out.println(edate);
		System.out.println("지역 번호 잘 보내나여?" +reg_no);
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson(); 
		
		String jsonData = null;  
		
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		List<MainJoinVO> list = service.mainBoardListsort(map);
		
		jsonData = gson.toJson(list);
		
		System.out.println("jsonData ==> " + jsonData);
		
		PrintWriter out = response.getWriter();
		out.write(jsonData); // JSON데이터를 응답으로 보내준다. 
		response.flushBuffer();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
