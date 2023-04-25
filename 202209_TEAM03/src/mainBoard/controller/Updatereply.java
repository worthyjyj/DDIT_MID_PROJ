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

import com.google.gson.Gson;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;

/**
 * 댓글을 수정하는 서블릿 
 */
@WebServlet("/mainboard/updatereply.do")
public class Updatereply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		String jsonData = null;
		
		System.out.println(request.getParameter("mcom_no")); 
		System.out.println(request.getParameter("mcom_content")); 
	    
		int mcom_no = Integer.parseInt(request.getParameter("mcom_no")); 
		String mcom_content = request.getParameter("mcom_content"); 
		
		// map으로 설정
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("mcom_no",mcom_no);
		map.put("mcom_content", mcom_content);
		
		// service객체 얻기 
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		
		// service메소드 호출 - 결과값 저장 
		int res = service.modifyReply(map); 
		String result = ""; 
		
		// 결과값 저장 
		if(res > 0) {
			result = "댓글수정성공"; 
			
		}else {
			result = "댓글수정실패"; 
			
		}
		
		System.out.println("result ==> " + result);
		
		PrintWriter out = response.getWriter();
		out.write(result); // JSON데이터를 응답으로 보내준다. 
		response.flushBuffer();
		
		
		
	}

}
