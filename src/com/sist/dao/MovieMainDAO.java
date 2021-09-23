package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.EventVO;
import com.sist.vo.MovieInfoVO;

public class MovieMainDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   
	   private static MovieMainDAO dao = new MovieMainDAO(); // new (메모리 누적) , static은 한번만 생성(메모리 1개) 
	   
	   public static MovieMainDAO getInstance() {
		   return dao;
	   }
	   
	   private MovieMainDAO() {}
	   
	      public void getConnection()
		  {
			  try
			  {
				  Context init=new InitialContext(); // 저장된 위치에 접근 
				  // JNDI (java naming directory interface)
				  Context c=(Context)init.lookup("java://comp//env");
				  DataSource ds=(DataSource)c.lookup("jdbc/oracle");
				  conn=ds.getConnection();
			  }catch(Exception ex) 
			  {
				  ex.printStackTrace();
			  }
		  }
	   // Connection반환 
	      public void disConnection()
		  {
			  try
			  {
				  if(ps!=null) ps.close();
				  if(conn!=null) conn.close();
			  }catch(Exception ex) {}
		  }
	      
	      public List<MovieInfoVO> getTopMovie() {
	    	  final List<MovieInfoVO> list = new ArrayList<>();
	    	  
	    	  final String sql = "SELECT mno, title, poster, regdate "
	    	  		+ "FROM PROJECT_MOVIE "
	    	  		+ "WHERE mno <= 4";
	    	  try {
	    		  getConnection();
	    		  ps = conn.prepareStatement(sql);
	    		  ResultSet rs = ps.executeQuery();
	    		  
	    		  while(rs.next()) {
	    			  MovieInfoVO vo = new MovieInfoVO();
	    			  vo.setMno(rs.getInt("mno"));
	    			  vo.setTitle(rs.getString("title"));
	    			  vo.setPoster(rs.getString("poster"));
	    			  vo.setRegdate(rs.getString("regdate"));
	    			  list.add(vo);
	    		  }
	    		  rs.close();
	    	  } catch (Exception e) {
	    		  e.printStackTrace();
	    	  } finally {
	    		  disConnection();
	    	  }
	    	  
	    	  return list;
	      }
	      
	      public List<EventVO> getTopEvent() {
	    	  final List<EventVO> list = new ArrayList<>();
	    	  
	    	  final String sql = "SELECT * FROM (" + 
	    	  		"    SELECT mno, event_title, event_poster, event_term FROM event_main2" + 
	    	  		"    WHERE event_state = '진행중인 이벤트'" + 
	    	  		"    ORDER BY event_term DESC" + 
	    	  		") WHERE ROWNUM BETWEEN 1 AND 4";
	    	  try {
	    		  getConnection();
	    		  ps = conn.prepareStatement(sql);
	    		  ResultSet rs = ps.executeQuery();
	    		  
	    		  while(rs.next()) {
	    			  EventVO vo = new EventVO();
	    			  vo.setPoster(rs.getString("event_poster"));
	    			  vo.setTitle(rs.getString("event_title"));
	    			  vo.setTerm(rs.getString("event_term"));
	    			  vo.setMno(rs.getInt("mno"));
	    			  list.add(vo);
	    		  }
	    		  rs.close();
	    	  } catch(Exception e) {
	    		  e.printStackTrace();
	    	  } finally {
	    		  disConnection();
	    	  }
	    	  return list;
	      }
	   
}
