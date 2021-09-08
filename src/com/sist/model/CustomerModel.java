package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class CustomerModel {
	@RequestMapping("customerCenter/customer_main.do")
	public String customer_main(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		return "../main/main.jsp";
	}
}
