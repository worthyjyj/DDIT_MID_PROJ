package noticeBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeBoard.service.INoticeBoardService;
import noticeBoard.service.NoticeBoardServiceImpl;
import vo.noticeBoardVO;


/**
 * Servlet implementation class NoticeBoardList
 */
@WebServlet("/noticeBoardList.do")
public class NoticeBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
		
		List<noticeBoardVO> noticeList = service.getNoticeAll();

		request.setAttribute("noticeList", noticeList);

		request.getRequestDispatcher("WEB-INF/view/notice/noticeBoardList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}