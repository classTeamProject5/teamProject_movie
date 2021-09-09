package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class EventModel {
	   @RequestMapping("event/event_main.do")
	   public String event_main(HttpServletRequest request,HttpServletResponse response)
	   {
		   request.setAttribute("main_jsp", "../event/event_main.jsp");
		   return "../main/main.jsp";
	   }
}