package com.khrd.handler.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class LoadReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sd = request.getParameter("start_date");
		String ed = request.getParameter("end_date");
		
		
		return null;
	}

}
