package com.sist.model;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CustomerDAO;
import com.sist.vo.CustomerFAQVO;
import com.sist.vo.CustomerNoticeVO;
import com.sist.vo.CustomerQNAVO;

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
		
		String type=request.getParameter("type"); 
		if(type==null) 
			type="전체";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		CustomerDAO dao=CustomerDAO.newInstance();
		List<CustomerNoticeVO> list=dao.customerNoticeList(type,curpage);
		int totalPage=dao.noticeTotalPage();
		final int BLOCK=5;
		int startPage=(((curpage-1)/BLOCK)*BLOCK)+1;
		int endPage=(((curpage-1)/BLOCK)*BLOCK)+BLOCK;
		if(endPage>totalPage)
			endPage=totalPage;
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_notice.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("customerCenter/notice_detail.do")
	public String customer_notice_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String noup=no;
		String nodown=no;
		CustomerDAO dao=CustomerDAO.newInstance();
		CustomerNoticeVO vo=dao.customerNoticeDetail(Integer.parseInt(no));
		CustomerNoticeVO voup=dao.customerNoticeDetailud(Integer.parseInt(noup)+1);
		CustomerNoticeVO vodown=dao.customerNoticeDetailud(Integer.parseInt(nodown)-1);
		request.setAttribute("vo", vo);
		request.setAttribute("voup", voup);
		request.setAttribute("vodown", vodown);
		request.setAttribute("main_jsp", "../customerCenter/customer_notice_detail.jsp");
		
		return "../main/main.jsp";
	}
	@RequestMapping("customerCenter/notice_insert.do")
	public String customer_notice_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_notice_insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("notice_insert_ok.do")
	public String customer_notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String type=request.getParameter("type");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		CustomerNoticeVO vo=new CustomerNoticeVO();
		vo.setType(type);
		vo.setTitle(title);
		vo.setContent(content);
		CustomerDAO dao=CustomerDAO.newInstance();
		dao.custmerNoticeInsert(vo);
		return "redirect:customerCenter/notice.do";
	}
	@RequestMapping("customerCenter/notice_update.do")
	public String customer_notice_update(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		CustomerDAO dao=CustomerDAO.newInstance();
		CustomerNoticeVO vo=dao.noticeUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../customerCenter/notice_update.jsp");
		
		// include => delete.jsp,main.jsp가 request를 공유할 수 있다 (필요한 JSP에서 request를 사용한다)
		return "../main/main.jsp"; // 메뉴/footer가 없어진다 
	}
	
	@RequestMapping("customerCenter/notice_update_ok.do")
	public String customer_update_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String type=request.getParameter("type");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
	    String no=request.getParameter("no");
		  
	    CustomerNoticeVO vo=new CustomerNoticeVO();
	    
	    vo.setType(type);
	    vo.setTitle(title);
	    vo.setContent(content);
	    vo.setNo(Integer.parseInt(no));
		CustomerDAO dao=CustomerDAO.newInstance();
		  // 메소드 호출 
		dao.noticeUpdate(vo);
		
		  
		
		return "redirect:notice.do";
	}
	@RequestMapping("customerCenter/notice_delete.do")
	public String customer_notice_delete(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		request.setAttribute("no", no);
		request.setAttribute("main_jsp", "../customerCenter/notice_delete.jsp");
		// include => delete.jsp,main.jsp가 request를 공유할 수 있다 (필요한 JSP에서 request를 사용한다)
		return "../main/main.jsp"; // 메뉴/footer가 없어진다 
	}
	
	@RequestMapping("customerCenter/notice_delete_ok.do")
	public String customer_delete_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		
	    String no=request.getParameter("no");
		  
		  // pwd,no => 삭제 요청( DAO )
		CustomerDAO dao=CustomerDAO.newInstance();
		  // 메소드 호출 
		dao.noticeDelete(Integer.parseInt(no));
		  
		
		return "redirect:notice.do";
	}
	
	
	@RequestMapping("customerCenter/qna.do")
	public String customer_qna(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../customerCenter/customer_main.jsp");
		request.setAttribute("customer_main", "customer_qna.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("qna_ok.do")
	public String customer_qna_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		/*
		 * NO       NOT NULL NUMBER        
			TYPE              VARCHAR2(30)  
			TITLE             VARCHAR2(200) 
			CONTENT           CLOB          
			FILENAME          VARCHAR2(500) 
			FILESIZE          NUMBER        
			ALERT             VARCHAR2(20)  
			NAME              VARCHAR2(50)  
			TEL               VARCHAR2(30)  
			EMAIL             VARCHAR2(50)  
			REGDATE           DATE          
			STATE             VARCHAR2(20)  
		 */
		String type=request.getParameter("type");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String alert=request.getParameter("alert");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String email=request.getParameter("email");
		
		
		
		
		CustomerQNAVO vo=new CustomerQNAVO();
		vo.setType(type);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setAlert(alert);
		vo.setName(name);
		vo.setTel(tel);
		vo.setEmail(email);
		
		CustomerDAO dao=CustomerDAO.newInstance();
		dao.qnaInsert(vo);
		return "redirect:customerCenter/qna.do";
	}
}
