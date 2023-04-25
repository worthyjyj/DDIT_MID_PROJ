package withme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import vo.AccountVO;
import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;

@WebServlet("/insertAcc.do")
public class InsertAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		AccountVO aVo = new AccountVO();
		aVo.setAcc_date(request.getParameter("date"));
		
		String cont = request.getParameter("cont");
		if(cont == null || "".equals(cont)) {
			cont = "예산";
		}
		
		aVo.setAcc_content(cont);
		aVo.setAcc_withdraw(Integer.parseInt(request.getParameter("draw")));
		aVo.setWithme_code(Integer.parseInt(request.getParameter("room")));
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		
		int bal = service.insertAcc(aVo);
		
		Gson gson = new Gson();
		String json = gson.toJson(bal);
		PrintWriter out = response.getWriter();
		out.write(json);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
