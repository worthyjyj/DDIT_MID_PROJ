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
 * 동행신청 중복 신청 체크하는 서블릿 
 */
@WebServlet("/mainboard/withmecheck")
public class Withmecheck extends HttpServlet {
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
		System.out.println("세션에 들어잇는 동행신청자  멤버 아이디" + PNAME);
		
		String p_name = request.getParameter("p_name"); 
		System.out.println("동행신청하기 버튼이 있는 해당 글을 작성한 작성자 프로필 :" + p_name);
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		System.out.println("게시물 번호 : " + mb_no);
		
		
		
		// map으로 설정
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("PNAME",PNAME); //동행신청자
		map.put("p_name", p_name); //방장 
		map.put("mb_no", mb_no); //게시물번호  
		
		// service객체 얻기 
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		
		// service메소드 호출 - 결과값 저장 
		int res = service.withmecheck(map); 
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
