package mainBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainReplyVO;

/**
 * 메인게시판 해당 게시글에 댓글 리스트를 불러오는 서블릿 
 */
@WebServlet("/mainboard/mainReplyList.do")
public class MainReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//응답데이터가 JSON일때의 ContentType 설정 
				response.setContentType("application/json; charset=utf-8");
				
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
	
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		
		List<MainReplyVO> list = service.getMBreplyList(mb_no);
		
		
		Gson gson = new Gson(); 
		
		String jsonData = null;  
		
		jsonData = gson.toJson(list);
		
		System.out.println("jsonData ==> " + jsonData);
		
		PrintWriter out = response.getWriter();
		out.write(jsonData); // JSON데이터를 응답으로 보내준다. 
		response.flushBuffer();
	}

}
