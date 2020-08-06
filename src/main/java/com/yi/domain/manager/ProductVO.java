package com.yi.domain.manager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductVO {
    private int pno;
    private String pname;
    private String pcontent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date penroll;
    private int pprice;
    private String ppic;
    private String pdiv;
    private int pevent;
    private int pstock;
    private int psale;
    
    
    
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public Date getPenroll() {
		return penroll;
	}
	public void setPenroll(String penroll) throws ParseException {
		this.penroll = new SimpleDateFormat("yyyy-MM-dd").parse(penroll);
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPpic() {
		return ppic;
	}
	public void setPpic(String ppic) {
		this.ppic = ppic;
	}
	public String getPdiv() {
		return pdiv;
	}
	public void setPdiv(String pdiv) {
		this.pdiv = pdiv;
	}
	public int getPevent() {
		return pevent;
	}
	public void setPevent(int pevent) {
		this.pevent = pevent;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public int getPsale() {
		return psale;
	}
	public void setPsale(int psale) {
		this.psale = psale;
	}
	public void setPenroll(Date penroll) {
		this.penroll = penroll;
	}
	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", pname=" + pname + ", pcontent=" + pcontent + ", penroll=" + penroll
				+ ", pprice=" + pprice + ", ppic=" + ppic + ", pdiv=" + pdiv + ", pevent=" + pevent + ", pstock="
				+ pstock + "]";
	}
      
    
}
