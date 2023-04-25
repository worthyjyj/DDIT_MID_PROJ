package withme.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/deleteAcc.do")
public class DeleteAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int acc_no = Integer.parseInt(request.getParameter("acc_no"));
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		int res = service.deleteAcc(acc_no);
		
		
		
		request.getRequestDispatcher("/WEB-INF/view/withme/withmeAccount.jsp").forward(request, response);
//		response.sendRedirect(request.getContextPath() + "/WEB-INF/view/withme/withmeAccount.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
