package reviewBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import reviewBoard.service.IReviewService;
import reviewBoard.service.ReviewServiceImpl;
import vo.ReviewRegionVO;

@WebServlet("/reviewCountry.do")
public class ReviewCountry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		int conNo = Integer.parseInt(request.getParameter("contiNo"));
		
		// 서비스 객체
		IReviewService service = ReviewServiceImpl.getService();
		
		// 국가리스트
		List<ReviewRegionVO> regionList = service.getCountryList(conNo);
		
		// json 타입 데이터
		Gson gson = new Gson();
		String jsonData = null;
		
		jsonData = gson.toJson(regionList);
		System.out.println("국가jsonData ==> " + jsonData);
		
		// 변환된 데이터를 응답으로 보내준다.
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
