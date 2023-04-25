package noticeBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeBoard.service.INoticeBoardService;
import noticeBoard.service.NoticeBoardServiceImpl;
import vo.noticeBoardVO;

/**
 * Servlet implementation class NoticeBoardDetail
 */
@WebServlet("/noticeBoardDetail.do")
public class NoticeBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("notice_no"));
		
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
		
		service.updateHit(no);
		
		noticeBoardVO nvo = service.detailNotice(no);
		
		request.setAttribute("nvo", nvo);
		
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeBoardDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
