package com.sist.model;

import java.util.*;//List

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

@Controller
public class EventModel {
	
	   /*모든 이벤트 리스트를 받아오는 용도*/ 
	
	   //header.jsp의 진행중인 이벤트 <a>태그에 해당 주소가 걸려있음. event_category_all.do
	   //event_category_all.do를 하라 => main_jsp에 ../event/evnet_category_all.jsp를 보냄.
	   @RequestMapping("event/event_category_all.do")
	   public String event_category_all(HttpServletRequest request,HttpServletResponse response)
	   { 
		   EventDAO dao = new EventDAO(); //newInstance형태로 수정해야함.
		   List<EventVO> list = dao.eventAllData();	//페이지를 나누려면 이 함수 + Paging 함수를 써야할듯.
		
		   request.setAttribute("list", list);
		   request.setAttribute("main_jsp", "../event/event_category_all.jsp");
		   return "../main/main.jsp";
	   }
	
	  
	   
	   /****************************게시판 관련****************************************************/
	   @RequestMapping("event/event_board_list.do")
	   public String event_board_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   request.setAttribute("main_jsp", "../event/event_board_list.jsp");
		   return "../main/main.jsp";
	   }
}


/************************************************************************************************************/
/*
@RequestMapping("event/list.do")
public String event_list(HttpServletRequest request,HttpServletResponse response)
{
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  // 현재페이지 
	  int curpage=Integer.parseInt(page);
	  // 페이지에 해당되는 데이터 읽기 
	  EventDAO dao=new EventDAO();
	  List<EventVO> list=dao.eventListData(curpage);
	  // 총페이지 읽기 
	  int totalpage=dao.eventTotalPage();
	  
	  final int BLOCK=5;
	  /*
	   *     startPage   endPage
	   *      |           |
	   *   < [1][2][3][4][5] >
	   *                        startPage   endPage
	   *                     |  |           |
	   *                     < [6][7][8][9][10] >
	   *
	  int startPage=(((curpage-1)/BLOCK)*BLOCK)+1;
	  //                 1-1/BLOCK => 0*5 => 0  ==>  1
	  //                 6-1/5 => 1*5 => 5 +1 6
	  //                 10/5 ==> 2*5 => 10+1 ===> 11
	  int endPage=(((curpage-1)/BLOCK)*BLOCK)+BLOCK; // ==> 5 ==> 
	  //             6-1/5 => 1*BLOCK => 5+5 => 10
	  //   totalpage=13 ==> endPage => 15
	  
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  // list.jsp전송
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("list", list);
	  request.setAttribute("BLOCK", BLOCK);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  
	  request.setAttribute("main_jsp", "../event/event_list.jsp"); //main_jsp
	  return "../event/event_main.jsp";
}

*/