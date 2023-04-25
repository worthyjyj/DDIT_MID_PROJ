package member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import vo.FreeReplyVO;
import vo.MainReplyVO;
import vo.ReviewReplyVO;

/***
 * 후기(num=1), 자유(num=2), 메인게시판(num=3)에서 내가 쓴 댓글들 모두 가져옴
 * 
 * @author 신동준
 *
 */

@WebServlet("/myReply.do")
public class MyReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String num=request.getParameter("num");
		System.out.println(num);
		if (num ==null) {
			num = "1";
		}
		
		HttpSession session = request.getSession();
		String PNAME = (String) session.getAttribute("PNAME");

		IMemberService service = MemberServiceImpl.getService();

		if (num.equals("1")) {// 후기게시판
			try {
				List<ReviewReplyVO> list = service.getReviewReply(PNAME);

				request.setAttribute("num", num);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/myPage/myReply.jsp").forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (num.equals("2")) {// 메인게시판
			try {
				List<MainReplyVO> list = service.getMainReply(PNAME);

				request.setAttribute("num", num);
				request.setAttribute("list", list);
				request.getRequestDispatcher("myPage/myReply.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (num.equals("3")) {// 자유게시판
			try {
				List<FreeReplyVO> list = service.getFreeReply(PNAME);
				
				request.setAttribute("list", list);
				request.setAttribute("num", num);
				request.getRequestDispatcher("myPage/myReply.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	
	}

}
