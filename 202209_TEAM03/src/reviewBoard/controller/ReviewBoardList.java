package reviewBoard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewBoardVO;
import vo.ReviewBoardVO2;


@WebServlet("/reviewboard/reviewBoardList.do")
public class ReviewBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		IReviewService service = ReviewServiceImpl.getService();
		List<ReviewBoardVO> reviewList = service.getAllReview();
		
		
     	//모든 리뷰게시판글의 정보를 가저온다
		List<ReviewBoardVO2> reviewList2 = service.getAllReview2();
		
		//regno revno 진짜 너무헷갈린다 씨부레것
		//왜 안나오지 정상출력이되니까 리스트에 쫙 뿌려지는데...?
//		for(int i=0; i<reviewList.size(); i++) {
//			System.out.println(reviewList.get(i).getReg_no());
//			String[]city=service.getCityName();
//			
//		}
		
		System.out.println("reviewList의 갯수 : "+reviewList.size());//이번엔 얘가 안나오네
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("reviewList2", reviewList2);
		
		
//		int reg_no = request.getParameter("");
//		ReviewRegionInfoVO rivo = service.getRegionInfo(reg_no);
		
		request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardList.jsp")
					.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IReviewService service = ReviewServiceImpl.getService();
		List<ReviewBoardVO> reviewList = service.getAllReview();
		List<ReviewBoardVO2> reviewList2 = service.getAllReview2();
		
		String regNo = request.getParameter("cityNoHidden");
		int reg_no = Integer.parseInt(regNo);
		System.out.println(reg_no);
		String date1 = request.getParameter("startDate");
		String date2 = request.getParameter("endDate");
		
		//
		
		if((regNo==null || regNo=="")||(date1==null || date1=="")||(date2==null || date2=="")) {
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("reviewList2", reviewList2);
			
			request.getRequestDispatcher("/WEB-INF/view/review/reviewBoardList.jsp")
			.forward(request, response);
		}
		
		//
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reg_no", reg_no);
		map.put("startDate", date1);
		map.put("endDate", date2);
		
		List<ReviewBoardVO> reviewList3 = service.getReview(map);
		
//		List<ReviewBoardVO> reviewList3 = service.getReview(map);
		
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("reviewList2", reviewList2);
		request.setAttribute("reviewList3", reviewList3);
		
		request.getRequestDispatcher("/WEB-INF/view/review/reviewSearchList.jsp")
		.forward(request, response);
		
		
	}

}
