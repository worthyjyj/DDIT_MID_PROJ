
package member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

@WebServlet("/MailTest2.do")
public class MailTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String host = "smtp.naver.com";
		String user = "shin528s@naver.com"; // 자신의 네이버 계정
		String password = "qudtls12";// 자신의 네이버 패스워드
		
		String idvalue=request.getParameter("id");
		String email=request.getParameter("email");
		
		System.out.println(idvalue);
		System.out.println(email);
		
		IMemberService service=MemberServiceImpl.getService();
		
		Map<String ,Object> map=new HashMap<>();
		map.put("id", idvalue);
		map.put("email", email);
		
		int answer=0;//성공 유무
		try {
			String researchPW=service.searchPw(map);
			if(researchPW!=null) {
				// 메일 받을 주소
				String to_email = email;
				
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.debug", "true");
				
				
				StringBuffer temp = new StringBuffer();
				Random rnd = new Random();
				for (int i = 0; i < 10; i++) {
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				String AuthenticationKey = temp.toString();
				System.out.println(AuthenticationKey);

				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user, password);
					}
				});
				
				
				try {
					MimeMessage msg = new MimeMessage(session);
					msg.setFrom(new InternetAddress(user, "동행관리자"));
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

					// 메일 제목
					msg.setSubject("안녕하세요  동행입니다.");
					// 메일 내용
					msg.setText("회원님의 비밀번호는 " + researchPW+"입니다.\n비밀번호가 노출 될수도 있으니 빠른 시일 내에 변경 부탁드립니다."
							+ "\n회원님의 편의를 위해 최선을 다하는 동행이 되겠습니다.\n감사합니다.\n\n(주)동행 관리자 일동");

					Transport.send(msg);
					System.out.println("이메일 전송");
					answer=1;
					
					response.sendRedirect(request.getContextPath()+"/log/searchPw.jsp?answer="+answer);
				} catch (Exception e) {
					e.printStackTrace();
				}
				HttpSession saveKey = request.getSession();
				saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
			}else {//pw가 널일떄
				answer=0;
				response.sendRedirect("/log/searchPw.jsp?answer="+answer);
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
		
		
	
		
	}
}