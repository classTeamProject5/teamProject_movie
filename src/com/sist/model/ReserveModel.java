package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
@Controller
public class ReserveModel {
	
	@RequestMapping("reserve/movie_time.do")
	public String movietime_movietime(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../reserve/movie_time.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/q_reserve.do")
	public String quick_reserve_q_reserve(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../reserve/q_reserve.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/pay.do")
	public String pay_pay(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../reserve/pay.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("reserve/seat.do")
	public String pay_seat(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../reserve/seat.jsp");
		return "../main/main.jsp";
	}
}
