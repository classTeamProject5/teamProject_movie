package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.EventVO;
import com.sist.vo.ViploungeVO;

public class ViploungeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static ViploungeDAO dao;

	public static ViploungeDAO newInstance() {
		if (dao == null)
			dao = new ViploungeDAO();
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
	
	/***********************************************************************************************************/
	
	 public ViploungeVO viploungeUserData(String idstr)
	   {
		   ViploungeVO vo=new ViploungeVO();
		   try{
			   getConnection();
			   String sql="SELECT * FROM membership_benefit WHERE userid=?"; //받아온 id와 userid가 같은 행의 데이터를 뽑아온다.
			   
			   ps=conn.prepareStatement(sql);			
			   ps.setString(1, idstr);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   vo.setMno(rs.getInt(1));
				   vo.setUserid(rs.getString(2));
				   vo.setUsergrade(rs.getString(3));
				   vo.setTotal_point(rs.getInt(4));
				   vo.setTotal_ticketnums(rs.getInt(5));
			   }
			   rs.close();
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }
		   finally {
			   disConnection();
		   }
		   return vo;
	   }
	 
	 
	 public ViploungeVO memberDataUpdate() {
		 
		ViploungeVO vo = new ViploungeVO();
		try {
			getConnection();
			String sql= "INSERT INTO membership_benefit(userid) SELECT id FROM project_member "
					+ "WHERE NOT EXISTS (SELECT userid FROM membership_benefit WHERE membership_benefit.userid = project_member.id)";
			ps=conn.prepareStatement(sql);			
			  
			   ResultSet rs=ps.executeQuery();
			   while(rs.next()){
					vo.setUserid(rs.getString(1));
					}
			   rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	 }
	
}
