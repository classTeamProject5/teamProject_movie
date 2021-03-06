package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import java.util.*;
import com.sist.vo.*;

@Controller
public class MemberModel {
  @RequestMapping("member/join.do")
  public String member_join(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../member/join.jsp");
	  return "../main/main.jsp";
  }
  
 
  @RequestMapping("member/idcheck.do")
  public String member_idcheck(HttpServletRequest request,HttpServletResponse response)
  {
	  //사용자가 보내준 ID받기
	  String id=request.getParameter("id");// 한글 => 한글변환 
	  // DAO를 통해서 확인 (있는 아이디,없는 아이디)
	  MemberDAO dao=MemberDAO.newInstance();
	  int count=dao.memberidCheck(id);
	  request.setAttribute("count", count);
	  return "../member/idcheck_result.jsp";
  }
  @RequestMapping("member/postfind.do")
  public String member_postfind(HttpServletRequest request,HttpServletResponse response)
  {
	  // 동을 받는다 (한글)
	  // 한글변환(디코딩) => 인코딩 (바이트)->디코딩(Unicode=>UTF-8)
	  try
	  {
		  request.setCharacterEncoding("UTF-8");//디코딩 => post방식일때만 사용
	  }catch(Exception ex) {}
	  // 값을 받는다 
	  // <input type=text name=dong id=dong size=15 class="input-sm">
	  // getParameter(name명)
	  String dong=request.getParameter("dong");
	  // DAO를 연결해서 데이터 읽기
	  MemberDAO dao=MemberDAO.newInstance(); // 한개의 메로리 사용(메모리 누수방지) = 싱글턴
	  List<ZipcodeVO> list=dao.postfind(dong);
	  int count=dao.postfindCount(dong);
	 
	  request.setAttribute("list", list);
	  request.setAttribute("count", count);
	  return "../member/postfind_result.jsp";
  }
 
  @RequestMapping("member/join_ok.do")
  public String member_join_ok(HttpServletRequest request,HttpServletResponse response)
  {
	  System.out.println("회원 데이터 전송완료");
	  // 사용자가 보내준 데이터를 받는다 
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String id=request.getParameter("id");//스프링 => 매개변수 (MemberVO vo)
	  String pwd=request.getParameter("pwd");
	  String name=request.getParameter("name");
	  String sex=request.getParameter("sex");
	  String birthday=request.getParameter("birthday");
	  String email=request.getParameter("email");// UNIQUE  => 아이디 찾기
	  String post1=request.getParameter("post1");
	  String post2=request.getParameter("post2");
	  String addr1=request.getParameter("addr1");
	  String addr2=request.getParameter("addr2");
	  String tel1=request.getParameter("tel1");// UNIQUE => 아이디 찾기 (후보키)
	  String tel2=request.getParameter("tel2");//
	  String genre=request.getParameter("genre");
	  
	  MemberVO vo=new MemberVO();
	  vo.setId(id);
	  vo.setPwd(pwd);
	  vo.setName(name);
	  vo.setSex(sex);
	  vo.setBirthday(birthday);
	  vo.setPost(post1+"-"+post2);
	  vo.setEmail(email);
	  vo.setAddr1(addr1);
	  vo.setAddr2(addr2);
	  vo.setTel(tel1+"-"+tel2);
	  vo.setGenre(genre);
	  // DAO로 전송 
	  MemberDAO dao=MemberDAO.newInstance();
	  dao.memberJoinInsert(vo);
	  return "redirect:../main/main.do";// main에서 회원가입 데이터가 필요가 없다 (request초기화)
	  // sendRedirect() ==> DispatcherServlet => redirect:
  }
  // 회원 가입 , 로그인 , 예매/예약 , 검색  , 추천 (통계)  => 페이지기법 
  @RequestMapping("member/login.do")
  public String member_login(HttpServletRequest request,HttpServletResponse response)
  {
	  // 사용자 전송한 id,pwd
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  // DAO로 전송 => 결과값을 받아서 => login_result.jsp 전송 (출력=>main.jsp에 읽어간다)
	  MemberDAO dao=MemberDAO.newInstance();
	  // 메소드 호출 
	  String result=dao.isLogin(id, pwd);
	  if(!(result.equals("NOID")|| result.equals("NOPWD")))
	  {
		  HttpSession session=request.getSession(); // 세션 사용 
		  // 세션/쿠키 => request를 이용한다  (request.getCookie())
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
	  return "../member/login_result.jsp";
  }
  // 로그 아웃
  @RequestMapping("member/logout.do")
  public String member_logout(HttpServletRequest request,HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  session.invalidate(); // 데이터 전체 삭제
	  return "redirect:../main/main.do";
  }
  @RequestMapping("member/join_update_ok.do")
  public String member_join_update_ok(HttpServletRequest request,HttpServletResponse response)
  {
	  System.out.println("회원 수정 접근");
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String id=request.getParameter("id");//스프링 => 매개변수 (MemberVO vo)
	  String pwd=request.getParameter("pwd");
	  String name=request.getParameter("name");
	  String sex=request.getParameter("sex");
	  String birthday=request.getParameter("birthday");
	  String email=request.getParameter("email");// UNIQUE  => 아이디 찾기
	  String post1=request.getParameter("post1");
	  String post2=request.getParameter("post2");
	  String addr1=request.getParameter("addr1");
	  String addr2=request.getParameter("addr2");
	  String tel1=request.getParameter("tel1");// UNIQUE => 아이디 찾기 (후보키)
	  String tel2=request.getParameter("tel2");//
	  
	  MemberVO vo=new MemberVO();
	  vo.setId(id);
	  vo.setPwd(pwd);
	  vo.setName(name);
	  vo.setSex(sex);
	  vo.setBirthday(birthday);
	  vo.setPost(post1+"-"+post2);
	  vo.setEmail(email);
	  vo.setAddr1(addr1);
	  vo.setAddr2(addr2);
	  vo.setTel(tel1+"-"+tel2);
	  // DAO로 전송 
	  MemberDAO dao=MemberDAO.newInstance();
	  boolean bCheck=dao.joinUpdate(vo);
	  if(bCheck==true)
	  {
		  HttpSession session=request.getSession();
		  session.setAttribute("name", vo.getName());
	  }
	  request.setAttribute("bCheck", bCheck);
	  return "../member/join_update_ok.jsp";
  }
  

}

