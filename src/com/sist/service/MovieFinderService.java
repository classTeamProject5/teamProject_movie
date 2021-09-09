package com.sist.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import com.sist.dao.MovieFinderVO;

public class MovieFinderService {
	private Connection conn;
	// SQL문장 전송 객체
	private PreparedStatement ps;
	// 오라클 서버 주소
	private final String URL = "jdbc:oracle:thin:@211.238.142.208:1521:XE";

	// 1. 드라이버 등록
	public MovieFinderService() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	// 2. 오라클 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
			// conn hr/happy
		} catch (Exception ex) {
		}
	}

	// 3. 오라클 해제 => JDBC => DBCP => ORM(MyBatis,JPA,Hibernate...)
	public void disConnection() {
		try {
			if (ps != null)
				ps.close(); // 연결중이면 닫는다
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
	
	public List<MovieFinderVO> findMovie(String name) {
		List<MovieFinderVO> list = new ArrayList<MovieFinderVO>();
		final String sql = "SELECT title, poster FROM project_movie "
				+ "WHERE title LIKE ?";
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MovieFinderVO vo = new MovieFinderVO();
				vo.setTitle(rs.getString("title"));
				vo.setPoster(rs.getString("poster"));
				list.add(vo);
			}
			rs.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	public List<MovieFinderVO> findMovie(String[] genre, String name) {
		List<MovieFinderVO> list = new ArrayList<MovieFinderVO>();
		
		String genreStr = arrayToString(genre);
		final String sql = "SELECT title, poster FROM project_movie "
				+ "WHERE title LIKE ? AND REGEXP_LIKE(genre, ?)";
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			ps.setString(2, genreStr);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MovieFinderVO vo = new MovieFinderVO();
				vo.setTitle(rs.getString("title"));
				vo.setPoster(rs.getString("poster"));
				list.add(vo);
			}
			rs.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	public List<MovieFinderVO> findMovie(String[] genre, String[] ratings, String name) {
		List<MovieFinderVO> list = new ArrayList<MovieFinderVO>();
		
		String genreStr = arrayToString(genre);
		String ratingStr = arrayToString(ratings);
		final String sql = "SELECT title, poster FROM project_movie "
				+ "WHERE title LIKE ? AND (REGEXP_LIKE(genre, ?) AND REGEXP_LIKE(grade, ?))";
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			ps.setString(2, genreStr);
			ps.setString(3, ratingStr);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MovieFinderVO vo = new MovieFinderVO();
				vo.setTitle(rs.getString("title"));
				vo.setPoster(rs.getString("poster"));
				list.add(vo);
			}
			rs.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	public List<MovieFinderVO> findMovie(String[] genre, String[] ratings, String regDate, String name) {
		List<MovieFinderVO> list = new ArrayList<MovieFinderVO>();
		
		String genreStr = arrayToString(genre);
		String ratingStr = arrayToString(ratings);
		List<String> regDateArr = getDateArray(regDate);
		System.out.println("시작 년도: " + regDateArr.get(0));
		System.out.println("도착 년도: " + regDateArr.get(1));
		String startYear = regDateArr.get(0);
		String endYear = regDateArr.get(1);
		final String sql = "SELECT title, poster FROM project_movie "
				+ "WHERE title LIKE ? AND (REGEXP_LIKE(genre, ?) AND REGEXP_LIKE(grade, ?))";
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			ps.setString(2, genreStr);
			ps.setString(3, ratingStr);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MovieFinderVO vo = new MovieFinderVO();
				vo.setTitle(rs.getString("title"));
				vo.setPoster(rs.getString("poster"));
				list.add(vo);
			}
			rs.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	
	public String arrayToString(String[] array) {
		String temp = "";
		
		for (String s: array) {
			temp += s + "|";
		}
		String result = temp.substring(0, temp.length() -1);
		System.out.println(result);
		return result;
	}
	
	public List<String> getDateArray(String inputDate) {
		List<String> result = new ArrayList<String>(2);
		StringTokenizer st = new StringTokenizer(inputDate, ",");
		while(st.hasMoreTokens()){
			result.add(st.nextToken());
		}
		return result;
	}
	
}
