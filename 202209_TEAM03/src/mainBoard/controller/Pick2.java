package mainBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;

/**
 * 찜 상태 체크하는 서블릿
 */
@WebServlet("/mainboard/pick2.do")
public class Pick2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		String jsonData = null;
		
		
		HttpSession session = request.getSession();  
		String PNAME = (String) session.getAttribute("PNAME");
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		System.out.println("게시물 번호 : " + mb_no);
		
		
		
		// map으로 설정
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("PNAME",PNAME); 
		map.put("mb_no", mb_no); //게시물번호  
		
		// service객체 얻기 
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		
		// service메소드 호출 - 결과값 저장 
		int res = service.pickcheck(map); 
		String result = ""; 
		
		// 결과값 저장 
		if(res > 0) {
			result = "중복"; 
			
		}else {
			result = "중복아님"; 
			
		}
		
		System.out.println("result ==> " + result);
		
		PrintWriter out = response.getWriter();
		out.write(result); // text데이터를 응답으로 보내준다. 
		response.flushBuffer();
	}

}
