package mainBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainJoinVO;


@WebServlet("/mainboard/mainBoardUphit.do")
public class MainBoardUphit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int mb_no = Integer.parseInt(request.getParameter("mb_no"));
		
		ImainBoardService service = MainBoardServiceImpl.getInstance();
		int cnt = service.getMbUphit(mb_no);
		
		if(cnt > 0) {
		 System.out.println(mb_no + "번 게시글 조회수 올리기 성공");	
		}else {
		 System.out.println(mb_no + "번 게시글 조회수 올리기 실패");
		}
		
		
		
	}

}
