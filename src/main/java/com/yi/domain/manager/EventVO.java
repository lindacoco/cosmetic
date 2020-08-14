package com.yi.domain.manager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class EventVO {
	private int eno;
	private String etitle;
	private String econtent;
	private String epic;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date estartdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eenddate;

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getEcontent() {
		return econtent;
	}

	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}

	public String getEpic() {
		return epic;
	}

	public void setEpic(String epic) {
		this.epic = epic;
	}

	public Date getEstartdate() {
		return estartdate;
	}

	public void setEstartdate(String estartdate) throws ParseException {
		this.estartdate = new SimpleDateFormat("yyyy-MM-dd").parse(estartdate);
	}

	public Date getEenddate() {
		return eenddate;
	}

	public void setEenddate(String eenddate) throws ParseException {
		this.eenddate = new SimpleDateFormat("yyyy-MM-dd").parse(eenddate);
	}

	@Override
	public String toString() {
		return "EventVO [eno=" + eno + ", etitle=" + etitle + ", econtent=" + econtent + ", epic=" + epic
				+ ", estartdate=" + estartdate + ", eenddate=" + eenddate + "]";
	}

}
