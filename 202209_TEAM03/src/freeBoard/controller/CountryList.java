package freeBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeSelectOptionVO;


// 국가 불러오기
@WebServlet("/freeboard/countryList.do")
public class CountryList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		int contiNo = Integer.parseInt(request.getParameter("contiNo"));
		
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		List<FreeSelectOptionVO> countList =  service.getCountryList(contiNo);
		
		// json 타입 데이터
		Gson gson = new Gson();
		String jsonData = null; // json으로 변환된 데이터가 저장될 변수 선언
		
		jsonData = gson.toJson(countList);
		System.out.println("국가jsonData ==> " + jsonData);
		
		// 변환된 데이터를 응답으로 보내준다.
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
