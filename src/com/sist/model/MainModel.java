package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MovieMainDAO;
import com.sist.vo.MovieInfoVO;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request,HttpServletResponse response)
	{
		MovieMainDAO dao = MovieMainDAO.getInstance();
		
		List<MovieInfoVO> list = dao.getTopMovie();
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../main/default.jsp");
		return "../main/main.jsp";
	}
	
}
