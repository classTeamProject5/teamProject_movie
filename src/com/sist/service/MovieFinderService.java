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
		
		final String genreStr = arrayToString(genre);
		final String ratingStr = arrayToString(ratings);
		final List<String> regDateArr = getDateArray(regDate);
		final String startYear = regDateArr.get(0);
		final String endYear = regDateArr.get(1);
		final String sql = "SELECT title, poster, regdate FROM project_movie "
				+ "WHERE title LIKE ? AND REGEXP_LIKE(genre, ?) AND REGEXP_LIKE(grade, ?) AND SUBSTR(TRIM(regdate), 1, 4) BETWEEN ? AND ?";
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			ps.setString(2, genreStr);
			ps.setString(3, ratingStr);
			ps.setString(4, startYear);
			ps.setString(5, endYear);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MovieFinderVO vo = new MovieFinderVO();
				vo.setTitle(rs.getString("title"));
				vo.setPoster(rs.getString("poster"));
				vo.setRegdate(rs.getString("regdate"));
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
	
	public List<MovieFinderVO> findMovie(String type, String[] genre, String[] ratings, String regDate, String name) {
		List<MovieFinderVO> list = new ArrayList<MovieFinderVO>();
		
		final String genreStr = arrayToString(genre);
		final String ratingStr = arrayToString(ratings);
		final List<String> regDateArr = getDateArray(regDate);
		final String startYear = regDateArr.get(0);
		final String endYear = regDateArr.get(1);
		getConnection();
		String sql = makeSql(type);
		ResultSet rs;
		try {
			if (type.equals("all")) {
				System.out.println(type + "현재 타입 전체");
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, name);
				ps.setString(3, name);
				ps.setString(4, genreStr);
				ps.setString(5, ratingStr);
				ps.setString(6, startYear);
				ps.setString(7, endYear);
				rs = ps.executeQuery();
			} else {
				System.out.println(type + " 현재 타입");
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, genreStr);
				ps.setString(3, ratingStr);
				ps.setString(4, startYear);
				ps.setString(5, endYear);
				rs = ps.executeQuery();
			}
			while(rs.next()) {
				MovieFinderVO vo = new MovieFinderVO();
				vo.setTitle(rs.getString("title"));
				vo.setPoster(rs.getString("poster"));
				vo.setRegdate(rs.getString("regdate"));
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
	
	public String makeSql(String type) {
		String sql = "";
		
		if (type.equals("all")) {
			sql = "SELECT title, poster, regdate FROM project_movie "
					+ "WHERE (REGEXP_LIKE(title, ?) OR REGEXP_LIKE(actor, ?) OR REGEXP_LIKE(director, ?)) "
					+ "AND (REGEXP_LIKE(genre, ?) AND REGEXP_LIKE(grade, ?) AND SUBSTR(TRIM(regdate), 1, 4) BETWEEN ? AND ?)";
		} else if (type.equals("title")) {
			sql = "SELECT title, poster, regdate FROM project_movie "
					+ "WHERE (REGEXP_LIKE(title, ?)) "
					+ "AND (REGEXP_LIKE(genre, ?) AND REGEXP_LIKE(grade, ?) AND SUBSTR(TRIM(regdate), 1, 4) BETWEEN ? AND ?)";
		} else if (type.equals("actor")) {
			sql = "SELECT title, poster, regdate FROM project_movie "
					+ "WHERE (REGEXP_LIKE(actor, ?)) "
					+ "AND (REGEXP_LIKE(genre, ?) AND REGEXP_LIKE(grade, ?) AND SUBSTR(TRIM(regdate), 1, 4) BETWEEN ? AND ?)";
		} else if (type.equals("director")) {
			sql = "SELECT title, poster, regdate FROM project_movie "
					+ "WHERE (REGEXP_LIKE(director, ?)) "
					+ "AND (REGEXP_LIKE(genre, ?) AND REGEXP_LIKE(grade, ?) AND SUBSTR(TRIM(regdate), 1, 4) BETWEEN ? AND ?)";
		}
		return sql;
	}
	
}
