package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MovieFinderVO;
import com.sist.service.MovieFinderService;

@Controller
public class MovieFinderModel{
	
	MovieFinderService movieFinderService = new MovieFinderService(); 
	
	@RequestMapping("main/moviefind.do")
	public String movieFinder(HttpServletRequest request,HttpServletResponse response)
	{
		if(request.getMethod().equals("GET")) {
			System.out.println("겟 요청");
			request.setAttribute("main_jsp", "../detail_search/detail_search.jsp");
			request.setAttribute("method", "get");
			return "../main/main.jsp";
		}
		String title = request.getParameter("title");
		String[] genres = request.getParameterValues("genre");
		String[] ratings = request.getParameterValues("rating");
		String regDate = request.getParameter("regdate");
		String type = request.getParameter("type");
		System.out.println(type);
		
	if (title != null && !title.trim().equals("") && genres != null && !regDate.equals("")) { // 검색조건에 맞췄는지 확인
			List<MovieFinderVO> list = movieFinderService.findMovie(type, genres, ratings, regDate, title);
			request.setAttribute("method", "post");
			System.out.println("포스트 요청");
			if (list.size() != 0) { // 검색결과가 있나 없나 확인 없으면 list없이 리턴
				request.setAttribute("list", list);
			} 
			request.setAttribute("main_jsp", "../detail_search/detail_search.jsp");
			return "../main/main.jsp";
		} else {   // 검색조건에 맞추라고 해야함
			System.out.println("잘못된 검색");
			request.setAttribute("wrong", "wrong");
			request.setAttribute("main_jsp", "../detail_search/detail_search.jsp");
			return "../main/main.jsp";
		}
	}
	
}
