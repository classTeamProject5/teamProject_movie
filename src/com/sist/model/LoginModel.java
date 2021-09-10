package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.LoginDAO;
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
}