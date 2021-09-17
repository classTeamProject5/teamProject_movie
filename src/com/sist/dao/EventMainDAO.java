package com.sist.dao;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.EventVO;
import com.sist.vo.EventWinnerVO;

public class EventMainDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private static EventMainDAO dao;

	public static EventMainDAO newInstance() {
		if (dao == null)
			dao = new EventMainDAO();
		return dao;
	}

	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp//env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
	/******************************************************************************************/
	public List<EventVO> eventMainDataList(String whatCategory, String whatFind) 
	   {
		   List<EventVO> list=new ArrayList<EventVO>();
		   try
		   {
			   getConnection();
			   String sql;
			   System.out.println("여기는DAO:"+whatCategory+","+whatFind);
			   if(whatFind==null) { //검색 데이터가 없을 때.
				   if(whatCategory=="전체") {
					   sql="SELECT * FROM event_main2 "
						   		+ "WHERE event_poster IS NOT NULL AND "
						   		+ "event_state = '진행중인 이벤트' "
						   		+ "ORDER BY event_term DESC";
				   }else {
					   sql="SELECT * FROM event_main2 "
						   		+ "WHERE event_poster IS NOT NULL AND "
						   		+ "event_state = '진행중인 이벤트' AND "
						   		+ "event_category = '" + whatCategory + "' "
						   		+ "ORDER BY event_term DESC";
				   }
			   }
			   else { //검색 데이터가 있을 때.
				   if(whatCategory=="전체") {
					   sql="SELECT * FROM event_main2 "
						   		+ "WHERE event_poster IS NOT NULL AND "
						   		+ "event_state = '진행중인 이벤트' AND "
						   		+ "event_title LIKE '%"+whatFind+"%' ORDER BY event_term DESC";
				   }else {
					   sql="SELECT * FROM event_main2 "
						   		+ "WHERE event_poster IS NOT NULL AND "
						   		+ "event_state = '진행중인 이벤트' AND "
						   		+ "event_category = '" + whatCategory + "' AND "
						   		+ "event_title LIKE '%"+whatFind+"%' ORDER BY event_term DESC";
				   }
			   }
			   
			   ps=conn.prepareStatement(sql);			
			   
			   // 실행 
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   EventVO vo=new EventVO();
				   vo.setMno(rs.getInt(1));
				   vo.setCategory(rs.getString(2));
				   vo.setPoster(rs.getString(3));
				   vo.setTitle(rs.getString(4));
				   vo.setTerm(rs.getString(5));
				   vo.setState(rs.getString(6));
				   vo.setContent(rs.getString(7));
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
	
	//지난이벤트 페이지 ***********************************************************************************************8
	// 지난이벤트페이지 페이징 : 이전 1page / totalpage 다음 스타일.
		public List<EventVO> eventLastEventData_Paging(int page, String whatFind){
			
			List<EventVO> list = new ArrayList<EventVO>();
			try {
				getConnection();
				String sql;
				System.out.println("들어온데이터 확인1: "+ whatFind);
				if(whatFind == null) {
					 sql="SELECT mno,event_category,event_poster,event_title,event_term,event_state,event_content,rnum "
						     +"FROM (SELECT mno,event_category,event_poster,event_title,event_term,event_state,event_content,rownum as rnum "
						     +"FROM (SELECT mno,event_category,event_poster,event_title,event_term,event_state,event_content "
						     +"FROM event_main2 WHERE event_poster IS NOT NULL AND event_state = '지난 이벤트' )) "
						     +"WHERE rnum BETWEEN ? AND ?";
				}else {
					sql="SELECT mno,event_category,event_poster,event_title,event_term,event_state,event_content,rnum "
						     +"FROM (SELECT mno,event_category,event_poster,event_title,event_term,event_state,event_content,rownum as rnum "
						     +"FROM (SELECT mno,event_category,event_poster,event_title,event_term,event_state,event_content "
						     +"FROM event_main2 WHERE event_poster IS NOT NULL AND event_state = '지난 이벤트' AND "
						     +"event_title LIKE '%" + whatFind + "%' )) "
						     +"WHERE rnum BETWEEN ? AND ?";
				}  	
				   ps=conn.prepareStatement(sql);
				   int rowSize=12;
				   int start=(rowSize*page)-(rowSize-1);
				   int end=rowSize*page;
				   ps.setInt(1, start);
				   ps.setInt(2, end);
				   
				   ResultSet rs=ps.executeQuery();
				   while(rs.next())
				   {
					   EventVO vo=new EventVO();
					   vo.setMno(rs.getInt(1));
					   vo.setCategory(rs.getString(2));
					   vo.setPoster(rs.getString(3));
					   vo.setTitle(rs.getString(4));
					   vo.setTerm(rs.getString(5));
					   vo.setState(rs.getString(6));
					   vo.setContent(rs.getString(7));
					   list.add(vo);
				   }
				   rs.close();
				   
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				disConnection();
			}			
			return list;
		}
		
		public int eventLastEventTotal_Paging(String whatFind) {
			   int total=0;
			   try
			   {
				   getConnection();
				   String sql;
				   System.out.println("들어온데이터 확인2: "+ whatFind);
				   
				   if(whatFind==null) {
					   sql="SELECT CEIL(COUNT(*)/12.0) FROM event_main2 "
					   		+ "WHERE event_poster IS NOT NULL AND "
					   		+ "event_state = '지난 이벤트'";
				   }else {
					   sql="SELECT CEIL(COUNT(*)/12.0) FROM event_main2 "
					   		+ "WHERE event_poster IS NOT NULL AND "
					   		+ "event_state = '지난 이벤트' AND "
					   		+ "event_title LIKE '%" + whatFind + "%'";
				   }
				   ps=conn.prepareStatement(sql);
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
		
		// 이벤트 상세보기 페이지 
		   public EventVO eventDetailData(int mno)
		   {
			   EventVO vo=new EventVO();
			   try{
				   getConnection();
				   String sql="SELECT * FROM event_main2 WHERE mno=?";
				   
				   ps=conn.prepareStatement(sql);			
				   ps.setInt(1, mno);
				   ResultSet rs=ps.executeQuery();
					rs.next();
				   // 실행 
				   
					   vo.setMno(rs.getInt(1));
					   vo.setCategory(rs.getString(2));
					   vo.setPoster(rs.getString(3));
					   vo.setTitle(rs.getString(4));
					   vo.setTerm(rs.getString(5));
					   vo.setState(rs.getString(6));
					   vo.setContent(rs.getString(7));
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
		   
		//*당첨자 페이지 ********************************************************************************************
		   public List<EventWinnerVO> boardListData() 
		   {
			   List<EventWinnerVO> list=new ArrayList<EventWinnerVO>();
			   try
			   {
				   getConnection();
				   String sql="SELECT * FROM event_winner_detail";
				   
				   ps=conn.prepareStatement(sql);			
				   
				   // 실행 
				   ResultSet rs=ps.executeQuery();
				   while(rs.next())
				   {
					   EventWinnerVO vo=new EventWinnerVO();
					   vo.setMno(rs.getInt(1));
					   vo.setCategory(rs.getString(2));
					   vo.setTitle(rs.getString(3));
					   vo.setRelease(rs.getString(4));
					   vo.setContent(rs.getString(5));
					   vo.setEvent_title(rs.getString(6));				   
					   vo.setGift(rs.getString(7));
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
		   
		   //* 이벤트 상세페이지 *******************************************************************
		   public EventWinnerVO eventBoardDetailData(int mno)
		   {
			   EventWinnerVO vo=new EventWinnerVO();
			   try{
				   getConnection();
				   String sql="SELECT * FROM event_winner_detail WHERE mno=?";
				   
				   ps=conn.prepareStatement(sql);			
				   ps.setInt(1, mno);
				   ResultSet rs=ps.executeQuery();
					rs.next();
				   // 실행 				   
					vo.setMno(rs.getInt(1));
					vo.setCategory(rs.getString(2));
					vo.setTitle(rs.getString(3));
					vo.setRelease(rs.getString(4));
					vo.setContent(rs.getString(5));
					vo.setEvent_title(rs.getString(6));				   
					vo.setGift(rs.getString(7));
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

}
