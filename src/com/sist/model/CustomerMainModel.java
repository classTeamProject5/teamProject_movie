package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CustomerDAO;
import com.sist.vo.CustomerFAQVO;
import com.sist.vo.CustomerNoticeVO;

@Controller
public class CustomerMainModel {
	@RequestMapping("customerCenter/main.do")
	public String customer_main(HttpServletRequest request,HttpServletResponse response)
	{
		String type=request.getParameter("type");
		
		if(type==null)
			type="전체";
		CustomerDAO dao=CustomerDAO.newInstance();
		List<CustomerFAQVO> list=dao.customerFAQList(type);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_faq.jsp");
		
		return "../main/main.jsp";
	}
	@RequestMapping("customerCenter/notice.do")
	public String customer_notice(HttpServletRequest request,HttpServletResponse response)
	{
		
		 String type2=request.getParameter("type2"); 
		 if(type2==null) 
			 type2="전체";
		System.out.println(type2);
		
		CustomerDAO dao=CustomerDAO.newInstance();
		List<CustomerNoticeVO> list=dao.customerNoticeList(type2);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_notice.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("customerCenter/notice_detail.do")
	public String customer_notice_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		CustomerDAO dao=CustomerDAO.newInstance();
		CustomerNoticeVO vo=dao.customerNoticeDetail(Integer.parseInt(no));
		CustomerNoticeVO voup=dao.customerNoticeDetail(Integer.parseInt(no)+1);
		CustomerNoticeVO vodown=dao.customerNoticeDetail(Integer.parseInt(no)-1);
		request.setAttribute("vo", vo);
		request.setAttribute("voup", voup);
		request.setAttribute("vodown", vodown);
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_notice_detail.jsp");
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
