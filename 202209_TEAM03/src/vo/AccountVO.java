package vo;

public class AccountVO {
	private int withme_code;
	private int acc_no;
	private String acc_content;
	private String acc_date;
	private int acc_withdraw;
	private int acc_balance;
	
	public int getWithme_code() {
		return withme_code;
	}
	public void setWithme_code(int withme_code) {
		this.withme_code = withme_code;
	}
	public int getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
	}
	public String getAcc_content() {
		return acc_content;
	}
	public void setAcc_content(String acc_content) {
		this.acc_content = acc_content;
	}
	public String getAcc_date() {
		return acc_date;
	}
	public void setAcc_date(String acc_date) {
		this.acc_date = acc_date;
	}
	public int getAcc_withdraw() {
		if(acc_date == null) {
			acc_date = "-";
		}else {
			acc_date = acc_date.split(" ")[0];
		}
		return acc_withdraw;
	}
	public void setAcc_withdraw(int acc_withdraw) {
		this.acc_withdraw = acc_withdraw;
	}
	public int getAcc_balance() {
		return acc_balance;
	}
	public void setAcc_balance(int acc_balance) {
		this.acc_balance = acc_balance;
	}
}
