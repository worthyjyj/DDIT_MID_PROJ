package mainBoard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainJoinVO;

/**
 * 동행게시판 댓글 등록 
 */
@WebServlet("/mainboard/mainReply.do")
public class MainReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("mb_no")); 
		System.out.println(request.getParameter("content")); 
		
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
//		
		//페이지 이동할 때 mb_no를 넘겨줘야 페이지를 열 수 있음  
		request.setAttribute("mb_no", mb_no);
//		
		request.getRequestDispatcher("/mainboard/mainBoardDetail.do")
		.forward(request, response); 
	
	
//		response.sendRedirect(request.getContextPath()+"/mainboard/mainBoardDetail.do");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		
		HttpSession session = request.getSession();  
		String p_name = (String) session.getAttribute("PNAME");
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		String content = request.getParameter("content");
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("mb_no", mb_no);
		map.put("content", content);
		map.put("p_name",p_name);
		
		int cnt = service.insertMainReply(map); // insert하고 그냥 돌아감
		System.out.println(cnt);
		
//		request.setAttribute("mb_no", mb_no); //request에 post가 남아있어서 안보내지는 것 같음
//		
//		request.getRequestDispatcher("/mainboard/mainBoardDetail.do")
//		.forward(request, response); 
		
		response.sendRedirect(request.getContextPath() + "/mainboard/mainBoardDetail.do?mb_no="+mb_no);
	}
}
