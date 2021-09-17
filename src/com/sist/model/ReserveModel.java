package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.vo.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
@Controller
public class ReserveModel {
    @RequestMapping("main/main.do")
      public String main_main(HttpServletRequest request,HttpServletResponse response)
      {
         return "redirect:../main/main.do";
      }

   @RequestMapping("reserve/movie_time.do")
   public String reserve_movietime(HttpServletRequest request, HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      }catch(Exception ex) {}
      
       String reg=request.getParameter("reg");
//       System.out.println("모델레그"+reg);          
       String reg2=reg;
       System.out.println("");
//      String tit=request.getParameter("tit");
//      String thea=request.getParameter("thea");
      ReserveDAO dao=ReserveDAO.newInstance();
   
   
      List<RegdateVO> reg_list=dao.regDateList();
//      List<MovieTimeVO> title_listAll=dao.titleListDataAll(reg2,tit);
      List<MovieTimeVO> title_list=dao.titleListData(reg);
//      List<MovieTimeVO> list=dao.movieTimeListData(tit,reg);
      List<MovieTimeVO> theater_list=dao.theaterData();
            
      request.setAttribute("reg_list", reg_list);
      request.setAttribute("title_list", title_list);
//      request.setAttribute("list", list);
      request.setAttribute("theater_list", theater_list);
      request.setAttribute("main_jsp", "../reserve/movie_time.jsp");
      return "../main/main.jsp";
   }
   
   
   
   
   
   @RequestMapping("reserve/q_reserve.do")
   public String reserve_q_reserve(HttpServletRequest request, HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      }catch(Exception ex) {}
      String reg=request.getParameter("reg");
      String mov=request.getParameter("mov");
      String the=request.getParameter("the");
      String tit=request.getParameter("tit");
      String time=request.getParameter("time");
      
      if(reg==null);
         reg="09-16(목)";
      ReserveDAO dao=ReserveDAO.newInstance();
      
      List<RegdateVO> reg_list1=dao.regDateList();
//      List<MovieTimeVO> theater_list1=dao.theaterData2(tit,reg);
      List<MovieTimeVO> title_list1=dao.titleListData(reg);
//      List<MovieTimeVO> list1=dao.movieTimeListData(tit,reg);
//      List<MovieTimeVO> list3=dao.theaterData(rd,ti);
      request.setAttribute("reg_list1", reg_list1);
//      request.setAttribute("theater_list1", theater_list1);
      request.setAttribute("title_list1", title_list1);
//      request.setAttribute("list1", list1);
      
   
      request.setAttribute("main_jsp", "../reserve/q_reserve.jsp");
      return "../main/main.jsp";
   }
   
   
   
   @RequestMapping("reserve/reserve_ok.do")
   public String reserve_ok(HttpServletRequest request, HttpServletResponse response) {
	   	  
	   	  ReserveDAO dao=ReserveDAO.newInstance();
	   	  HttpSession session=request.getSession();
	   	  String id=(String)session.getAttribute("id"); 
	  	  String title=request.getParameter("title");
	  	  String selectedTheater=request.getParameter("selectedTheater");
	  	  String movieDate=request.getParameter("movieDate");
	  	  String runningTime=request.getParameter("runningTime");
	  	  String movieAge=request.getParameter("movieAge");
//		  String reserve_Date=request.getParameter("reserve_Date");
			/* String ticketNumber=request.getParameter("ticketNumber"); */
	  	  String finwon=request.getParameter("finwon");
	  	  String payMoney=request.getParameter("payMoney");
	  	  
//	  	  String pay_Money=request.getParameter("pay_Money");
	  	 
	  	    System.out.println("id:"+id); 
		  	System.out.println("title:"+title);  
		  	System.out.println("selectedTheater:"+selectedTheater); 
		  	System.out.println("movieDate:"+movieDate); 
		  	System.out.println("runningTime:"+runningTime); 
		  	System.out.println("movieAge:"+movieAge); 
			/* System.out.println("ticketNumber:"+ticketNumber); */
		  	System.out.println("selectedSeat:"+finwon); 
		  	System.out.println("payMoney:"+payMoney); 
	  	  ReserveVO vo=new ReserveVO();
		  vo.setId(id);
		  vo.setTitle(title);
		  vo.setSelected_theater(selectedTheater);
		  vo.setMovie_date(movieDate); //영화보는날
		  vo.setRunning_time(runningTime); //시작시간
		  vo.setMovie_age(movieAge);
			/* vo.setTicket_number(ticketNumber); */
		  vo.setSelected_seat(finwon);
		  vo.setPay_money(payMoney);
		            
          dao.movieReservedata(vo);
          return "redirect:../reserve/mypage.do";
      //request.setAttribute("main_jsp", "../reserve/pay.jsp");
      //return "../main/main.jsp";
   }

   @RequestMapping("reserve/seat.do")
   public String reserve_seat(HttpServletRequest request, HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      }catch(Exception ex) {}     
      ReserveDAO dao=ReserveDAO.newInstance();

      	String no=request.getParameter("no");
        MovieTimeVO svo=dao.selectListData(Integer.parseInt(no));
        
      
	  
      request.setAttribute("svo", svo);
      request.setAttribute("main_jsp", "../reserve/seat.jsp");
      return "../main/main.jsp";
   }
   
   
   
   @RequestMapping("reserve/mypage.do")
   public String reserve_mypage(HttpServletRequest request,HttpServletResponse response)
   {
 	  HttpSession session=request.getSession();
 	  String id=(String)session.getAttribute("id");
 	  ReserveDAO dao=ReserveDAO.newInstance();
 	  
 	  List<ReserveVO> list=dao.mypageData(id);
 	  
 	  request.setAttribute("list", list);
 	  request.setAttribute("main_jsp", "../reserve/mypage.jsp");
 	  return "../main/main.jsp";
   }
}