package client.dto;

import java.sql.Date;

public class ClientDTO {
     
	private String name;
	private String userid;
	private String userpasswd;
	private String email;
	private Date join_date;
	@Override
	public String toString() {
		return "ClientDTO [name=" + name + ", userid=" + userid + ", userpasswd=" + userpasswd + ", email=" + email
				+ ", join_date=" + join_date + "]";
	}
	public ClientDTO(String name, String userid, String userpasswd, String email, Date join_date) {
		super();
		this.name = name;
		this.userid = userid;
		this.userpasswd = userpasswd;
		this.email = email;
		this.join_date = join_date;
	}
	public ClientDTO() {
		super();
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpasswd() {
		return userpasswd;
	}
	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
}
