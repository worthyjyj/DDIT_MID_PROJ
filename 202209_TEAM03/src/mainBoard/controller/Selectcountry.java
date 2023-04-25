package mainBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mainBoard.service.ImainBoardService;
import mainBoard.service.MainBoardServiceImpl;
import vo.MainRegionVO;


/**
 * 대륙번호를 인자로 받아 그에 해당하는 나라들을 반환하는 서블릿
 */

@WebServlet("/mainboard/selectcountry.do")
public class Selectcountry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setCharacterEncoding("utf-8");
	      
	      //응답데이터가 JSON일때의 ContentType 설정 
	      response.setContentType("application/json; charset=utf-8");
	      
	      int conti_no = Integer.parseInt(request.getParameter("conti_no"));
	      
	      System.out.println("엥?" + conti_no); 
	      
	      ImainBoardService service = MainBoardServiceImpl.getInstance();
	      
	      // JSON라이브러리 객체 생성 
	      Gson gson = new Gson(); 
	      
	      // json으로 변환된 데이터가 저장될 변수 선언
	      String jsonData = null;  
	      
	      List<MainRegionVO> list = service.getallcountry(conti_no);

	      //왜 데이터를 못받아 오는 걸까,,,,뭐가 문제지,,,,
	      
	      jsonData = gson.toJson(list);
	      
	      System.out.println("jsonData ==> " + jsonData);
	      
	      PrintWriter out = response.getWriter();
	      out.write(jsonData); // JSON데이터를 응답으로 보내준다. 
	      response.flushBuffer();
	      request.setCharacterEncoding("utf-8");

	}

	

}
