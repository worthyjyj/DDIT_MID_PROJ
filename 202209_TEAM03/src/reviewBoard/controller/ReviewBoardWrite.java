package reviewBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewBoardVO;

@WebServlet("/reviewboard/reviewBoardWrite.do")
public class ReviewBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewBoardWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardWrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String revTitle = request.getParameter("title");
		String revContent = request.getParameter("content");
		revContent = revContent.replace("\r\n", "<br>");
		String revPic = request.getParameter("photo");
		
		HttpSession session = request.getSession();
		String pName = (String) session.getAttribute("PNAME");
		
		int regNo = Integer.parseInt(request.getParameter("regNo"));
		
		ReviewBoardVO vo = new ReviewBoardVO();
		
		vo.setRev_title(revTitle);
		vo.setRev_content(revContent);
		vo.setRev_pic(revPic);
		vo.setP_name(pName);
		vo.setReg_no(regNo);
		
		IReviewService service = ReviewServiceImpl.getService();
		
		service.insertReview(vo);
		
		response.sendRedirect(request.getContextPath()+"/reviewboard/reviewBoardWrite.do");
		
	}

}
