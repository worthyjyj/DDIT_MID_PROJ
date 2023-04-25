package withme.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import vo.ChatMessageVO;
import vo.ChatVO;
import vo.DditChatVO;
import withme.service.IWithMeChatService;
import withme.service.WithMeChatServiceImpl;


@ServerEndpoint("/withMeChatServer.do")
public class WithMeChatServer {
	
	//유저 집합 리스트
	//static List<DditChatVO> sessionUsers = Collections.synchronizedList(new ArrayList<DditChatVO>());
	private static Map<String, List<DditChatVO>> sessionUsersMap = 
			Collections.synchronizedMap(new HashMap<String, List<DditChatVO>>());

	private SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
	
	private BufferedOutputStream bos;
//    private String path = "d:/d_other/연습용/";   // 파일이 저장될 폴더 지정
    private String path = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/";   // 파일이 저장될 폴더 지정
    private String fileName = "";
    
	/**
	 * 웹 소켓으로부터 메시지가 오면 호출한다.
	 * @param message 메시지
	 * @param userSession
	 * @throws IOException
	 */
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException{
		
		String username = (String)userSession.getUserProperties().get("username");
		String room = (String) userSession.getUserProperties().get("room");
//		System.out.println("&&&&&& username = " + username);
//		System.out.println("++++++ room = " + room);
		
		// JSON구조의 문자열로 온 메시지를 객체형으로 변환한다.
		Gson gson = new Gson();
		ChatMessageVO chatMessageVo = gson.fromJson(message, ChatMessageVO.class);
//		System.out.println("***" + chatMessageVo);

		// 세션 프로퍼티에 username이 없으면 username을 선언하고 해당 세션으로 메시지를 보낸다.(json 형식이다.)
		// 최초 메시지는 username 설정  
		// onOpen 대신 첫 연결 처리
		if("connect".equals(chatMessageVo.getCommand()) ){
			
			room = chatMessageVo.getRoom();
			if(!sessionUsersMap.containsKey(room)) {
				sessionUsersMap.put(room, new ArrayList<DditChatVO>() );
			}
			DditChatVO newVo = new DditChatVO(null, userSession);
			sessionUsersMap.get(room).add(newVo);
			
			for(DditChatVO chatVo : sessionUsersMap.get(room)){
				if(userSession.equals(chatVo.getSession())){
					chatVo.setName(chatMessageVo.getMessage() );
					userSession.getUserProperties().put("username", chatMessageVo.getMessage() );
					userSession.getUserProperties().put("room", chatMessageVo.getRoom() );
					
					System.out.println(chatMessageVo.getRoom());
					
					ChatVO paramVo = new ChatVO();
					paramVo.setChat_name(chatMessageVo.getMessage());
					paramVo.setWithme_code(Integer.parseInt(chatMessageVo.getRoom()));
					IWithMeChatService service = WithMeChatServiceImpl.getInstance();
					List<ChatVO> chatList = service.getChatList(paramVo);
					
					for(int i = 0; i < chatList.size(); i++) {
						ChatVO cVo = chatList.get(i);
						userSession.getBasicRemote().sendText(buildJsonData(cVo.getChat_name(), cVo.getChat_content(), cVo.getChat_date(), userSession));
					}
					
					// 채팅 방 목록과 해당 방의 멤버 목록을 갱신하는 메서드 호출
//					roomUpdateAll(userSession);
					return;
				}
			}
		}

		// 받은 명령이 메시지일때
		if("message".equals(chatMessageVo.getCommand()) ){
			// username이 있으면 해당 채팅방 전체에게 메시지를 보낸다.
//			System.out.println(chatMessageVo.getMessage());
			sendToAll(room, username, chatMessageVo.getMessage());
		}
		
		// 받은 명령이 파일일때
		if("file".equals(chatMessageVo.getCommand())) {
			
			String msg = chatMessageVo.getMessage();
			
			// 클라이언트에서 파일이 끝났다는 신호로 "end" 문자열을 보낸다.
	        // msg가 end가 아니라면 파일로 연결된 스트림을 연다.
	        if(!msg.equals("end")){
	            UUID uid = UUID.randomUUID();
	        	
	        	fileName = uid + msg.substring(msg.indexOf(":")+1).substring(msg.indexOf("."));
	        	
	            File file = new File(path + fileName);
	            try {
	                bos = new BufferedOutputStream(new FileOutputStream(file));
	            } catch (FileNotFoundException e) {
	                e.printStackTrace();
	            }
	            
	        // msg가 'end'가 왔다면 전송이 완료되었음을 알리는 신호이므로 outputstream을 닫아준다.
	        }else{
	            try {
	                bos.flush();
	                bos.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	            
	            sendToAll(room, username, path + fileName);
	        }
		}
		
	}
	
	// 채팅 방 목록과 해당 방의 멤버 목록을 보내는 메서드
//	public void roomUpdateAll(Session userSession) throws IOException{
//		for(String roomName : sessionUsersMap.keySet()) {
//			for(DditChatVO chatVo : sessionUsersMap.get(roomName)) {
//				if(userSession != chatVo.getSession())
//					chatVo.getSession().getBasicRemote().sendText(buildJsonData(null, null, chatVo.getSession()));
//			}
//		}
//
//	}
	
	/**
	 * 해당 채팅방 전체에게 메시지를 보낸다.
	 * @param room 채팅방이름
	 * @param username 사용자 이름
	 * @param message 메시지
	 * @throws IOException
	 */
	public void sendToAll(String room, String username, String message) throws IOException{
		Date date = new Date();
		
		ChatVO insertVo = new ChatVO();
		insertVo.setWithme_code(Integer.parseInt(room));
		insertVo.setChat_content(message);
		insertVo.setChat_name(username);
		insertVo.setChat_date(sdf.format(date).toString());
		
		IWithMeChatService service = WithMeChatServiceImpl.getInstance();
		int cnt = service.insertChat(insertVo);
		
		// username이 있으면 채팅방 전체에게 메시지를 보낸다.
		if(sessionUsersMap.containsKey(room)) {
			Iterator<DditChatVO> iterator = sessionUsersMap.get(room).iterator();
			while(iterator.hasNext()){
				iterator.next().getSession().getBasicRemote().sendText(buildJsonData(username, message, sdf.format(date).toString(), null));
			}
		}
	}
	
	/**
	 * 웹소켓을 닫으면 해당 유저를 유저리스트에서 뺀다.
	 * @param userSession
	 * @throws IOException */
	@OnClose
	public void handleClose(Session userSession) throws IOException{
		System.out.println(userSession.getId() + "접속 종료...");
		String room = (String) userSession.getUserProperties().get("room");
		
		String delName = null;
		Iterator<DditChatVO> chatIter = sessionUsersMap.get(room).iterator();
		while(chatIter.hasNext()){
			DditChatVO chatVo = chatIter.next();
			if(userSession.equals(chatVo.getSession())){
				delName = chatVo.getName();
				//sessionUsers.remove(chatVo);
				chatIter.remove();
			}
		}
		if(sessionUsersMap.get(room).size() > 0 ) {	
//			sendToAll(room, "System", delName + "님이 퇴장했습니다.");
		}else {
			// 채팅방에 멤버가 하나도 없으면 채팅방을 삭제한다.
			if(!"전체".equals(room)) {
				sessionUsersMap.remove(room);
			}
		}
		
		// 채팅 방 목록과 해당 방의 멤버 목록을 갱신하는 메서드 호출
//		roomUpdateAll(userSession);
		
	}
	
	/**
     * 웹 소켓이 에러가 나면 호출되는 이벤트
     * @param t
     */
    @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
    
	
	/**
	 * json타입의 메시지 만들기
	 * @param username
	 * @param message
	 * @return
	 */
	public String buildJsonData(String username, String message, String date, Session userSession){
		Gson gson = new Gson();
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		if(message!=null) {
			jsonMap.put("message", username + " : " + message + " : " + date);
		}
		
		String strJson = gson.toJson(jsonMap);
//		System.out.println("strJson = " + strJson);
		
		return strJson;
	}
	
	// 바이너리 데이터가 오게되면 호출된다.
    @OnMessage
    public void processUpload(ByteBuffer msg, boolean last, Session session) {
        
        while(msg.hasRemaining()){
            try {
                bos.write(msg.get());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
}





