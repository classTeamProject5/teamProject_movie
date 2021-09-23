package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class MypageModel {
		
	   @RequestMapping("mypage/mypage_main.do")
	   public String mypage_main(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		   return "../main/main.jsp";
	   }
	   
	   @RequestMapping("mypage/card.do")
	   public String card(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/card.jsp");
		   return "../main/main.jsp";
	   }
	
	   @RequestMapping("mypage/discount.do")
	   public String discount(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/discount.jsp");
		   return "../main/main.jsp";
	   }
	
	   @RequestMapping("mypage/event_aply.do")
	   public String event_aply(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/event_aply.jsp");
		   return "../main/main.jsp";
	   }
	
	   @RequestMapping("mypage/member_modify.do")
	   public String member_modify(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/member_modify.jsp");
		   return "../main/main.jsp";
	   }
	
	   @RequestMapping("mypage/membershipcard.do")
	   public String membershipcard(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/membershipcard.jsp");
		   return "../main/main.jsp";
	   }
	
	   @RequestMapping("mypage/membershippoint.do")
	   public String membershippoint(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/membershippoint.jsp");
		   return "../main/main.jsp";
	   }
	   
	   @RequestMapping("mypage/moviestory.do")
	   public String moviestory(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/moviestory.jsp");
		   return "../main/main.jsp";
	   }
	   @RequestMapping("mypage/movieticket.do")
	   public String movieticket(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/movieticket.jsp");
		   return "../main/main.jsp";
	   }
	   @RequestMapping("mypage/myask.do")
	   public String myask(HttpServletRequest request,HttpServletResponse response)
	   { 
	
		   request.setAttribute("main_jsp", "../mypage/myask.jsp");
		   return "../main/main.jsp";
	   }
	   
	
	
}