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
	public String main_main(HttpServletRequest request,HttpServletResponse response)
	{
		String title = request.getParameter("title");
		String[] genres = request.getParameterValues("genre");
		String[] ratings = request.getParameterValues("rating");
		String regDate = request.getParameter("regdate");
		if (title != null && !title.trim().equals("") && genres != null) {
//			List<MovieFinderVO> list = movieFinderService.findMovie(title_);
			for (String s: ratings) {
				System.out.println(s);
			}
			System.out.println(regDate);
			List<MovieFinderVO> list = movieFinderService.findMovie(genres, ratings, regDate, title);
			request.setAttribute("list", list);
		}
		
		request.setAttribute("main_jsp", "../detail_search/detail_search.jsp");
		return "../main/main.jsp";
	}
	
	
}
