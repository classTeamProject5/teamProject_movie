package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;

import com.sist.vo.CustomerFAQVO;
import com.sist.vo.CustomerNoticeVO;

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
	public List<CustomerNoticeVO> customerNoticeList(String type2)
	{
		List<CustomerNoticeVO> list=new ArrayList<CustomerNoticeVO>();
		try
		{
			getConnection();
			if(type2.equals("전체"))
			{
				String sql="SELECT type,title,regdate,hit,no "
						+ "FROM customer_notice "
						+ "WHERE all_type=? "
						+ "ORDER BY no DESC ";
				ps=conn.prepareStatement(sql);
				ps.setString(1, type2);
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
				String sql="SELECT type,title,regdate,hit,no "
						+ "FROM customer_notice "
						+ "WHERE type=? "
						+ "ORDER BY no DESC ";
				ps=conn.prepareStatement(sql);
				ps.setString(1, type2);
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
	public CustomerNoticeVO customerNoticeDetail(int no)
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
}
