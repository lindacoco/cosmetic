package com.yi.domain.manager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewVO {

	private int rno;
	private int pno;
	private String rcontent;
	private int userno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	private String point;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) throws ParseException {
		this.regdate = new SimpleDateFormat("yyyy-MM-dd").parse(regdate);
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", pno=" + pno + ", rcontent=" + rcontent + ", userno=" + userno + ", regdate="
				+ regdate + ", point=" + point + "]";
	}

}
