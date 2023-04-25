package withme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.AccountVO;
import withme.dao.IWithMeChatDao;
import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/updateAcc.do")
public class UpdateAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		AccountVO accVo = new AccountVO();
		accVo.setAcc_no(Integer.parseInt(request.getParameter("acc_no")));
		accVo.setAcc_date(request.getParameter("acc_date"));
		accVo.setAcc_content(request.getParameter("acc_cont"));
		accVo.setAcc_withdraw(Integer.parseInt(request.getParameter("acc_draw")));
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		service.updateAcc(accVo);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
