package vo;

public class ScheduleVO {
	
	private int sch_no;    
	private int _id;
	private String title;
	private String description;
	private String start;
	private String end;
	private String type;
	private String username;
	private String backgroundColor;
	private String textColor;
	private String allDay;
	
	
	
	public int getSch_no() {
		return sch_no;
	}
	public void setCal_no(int cal_no) {
		this.sch_no = cal_no;
	}
	public int get_id() {
	return _id;
	}
	public void set_id(int _id) {
	this._id = _id;
	}
	public String getTitle() {
	return title;
	}
	public void setTitle(String title) {
	this.title = title;
	}
	public String getDescription() {
	return description;
	}
	public void setDescription(String description) {
	this.description = description;
	}
	public String getStart() {
	return start;
	}
	public void setStart(String start) {
	this.start = start;
	}
	public String getEnd() {
	return end;
	}
	public void setEnd(String end) {
	this.end = end;
	}
	public String getType() {
	return type;
	}
	public void setType(String type) {
	this.type = type;
	}
	public String getUsername() {
	return username;
	}
	public void setUsername(String username) {
	this.username = username;
	}
	public String getBackgroundColor() {
	return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
	this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
	return textColor;
	}
	public void setTextColor(String textColor) {
	this.textColor = textColor;
	}
	public String getAllDay() {
	return allDay;
	}
	public void setAllDay(String allDay) {
	this.allDay = allDay;
	}
	
	

}
