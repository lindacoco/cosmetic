package com.yi.domain.manager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {
	private int bno;
	private String btitle;
	private String bwriter;
	private String bcontent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bregdate;
	private String banswer;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public Date getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) throws ParseException {
		this.bregdate = new SimpleDateFormat("yyyy-MM-dd").parse(bregdate);
	}

	public String getBanswer() {
		return banswer;
	}

	public void setBanswer(String banswer) {
		this.banswer = banswer;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", btitle=" + btitle + ", bwriter=" + bwriter + ", bcontent=" + bcontent
				+ ", bregdate=" + bregdate + ", banswer=" + banswer + "]";
	}

}
