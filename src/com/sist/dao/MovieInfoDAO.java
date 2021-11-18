package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import com.sist.vo.MovieInfoVO;
import com.sist.vo.MovieReviewVO;

import javax.naming.*;


public class MovieInfoDAO {
	private Connection conn;
	   private PreparedStatement ps;
	   private static MovieInfoDAO dao; // new (메모리 누적) , static은 한번만 생성(메모리 1개) 
	  
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
	   // 싱글턴 => DAO를 한번만 생성할 수 있게 만든다 
	      public static MovieInfoDAO newInstance()
	      {
	    	  if(dao==null) // 생성이 안된 상태
	    		  dao=new MovieInfoDAO();
	    	  // 생성이 된 상태라면 => 기존에 생성된 dao를 사용한다
	    	  return dao; // 서버는 게속 가동 
	      }
	   // 기능 
	   // 1. 상영 출력  cno=1(상영) cno=2(개봉)  movieListData(1,1)
	      public List<MovieInfoVO> movieListData(int cno,int page)
	      {
	    	  List<MovieInfoVO> list=new ArrayList<MovieInfoVO>();
	    	  try
	    	  {
	    		  getConnection();
	    		  String sql="SELECT mno,poster,title,num "
	    				    +"FROM (SELECT mno,poster,title,rownum as num "
	    				    +"FROM (SELECT mno,poster,title "
	    				    +"FROM project_movie WHERE cno=? ORDER BY mno ASC)) "
	    				    +"WHERE num BETWEEN ? AND ?";
	    		 ps=conn.prepareStatement(sql);
	    		 int rowSize=12;
	    		 int start=(rowSize*page)-(rowSize-1);
	    		 int end=rowSize*page;
	    		 ps.setInt(1, cno);
	    		 ps.setInt(2, start);
	    		 ps.setInt(3, end);
	    		 
	    		 ResultSet rs=ps.executeQuery();
	    		 while(rs.next())
	    		 {
	    			 MovieInfoVO vo=new MovieInfoVO();
	    			 vo.setMno(rs.getInt(1));
	    			 vo.setPoster(rs.getString(2));
	    			 vo.setTitle(rs.getString(3));
	    			 list.add(vo);
	    		 }
	    		 rs.close();
	    	  }
	    	  catch(Exception ex)
	    	  {
	    		  ex.printStackTrace();
	    	  }
	    	  finally
	    	  {
	    		  disConnection();
	    	  }
	    	  return list;
	      }
	      
	      public int movieTotalPage(int cno)
	      {
	    	  int total=0;
	    	  try
	    	  {
	    		  getConnection();
	    		  String sql="SELECT CEIL(COUNT(*)/12.0) FROM project_movie "
	    				    +"WHERE cno=?";
	    		  ps=conn.prepareStatement(sql);
	    		  ps.setInt(1,cno);
	    		  ResultSet rs=ps.executeQuery();
	    		  rs.next();
	    		  total=rs.getInt(1);
	    		  rs.close();
	    	  }catch(Exception ex)
	    	  {
	    		  ex.printStackTrace();
	    	  }
	    	  finally
	    	  {
	    		  disConnection();
	    	  }
	    	  return total;
	      }
	   // 2. 상영영화 상세보기
	      /*
	       *  private double score;
	    private String title,grade,reserve,genre,time,regdate,director,actor,
	           showUser,poster,story,key;
		
	       */
	      public MovieInfoVO movieDetailData(int mno)
	      {
	    	  MovieInfoVO vo=new MovieInfoVO();
	    	  try
	    	  {
	    		  getConnection();
	    		  String sql="SELECT mno,title,score,grade,reserve,genre,time,"
	    				    +"regdate,director,actor,showUser,poster,story,key "
	    				    +"FROM project_movie "
	    				    +"WHERE mno=?";
	    		  ps=conn.prepareStatement(sql);
	    		  ps.setInt(1, mno);
	    		  ResultSet rs=ps.executeQuery();
	    		  rs.next();
	    		  vo.setMno(rs.getInt(1));
	    		  vo.setTitle(rs.getString(2));
	    		  vo.setScore(rs.getDouble(3));
	    		  vo.setGrade(rs.getString(4));
	    		  vo.setReserve(rs.getString(5));
	    		  vo.setGenre(rs.getString(6));
	    		  vo.setTime(rs.getString(7));
	    		  vo.setRegdate(rs.getString(8));
	    		  vo.setDirector(rs.getString(9));
	    		  vo.setActor(rs.getString(10));
	    		  vo.setShowUser(rs.getString(11));
	    		  vo.setPoster(rs.getString(12));
	    		  vo.setStory(rs.getString(13));
	    		  vo.setKey(rs.getString(14));
	    		  rs.close();
	    	  }catch(Exception ex)
	    	  {
	    		  ex.printStackTrace();
	    	  }
	    	  finally
	    	  {
	    		  disConnection();
	    	  }
	    	  return vo;
	      }
	      public List<MovieReviewVO> replyListData(int bno,int type)
	      {
	   	   List<MovieReviewVO> list=new ArrayList<MovieReviewVO>();
	   	   try
	   	   {
	   		   getConnection();
	   		   String sql="SELECT no,bno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
	   				     +"FROM project_reply "
	   				     +"WHERE bno=? AND type=? "
	   				     +"ORDER BY no DESC";
	   		   
	   		   ps=conn.prepareStatement(sql);
	   		   ps.setInt(1, bno);
	   		   ps.setInt(2, type);
	   		   ResultSet rs=ps.executeQuery();
	   		   while(rs.next())
	   		   {
	   			   MovieReviewVO vo=new MovieReviewVO();
	   			   vo.setNo(rs.getInt(1));
	   			   vo.setBno(rs.getInt(2));
	   			   vo.setId(rs.getString(3));
	   			   vo.setName(rs.getString(4));
	   			   vo.setMsg(rs.getString(5));
	   			   vo.setDbday(rs.getString(6));
	   			   list.add(vo);
	   		   }
	   		   rs.close();
	   	   }catch(Exception ex)
	   	   {
	   		   ex.printStackTrace();
	   	   }
	   	   finally
	   	   {
	   		   disConnection();
	   	   }
	   	   return list;
	      }
	      // 댓글 쓰기
	      /*
	       *      no NUMBER,
	   		   bno NUMBER,
	   		   type NUMBER,
	   		   id VARCHAR2(20),
	   		   name VARCHAR2(34) CONSTRAINT pr_name_nn NOT NULL,
	   		   msg CLOB CONSTRAINT pr_msg_nn NOT NULL,
	   		   regdate DATE DEFAULT SYSDATE,
	   		   CONSTRAINT pr_no_pk PRIMARY KEY(no),
	   		   CONSTRAINT pr_type_fk FOREIGN KEY(id)
	   		   REFERENCES project_member(id)
	   		   
	   		   CREATE SEQUENCE pr_no_seq 
	       */
	      public void replyInsert(MovieReviewVO vo)
	      {
	   	   try
	   	   {
	   		   // 1. 연결 
	   		   getConnection();
	   		   // 2. SQL문장 만들기  => SQL문장 (마이바티스)
	   		   String sql="INSERT INTO project_reply VALUES("
	   				     +"pr_no_seq.nextval,?,?,?,?,?,SYSDATE)";
	   		   // SQL문장을 미리 전송 
	   		   ps=conn.prepareStatement(sql);
	   		   // 나중에 ?에 값을 채운다 
	   		   ps.setInt(1, vo.getBno());
	   		   ps.setInt(2, vo.getType());
	   		   ps.setString(3, vo.getId());
	   		   ps.setString(4, vo.getName());
	   		   ps.setNString(5, vo.getMsg());
	   		   
	   		   // 실행 명령 
	   		   ps.executeUpdate(); //commit() 포함 
	   		   // setInt() setString() setDouble()
	   		 
	   		  
	   	   }catch(Exception ex)
	   	   {
	   		   ex.printStackTrace();
	   	   }
	   	   finally
	   	   {
	   		   disConnection();
	   	   }
	      }
	      // 댓글 수정 
	      public void replyUpdate(int no,String msg)
	      {
	   	   try
	   	   {
	   		   getConnection();
	   		   String sql="UPDATE project_reply SET "
	   				     +"msg=? "
	   				     +"WHERE no=?";
	   		   ps=conn.prepareStatement(sql);
	   		   ps.setString(1, msg);
	   		   ps.setInt(2, no);
	   		   ps.executeUpdate();
	   	   }catch(Exception ex)
	   	   {
	   		   ex.printStackTrace();
	   	   }
	   	   finally
	   	   {
	   		   disConnection();
	   	   }
	      }
	      // 댓글 삭제  => 70~80% => DAO
	      public void replyDelete(int no)
	      {
	   	   try
	   	   {
	   		   getConnection();
	   		   String sql="DELETE FROM project_reply WHERE no=?";
	   		   ps=conn.prepareStatement(sql);
	   		   ps.setInt(1, no);
	   		   ps.executeUpdate();
	   	   }catch(Exception ex)
	   	   {
	   		   ex.printStackTrace();
	   	   }
	   	   finally
	   	   {
	   		   disConnection();
	   	   }
	      }
	}
