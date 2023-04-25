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
 * 선택한 게시글을 찜목록에 추가하는 서블릿 
 */
@WebServlet("/mainboard/pick.do")
public class Pick extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		String jsonData = null;
		
		
		String PNAME = request.getParameter("p_name"); //세션에 들어있는 p_name
		System.out.println("이게 널이라는거임? 지금? " + PNAME);
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		System.out.println("게시물 번호 : " + mb_no);
		
		
		
		// map으로 설정
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("PNAME",PNAME); 
		map.put("mb_no", mb_no); //게시물번호  
		
		// service객체 얻기 
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		
		// service메소드 호출 - 결과값 저장 
		int res = service.insertpick(map); 
		String result = ""; 
		
		// 결과값 저장 
		if(res > 0) {
			result = "성공"; 
			
		}else {
			result = "실패"; 
			
		}
		
		System.out.println("result ==> " + result);
		
		PrintWriter out = response.getWriter();
		out.write(result); // text데이터를 응답으로 보내준다. 
		response.flushBuffer();
	}

}
