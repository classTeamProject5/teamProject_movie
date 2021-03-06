package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.LoginDAO;
import com.sist.dao.MemberDAO;

import java.util.*;
import com.sist.vo.*;

@Controller
public class LoginModel {
  @RequestMapping("login/login.do")
  public String member_join(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../login/login.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("login/login_ok.do")
  public String member_login(HttpServletRequest request,HttpServletResponse response)
  {
	  // 사용자 전송한 id,pwd
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  // DAO로 전송 => 결과값을 받아서 => login_result.jsp 전송 (출력=>main.jsp에 읽어간다)
	  LoginDAO dao=LoginDAO.newInstance();
	  // 메소드 호출 
	  String result=dao.login(id, pwd);
	  if(!(result.equals("NOID")|| result.equals("NOPWD")))
	  {
		  HttpSession session=request.getSession(); // 세션 사용 
		  // 세션/쿠키 => request를 이용한다  (request.getCookie()))
		  StringTokenizer st=new StringTokenizer(result,"|");
		  String name=st.nextToken();
		  String admin=st.nextToken();
		  
		  // 세션에 저장 
		  session.setAttribute("id", id);
		  
		  
		  session.setAttribute("admin", admin);
		  session.setAttribute("name", name);
		  result="OK";
	  }
	  request.setAttribute("result", result);
	  return "redirect:../main/main.do";
  }
  // 로그 아웃
  @RequestMapping("login/logout.do")
  public String member_logout(HttpServletRequest request,HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  session.invalidate(); // 데이터 전체 삭제
	  return "redirect:../main/main.do";
  }
  
  // id찾기
  @RequestMapping("login/idfind.do")
  public String login_idfind(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../login/idfind.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("login/idfind_email.do")
  public String login_idfind_email(HttpServletRequest request,HttpServletResponse response)
  {
	  String email=request.getParameter("email");
	  LoginDAO dao=LoginDAO.newInstance();
	  String s=dao.login_idfind_email(email);
	  request.setAttribute("result", s);
	  return "../login/idfind_email.jsp";
  }
  @RequestMapping("login/idfind_tel.do")
  public String login_idfind_tel(HttpServletRequest request,HttpServletResponse response)
  {
	  String tel=request.getParameter("tel");
	  LoginDAO dao=LoginDAO.newInstance();
	  String s=dao.login_idfind_tel(tel);
	  request.setAttribute("result", s);
	  return "../login/idfind_tel.jsp";
  }
}