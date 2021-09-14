package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;

import com.sist.vo.CustomerFAQVO;
import com.sist.vo.CustomerNoticeVO;
import com.sist.vo.CustomerQNAVO;

import javax.naming.*;
public class CustomerDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static CustomerDAO dao;
	public static CustomerDAO newInstance()
	{
		if(dao==null)
			dao=new CustomerDAO();
		return dao;
	}
	public void getConnection()
	{
		try
		{
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp//env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	// faq데이터 출력
	public List<CustomerFAQVO> customerFAQList(String type)
	{
		List<CustomerFAQVO> list=new ArrayList<CustomerFAQVO>();
		try
		{
			getConnection();
			String sql="";
			if(type.equals("전체"))
			{
				sql="SELECT question,answer FROM customer_faq "
						+ "WHERE all_type=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, type);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					CustomerFAQVO vo=new CustomerFAQVO();
					
					vo.setQuestion(rs.getString(1));
					vo.setAnswer(rs.getString(2));
					list.add(vo);
				}
				rs.close();
			}
			else
			{
				sql="SELECT question,answer FROM customer_faq "
						+ "WHERE type=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, type);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					CustomerFAQVO vo=new CustomerFAQVO();
					
					vo.setQuestion(rs.getString(1));
					vo.setAnswer(rs.getString(2));
					list.add(vo);
				}
				rs.close();
			}
			
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
	//공지사항
	public void custmerNoticeInsert(CustomerNoticeVO vo)
	{
		try
		{
			getConnection();
			String sql="INSERT INTO customer_notice "
					+ "VALUES(no_seq.nextval,?,?,sysdate,?,0,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getType());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setString(4, "전체");
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
	public List<CustomerNoticeVO> customerNoticeList(String type2,int page)
	{
		List<CustomerNoticeVO> list=new ArrayList<CustomerNoticeVO>();
		try
		{
			getConnection();
			if(type2.equals("전체"))
			{
				String sql="SELECT type,title,regdate,hit,no,all_type,num "
						+ "FROM (SELECT type,title,regdate,hit,no,all_type,rownum as num "
						+ "FROM (SELECT type,title,regdate,hit,no,all_type "
						+ "FROM customer_notice ORDER BY no DESC)) "
						+ "WHERE all_type=? "
						+ "AND (num BETWEEN ? AND ?)";
				ps=conn.prepareStatement(sql);
				int rowSize=10;
				int start=(rowSize*page)-(rowSize-1);
	    		int end=rowSize*page;
	    		
				ps.setString(1, type2);
				ps.setInt(2, start);
				ps.setInt(3, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					CustomerNoticeVO vo=new CustomerNoticeVO();
					vo.setType(rs.getString(1));
					vo.setTitle(rs.getString(2));
					vo.setRegdate(rs.getDate(3));
					vo.setHit(rs.getInt(4));
					vo.setNo(rs.getInt(5));
					list.add(vo);
				}
				rs.close();
			}
			else 
			{ 
				String sql="SELECT type,title,regdate,hit,no,all_type,num " +
						"FROM (SELECT type,title,regdate,hit,no,all_type,rownum as num " +
						"FROM (SELECT type,title,regdate,hit,no,all_type " +
						"FROM customer_notice ORDER BY no DESC)) " + 
						"WHERE type=? " +
						"AND (num BETWEEN ? AND ?)"; 
				ps=conn.prepareStatement(sql);
				int rowSize=10;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page; ps.setString(1,type2); 
				ps.setInt(2, start);
				ps.setInt(3, end); ResultSet
				rs=ps.executeQuery();
				while(rs.next())
				{ 
					CustomerNoticeVO vo=new
					CustomerNoticeVO();
					vo.setType(rs.getString(1));
					vo.setTitle(rs.getString(2)); 
					vo.setRegdate(rs.getDate(3));
					vo.setHit(rs.getInt(4)); 
					vo.setNo(rs.getInt(5)); 
					list.add(vo); 
				}
				rs.close();
			  }
			 
			

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
	public int noticeTotalPage()
	{
		int total=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT CEIL(COUNT(*)/10.0) FROM customer_notice";
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
	public CustomerNoticeVO customerNoticeDetail(int no)
	{
		CustomerNoticeVO vo=new CustomerNoticeVO();
		try
		{
			getConnection();
			// 조회수 증가 
			
			String sql="UPDATE customer_notice SET "
				     +"hit=hit+1 "
				     +"WHERE no=?";
		    ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			sql="SELECT no,type,title,regdate,content,hit "
					+ "FROM customer_notice "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setType(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setRegdate(rs.getDate(4));
			vo.setContent(rs.getString(5));
			vo.setHit(rs.getInt(6));
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
	//detail 위아래목차
	public CustomerNoticeVO customerNoticeDetailud(int no)
	{
		CustomerNoticeVO vo=new CustomerNoticeVO();
		try
		{
			getConnection();
			String sql="SELECT no,type,title,regdate,content,hit "
					+ "FROM customer_notice "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setType(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setRegdate(rs.getDate(4));
			vo.setContent(rs.getString(5));
			vo.setHit(rs.getInt(6));
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
	public void qnaInsert(CustomerQNAVO vo)
	{
		try
		{
			getConnection();
			String sql="INSERT INTO customer_qna "
					+ "VALUES(qna_no.nextval,?,?,?,?,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getType());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getAlert());
			ps.setString(5, vo.getName());
			ps.setString(6, vo.getTel());
			ps.setString(7, vo.getEmail());
			
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
	public CustomerNoticeVO noticeUpdateData(int no)
	{
		   CustomerNoticeVO vo=new CustomerNoticeVO();
		   try
		   {
			   getConnection();
			   // 조회수 증가 
			   String sql="SELECT no,type,title,content "
				  +"FROM customer_notice "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setType(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setContent(rs.getString(4));
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
	public void noticeUpdate(CustomerNoticeVO vo)
	{
		try
		{
			getConnection();
			String sql="UPDATE customer_notice SET "
					+ "type=?,title=?,content=? "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getType());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getNo());
			ps.executeUpdate();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	public void noticeDelete(int no)
    {
		   
		   try
		   {
			   getConnection();
			   
			   String sql="DELETE FROM customer_notice "
					  +"WHERE no=?";
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
