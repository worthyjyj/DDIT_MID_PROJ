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
import vo.FreeBoardVO;
import vo.FreeReplyVO;
import vo.MainBoardVO;
import vo.MainReplyVO;
import vo.ReviewBoardVO2;
import vo.ReviewReplyVO;

/***
 * 
 * 여기서 내가 쓴(후기, 자유, 메인) 게시판들을 한번에 볼수 있음!
 * 
 * @author 신동준
 *
 */
@WebServlet("/myWrite.do")
public class MyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String num=request.getParameter("num");
		System.out.println("myWrite.do 의 num : "+num);
		if (num ==null) {
			num = "1";
		}
		
		HttpSession session = request.getSession();
		String PNAME = (String) session.getAttribute("PNAME");
		
		IMemberService service = MemberServiceImpl.getService();

		if (num.equals("1")) {// 후기게시판
			try {
				List<ReviewBoardVO2> list = service.getReviewBoard(PNAME);

				request.setAttribute("num", num);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/myPage/myWrite.jsp").forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (num.equals("2")) {// 메인게시판
			try {
				List<MainBoardVO> list = service.getMainBoard(PNAME);

				request.setAttribute("num", num);
				request.setAttribute("list", list);
				request.getRequestDispatcher("myPage/myWrite.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (num.equals("3")) {// 자유게시판
			try {
				List<FreeBoardVO> list = service.getFreeBoard(PNAME);
				
				request.setAttribute("list", list);
				request.setAttribute("num", num);
				request.getRequestDispatcher("myPage/myWrite.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
