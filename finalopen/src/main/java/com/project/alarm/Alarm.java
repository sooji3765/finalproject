package com.project.alarm;

import java.sql.Timestamp;

public class Alarm {
	
	private String al_title;
	private String al_content;
	private Timestamp al_time;
	private Boolean al_check;
	
	
	public String getAl_title() {
		return al_title;
	}
	public void setAl_title(String al_title) {
		this.al_title = al_title;
	}
	public String getAl_content() {
		return al_content;
	}
	public void setAl_content(String al_content) {
		this.al_content = al_content;
	}
	public Timestamp getAl_time() {
		return al_time;
	}
	public void setAl_time(Timestamp al_time) {
		this.al_time = al_time;
	}
	public Boolean getAl_check() {
		return al_check;
	}
	public void setAl_check(Boolean al_check) {
		this.al_check = al_check;
	}
	
	
	
	
	

}
