package vo;

public class ChatVO {
	private int chat_no;
	private String chat_content;
	private String chat_pic;
	private String chat_name;
	private String chat_date;
	private int withme_code;
	
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public String getChat_pic() {
		return chat_pic;
	}
	public void setChat_pic(String chat_pic) {
		this.chat_pic = chat_pic;
	}
	public String getChat_name() {
		return chat_name;
	}
	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}
	public String getChat_date() {
		return chat_date;
	}
	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}
	public int getWithme_code() {
		return withme_code;
	}
	public void setWithme_code(int withme_no) {
		this.withme_code = withme_no;
	}
}
