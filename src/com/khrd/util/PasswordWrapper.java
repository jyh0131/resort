package com.khrd.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordWrapper extends HttpServletRequestWrapper {

	public PasswordWrapper(HttpServletRequest request) {
		super(request);	
	}
	public String getParameter(String key) {
		
		String value = "";
		
		if(key != null && key.equals("mPassword")) {
			value = getsha(super.getParameter("mPassword"));
		}else {
			value = super.getParameter(key);
		}
		
		return value;
	}
	private String getsha(String parameter) {
		String encPassword = "";
		
		
		return null;
	}
	
	
}
