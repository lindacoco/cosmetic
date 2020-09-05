package com.yi.domain.manager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewVO {
	
	private int no;
	private int pno;
	private int userno;
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date regdate;
	private String point;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
		return "ReviewVO [no=" + no + ", pno=" + pno + ", userno=" + userno + ", regdate=" + regdate + ", point="
				+ point + "]";
	}
	
	

}
