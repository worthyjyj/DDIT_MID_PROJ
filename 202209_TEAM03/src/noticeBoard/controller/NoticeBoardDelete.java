package noticeBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeBoard.service.INoticeBoardService;
import noticeBoard.service.NoticeBoardServiceImpl;

/**
 * Servlet implementation class NoticeBoardDelete
 */
@WebServlet("/noticeBoardDelete.do")
public class NoticeBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("notice_no"));
		
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
		service.deleteNotice(no);
		
		response.sendRedirect(request.getContextPath() + "/noticeBoardList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
