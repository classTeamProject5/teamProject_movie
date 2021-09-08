package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class CustomerMainModel {
	@RequestMapping("customerCenter/main.do")
	public String customer_main(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_faq.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("customerCenter/notice.do")
	public String customer_notice(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_notice.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("customerCenter/qna.do")
	public String customer_qna(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_qna.jsp");
		return "../main/main.jsp";
	}
}
