package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import com.sist.vo.*;
import javax.naming.*;

public class ReserveDAO {
   private Connection conn;
   private PreparedStatement ps;
   private static ReserveDAO dao; // 싱글턴 패턴 (static:메모리 공간을 한개만 사용이 가능) => 재사용
   // Connection 주소 읽기 => Connection객체를 미리생성 => 생성시간을 줄여서 속도가 빠르게 만든다
   // 갯수 지정을 했기에 Connection객체 관리가 편하다 => 모든 웹사이트 개발는 95%가 DBCP를 사용한다
   // Connection 객체 얻기

   public void getConnection() {
      try {
         Context init = new InitialContext(); // 저장된 위치에 접근
         // JNDI (java naming directory interface)
         Context c = (Context) init.lookup("java://comp//env");
         DataSource ds = (DataSource) c.lookup("jdbc/oracle");
         conn = ds.getConnection();
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }

   // 사용후 반환 -> 다른사람이 재사용이 가능하게 만든다
   public void disConnection() {
      try {
         if (ps != null)
            ps.close();
         if (conn != null)
            conn.close();
      } catch (Exception ex) {
      }
   }

   // 싱글턴 패턴
   public static ReserveDAO newInstance() {
      if (dao == null) // 미생성시에는
         dao = new ReserveDAO();
      return dao; // 이미 만들어진 dao객체를 사용한다

   }
      
     
   //날짜
     public List<RegdateVO> regDateList() {
        List<RegdateVO> list = new ArrayList<RegdateVO>();
         try {
            getConnection();
            // 원하는 순서와 갯수만큼 잘라오기 => 인라인뷰 사용(rownum=순서를 변경)
            String sql = "SELECT regdate FROM movie_regdate where rno<= 9 "
                  + "ORDER BY regdate ASC";
          
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
               RegdateVO vo = new RegdateVO();            
      
               vo.setRegdate(rs.getString(1));            
               list.add(vo);
            }
            rs.close();
         } catch (Exception ex) {
            ex.printStackTrace();
         } finally {
            disConnection();
         }
         return list;
     }
     

     public List<MovieTimeVO> titleListData(String reg) {
        List<MovieTimeVO> list = new ArrayList<MovieTimeVO>();
        try {
            getConnection();
            String sql = "SELECT * from movie_timetable ";
            if(reg != null) {
               sql = " select * from(SELECT rank()over(PARTITION BY title order by no)rn" + 
                     ",movie_timetable.* from movie_timetable where regdate="+"'"+reg+"')";
            }
//            sql =select * from(SELECT rank()over(PARTITION BY title order by no)rn
//                  ,movie_timetable.* from movie_timetable where regdate='09-16(목)');
            ps = conn.prepareStatement(sql);

         
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               MovieTimeVO vo = new MovieTimeVO();            
               vo.setRn(rs.getInt(1));
               vo.setNo(rs.getInt(2));
               vo.setMno(rs.getInt(3));
               vo.setRegdate(rs.getString(4));
               vo.setTitle(rs.getString(5));
               vo.setTheater(rs.getString(6));
               vo.setStarttime(rs.getString(7));
               vo.setEndtime(rs.getString(8));
               vo.setTotalseat(rs.getInt(9));
               vo.setRemainseat(rs.getInt(10));
               vo.setGrade(rs.getString(11));
               list.add(vo);
            }
            rs.close();
         } catch (Exception ex) {
            ex.printStackTrace();
         } finally {
            disConnection();
         }
         return list;
      }
     
     public MovieTimeVO selectListData(int no) {
         MovieTimeVO vo = new MovieTimeVO();
         try {
             getConnection();
             String sql = "SELECT * FROM movie_timetable "
             		+ "WHERE no=?";
    
             ps = conn.prepareStatement(sql);
             ps.setInt(1, no);
          
             ResultSet rs = ps.executeQuery();
             rs.next();
                                   
                vo.setNo(rs.getInt(1));
                vo.setMno(rs.getInt(2));
                vo.setRegdate(rs.getString(3));
                vo.setTitle(rs.getString(4));
                vo.setTheater(rs.getString(5));
                vo.setStarttime(rs.getString(6));
                vo.setEndtime(rs.getString(7));
                vo.setTotalseat(rs.getInt(8));
                vo.setRemainseat(rs.getInt(9));
                vo.setGrade(rs.getString(10));
                             
             rs.close();
          } catch (Exception ex) {
             ex.printStackTrace();
          } finally {
             disConnection();
          }
          return vo;
       }
     
     //상영관 
     public List<MovieTimeVO> theaterData(){
        List<MovieTimeVO> list = new ArrayList<MovieTimeVO>();
         try {
            getConnection();           
            String sql = "SELECT DISTINCT theater from movie_timetable ORDER BY theater ASC";
            // where regdate= "?"
            
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               MovieTimeVO vo = new MovieTimeVO();            

               vo.setTheater(rs.getString(1));               
                     
               list.add(vo);
            }
            rs.close();
         } catch (Exception ex) {
            ex.printStackTrace();
         } finally {
            disConnection();
         }
         return list;
     }
     
     /*
NO               NOT NULL NUMBER       
ID                        VARCHAR2(20) 
TITLE                     VARCHAR2(50) 
SELECTED_THEATER          VARCHAR2(30) 
MOVIE_DATE                VARCHAR2(50) 
RUNNING_TIME              VARCHAR2(50) 
MOVIE_AGE                 VARCHAR2(60) 
SELECTED_SEAT             VARCHAR2(50) 
PAY_MONEY                 VARCHAR2(60) 
REGDATE                   VARCHAR2(40) 
      */
     //좌석 선택한값 인서트
     public void movieReservedata(ReserveVO vo){
         
          try {
        	  getConnection();
			  String sql="INSERT INTO movie_reserve VALUES("
					    +"(SELECT NVL(MAX(no)+1,1) FROM movie_reserve),"
					    +"?,?,?,?,?,?,?,?,SYSDATE)";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, vo.getId());
			  ps.setString(2, vo.getTitle());
			  ps.setString(3, vo.getSelected_theater());
			  ps.setString(4, vo.getMovie_date());
			  ps.setString(5, vo.getRunning_time());
			  ps.setString(6, vo.getMovie_age());
			  ps.setString(7, vo.getSelected_seat());
			  ps.setString(8, vo.getPay_money());
			  
			  
			  ps.executeUpdate();
   		  
          } catch (Exception ex) {
             ex.printStackTrace();
          } finally {
             disConnection();
          }
      }
                
    //마이페이지
     
     /*
NO               NOT NULL NUMBER       
ID                        VARCHAR2(20) 
TITLE                     VARCHAR2(50) 
SELECTED_THEATER          VARCHAR2(30) 
MOVIE_DATE                VARCHAR2(50) 
RUNNING_TIME              VARCHAR2(50) 
MOVIE_AGE                 VARCHAR2(60) 
SELECTED_SEAT             VARCHAR2(50) 
PAY_MONEY                 VARCHAR2(60) 
REGDATE                   VARCHAR2(40) 
      */
     public List<ReserveVO> mypageData(String id)
	  {
		  List<ReserveVO> list=new ArrayList<ReserveVO>();
		  try
		  {
			  getConnection();
			  String sql="SELECT no,id,title,selected_theater,movie_date,running_time,movie_age,selected_seat,pay_money,regdate "
					    +"FROM movie_reserve "
					    +"WHERE id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, id);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  ReserveVO vo=new ReserveVO();
				  vo.setNo(rs.getInt(1));
				  vo.setId(rs.getString(2));
				  vo.setTitle(rs.getString(3));
				  vo.setSelected_theater(rs.getString(4));
				  vo.setMovie_date(rs.getString(5));
				  vo.setRunning_time(rs.getString(6));
				  vo.setMovie_age(rs.getString(7));
				  vo.setSelected_seat(rs.getString(8));
				  vo.setPay_money(rs.getString(9));
				  vo.setRegdate(rs.getString(10));
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
     
     
     
     //=============================================
     //ajax
     
     public List<RegdateVO> regDate_List() {
         List<RegdateVO> list = new ArrayList<RegdateVO>();
          try {
             getConnection();
             // 원하는 순서와 갯수만큼 잘라오기 => 인라인뷰 사용(rownum=순서를 변경)
             String sql = "SELECT regdate FROM movie_regdate where rno<= 9 "
                   + "ORDER BY regdate ASC";
             // where regdate= "?"
           
             ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery();
             while (rs.next()) {
                RegdateVO vo = new RegdateVO();                   
                vo.setRegdate(rs.getString(1));            
                list.add(vo);
             }
             rs.close();
          } catch (Exception ex) {
             ex.printStackTrace();
          } finally {
             disConnection();
          }
          return list;
      }
     

     public List<MovieTimeVO> movie_ListData(String regdate)
	  {
		  List<MovieTimeVO> list=new ArrayList<MovieTimeVO>();
		  try
		  {
			  getConnection();
			  String sql="SELECT DISTINCT title,grade FROM movie_timetable WHERE regdate=?";
			  ps=conn.prepareStatement(sql);	
			  ps.setString(1, regdate);
			  
			  ResultSet rs=ps.executeQuery();
			  while(rs.next()) {			  
				  MovieTimeVO vo=new MovieTimeVO();
			
				  vo.setTitle(rs.getString(1));
				  vo.setGrade(rs.getString(2));
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
     
     
     public List<MovieTimeVO> allData(String regdate) {
         List<MovieTimeVO> list = new ArrayList<MovieTimeVO>();
         try {
             getConnection();
             String sql = "SELECT * from movie_timetable ";
             if(regdate != null) {
                sql = " select * from(SELECT rank()over(PARTITION BY title order by no)rn" + 
                      ",movie_timetable.* from movie_timetable where regdate="+"'"+regdate+"')";
             }
//             sql =select * from(SELECT rank()over(PARTITION BY title order by no)rn
//                   ,movie_timetable.* from movie_timetable where regdate='09-16(목)');
             ps = conn.prepareStatement(sql);

          
             ResultSet rs = ps.executeQuery();
             while (rs.next()) {
                MovieTimeVO vo = new MovieTimeVO();            
                vo.setRn(rs.getInt(1));
                vo.setNo(rs.getInt(2));
                vo.setMno(rs.getInt(3));
                vo.setRegdate(rs.getString(4));
                vo.setTitle(rs.getString(5));
                vo.setTheater(rs.getString(6));
                vo.setStarttime(rs.getString(7));
                vo.setEndtime(rs.getString(8));
                vo.setTotalseat(rs.getInt(9));
                vo.setRemainseat(rs.getInt(10));
                vo.setGrade(rs.getString(11));
                list.add(vo);
             }
             rs.close();
          } catch (Exception ex) {
             ex.printStackTrace();
          } finally {
             disConnection();
          }
          return list;
       }
     
     

     public List<MovieTimeVO> theaterData(String regdate,String title)
	  {
		  List<MovieTimeVO> list=new ArrayList<MovieTimeVO>();
		  try
		  {
			  getConnection();
			  String sql="SELECT DISTINCT theater,regdate FROM movie_timetable WHERE regdate=? AND title=?";
			  ps=conn.prepareStatement(sql);	
			  ps.setString(1, regdate);
			  ps.setString(2, title);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next()) {			  
				  MovieTimeVO vo=new MovieTimeVO();
			
				  vo.setTheater(rs.getString(1));
				  vo.setRegdate(rs.getString(2));
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
     
     
     public List<MovieTimeVO> timeData(String regdate,String theater)
	  {
		  List<MovieTimeVO> list=new ArrayList<MovieTimeVO>();
		  try
		  {
			  getConnection();
			  String sql="select no,starttime FROM movie_timetable WHERE regdate=? AND theater=?";
			  ps=conn.prepareStatement(sql);	
			  ps.setString(1, regdate);			  
			  ps.setString(2, theater);
			  
			  ResultSet rs=ps.executeQuery();
			  while(rs.next()) {			  
				  MovieTimeVO vo=new MovieTimeVO();
			
				  vo.setNo(rs.getInt(1));
				  vo.setStarttime(rs.getString(2));
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
     
     
     
}