package menu5;

import java.sql.Timestamp;

public class Menu5DTO {
	private int num;
	private String name;
	private String pass;
	private String ttitle;
	private String twrite;
	private String content;
	private Timestamp date;
	private int readcount;
	private String category;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getTwrite() {
		return twrite;
	}
	public void setTwrite(String twrite) {
		this.twrite = twrite;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
