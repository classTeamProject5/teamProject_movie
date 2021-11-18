package com.sist.model;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MovieInfoDAO;
import com.sist.vo.MovieInfoVO;
import com.sist.vo.MovieReviewVO;
import java.net.HttpRetryException;
import java.util.*;

@Controller
public class MovieModel {
   @RequestMapping("moviechart/moviechart.do")
   public String movie_chart(HttpServletRequest request,HttpServletResponse response)
   {
	// 페이지 나누기 
	   // 사용자가 페이지 번호를 전송 
	   String cno=request.getParameter("cno");
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1"; 
	   // 현재페이지 출력 
	   int curpage=Integer.parseInt(page);
	   // 현재페이지에 해당되는 데이터를 읽어 온다 (오라클)
	   MovieInfoDAO dao=MovieInfoDAO.newInstance();
	   List<MovieInfoVO> list=dao.movieListData(Integer.parseInt(cno), curpage);
	   // 총페이지 구하기
	   int totalpage=dao.movieTotalPage(Integer.parseInt(cno));
	   // 블럭 나누기 
	   final int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1; // 1, 6 , 11 , 16...
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;// 5 10 15 20...
	   if(endPage>totalpage)
		     endPage=totalpage;
	   
	   // 전송 
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("list", list);
	   request.setAttribute("BLOCK", BLOCK);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("cno", cno);
	   request.setAttribute("main_jsp", "../moviechart/moviechart.jsp");
	   return "../main/main.jsp";// 메뉴/footer가 사라진다 
   }
   // 영화 상세
   @RequestMapping("movie_detail/movie_detailpage.do")
   public String movie_detailpage(HttpServletRequest request,HttpServletResponse response)
   {
	   // mno,cno
	   String mno=request.getParameter("mno");
	   String cno=request.getParameter("cno");
	   // 오라클 연결 
	   MovieInfoDAO dao=MovieInfoDAO.newInstance();
	   // 상세보기 메소드를 호출 
	   MovieInfoVO vo=dao.movieDetailData(Integer.parseInt(mno));
	   //댓글 
	   List<MovieReviewVO> list=dao.replyListData(Integer.parseInt(mno), 1);
	   request.setAttribute("list", list);
	   request.setAttribute("vo", vo);
	   request.setAttribute("cno", cno);// 목록으로 이동 (개봉/상영)
	   request.setAttribute("main_jsp", "../movie_detail/movie_detailpage.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("movie_detail/reply_insert.do") // if => annotation 
  
   public String reply_insert(HttpServletRequest request,HttpServletResponse response)
   {
 	 
 	  // 한글 처리 
 	  try
 	  {
 		  request.setCharacterEncoding("UTF-8");
 	  }catch(Exception ex) {}
 	  
 	  // 사용자가 보내준 값을 받는다 
 	  String bno=request.getParameter("bno");
 	  String type=request.getParameter("type");
 	  String msg=request.getParameter("msg");
 	  
 	  HttpSession session=request.getSession();
 	  String id=(String)session.getAttribute("id");
 	  String name=(String)session.getAttribute("name");
 	  
 	  // 묶어서 DAO로 전송 
 	  MovieReviewVO vo=new MovieReviewVO();
 	  vo.setBno(Integer.parseInt(bno));
 	  vo.setId(id);
 	  vo.setName(name);
 	  vo.setType(Integer.parseInt(type));
 	  vo.setMsg(msg);
 	  // 이동 댓글이 올라간다 
 	  MovieInfoDAO dao=MovieInfoDAO.newInstance();
 	  // 댓글 추가 메소드를 호출 
 	  dao.replyInsert(vo);
 	  return "redirect:../movie_detail/movie_detailpage.do?mno="+bno;
   }
  
   @RequestMapping("movie_detail/reply_delete.do")
   public String reply_delete(HttpServletRequest request,HttpServletResponse response)
   {
 	  // 요청 데이터를 받는다 
 	  String no=request.getParameter("bno");// 댓글번호 (삭제 목적)
 	  String mno=request.getParameter("mno");// 게시물 번호(해당 페이지로 이동)
 	  
 	  // DAO
 	 MovieInfoDAO dao=MovieInfoDAO.newInstance();
 	  // 삭제 메소드 호출 
 	  dao.replyDelete(Integer.parseInt(no));
 	  return "redirect:../movie_detail/movie_detailpage.do?mno="+mno;
   }
   
   @RequestMapping("movie_detail/reply_update.do")
   public String reply_update(HttpServletRequest request,HttpServletResponse response)
   {
 	 
 	  try
 	  {
 		  request.setCharacterEncoding("UTF-8");//디코딩
 	  }catch(Exception ex) {}
 	  
 	  String mno=request.getParameter("mno");
 	  String bno=request.getParameter("bno");//이동할 목적 (댓글이 있는 상세보기로)
 	  String msg=request.getParameter("msg");
 	  
 	  // DAO연결 
 	  MovieInfoDAO dao=MovieInfoDAO.newInstance();
 	  // 수정 할 메소드 호출 
 	  dao.replyUpdate(Integer.parseInt(mno), msg);
 	  return "redirect:../movie_detail/movie_detailpage.do?mno="+bno;// Ajax => Spring
   }
   
 }


